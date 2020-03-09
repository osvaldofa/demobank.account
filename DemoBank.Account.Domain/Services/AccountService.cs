using DemoBank.Account.Domain.Interfaces;
using DemoBank.Account.Infrastructure.Data.Models;
using DemoBank.Account.Infrastructure.Data.Repositories;
using DemoBank.Account.CrossCutting.Enumerators;
using Microsoft.Extensions.Logging;
using DemoBank.Account.Infrastructure.Communication;
using System.Diagnostics.CodeAnalysis;

namespace DemoBank.Account.Domain.Services
{
    [ExcludeFromCodeCoverage]
    public class AccountService : IAccountService
    {
        // Data repository for Account objects.
        private readonly IAccountRepository _accountRepository;

        // Data repository for Customer objects.
        private readonly ICustomerRepository _customerRepository;

        // Logger component.
        private readonly ILogger<AccountService> _logger;

        // Transaction service integration.
        private readonly ITransactionService _transactionService;

        /// <summary>
        /// Constructor method using dependency injection to instantiate local reference to Account Repository.
        /// </summary>
        /// <param name="accountRepository">Account Repository instantiated by dependency injection.</param>
        /// <param name="customerRepository">Customer Repository instantiated by dependency injection.</param>
        /// <param name="logger">Logger component instantiated by dependency injection.</param>
        /// <param name="transactionService">Transaction service integration instantiated by dependency injection.</param>
        public AccountService(IAccountRepository accountRepository, ICustomerRepository customerRepository, ILogger<AccountService> logger, ITransactionService transactionService)
        {
            this._accountRepository = accountRepository;
            this._customerRepository = customerRepository;
            this._logger = logger;
            this._transactionService = transactionService;
        }

        /// <summary>
        /// Create a new account for an existing customer.
        /// </summary>
        /// <param name="account"></param>
        /// <returns></returns>
        public long CreateNewAccountForExistingUser(NewAccount account)
        {
            this._logger.LogInformation("-----> [AccountService] Creating a new account for an existing user: " + account.CustomerId);
            CustomerModel customer = _customerRepository.GetById(account.CustomerId);
            long accountNumber = 0;
            if (customer != null)
            {
                AccountModel newAccount = new AccountModel(0, customer, 0);
                accountNumber = this._accountRepository.Save(newAccount);
                this._logger.LogInformation("-----> [AccountService] Account created: " + accountNumber);

                // If creation presents an initial credit, create a deposit transaction.
                if (account.InitialCredit > 0)
                {
                    this._logger.LogInformation("-----> [AccountService] Account created with initial credit. Creating new deposit transaction. ");
                    TransactionModel transaction = new TransactionModel();
                    newAccount.AccountNumber = accountNumber;
                    transaction.DestinationAccount = newAccount;
                    transaction.TransactionType = TransactionTypes.DEPOSIT;
                    transaction.Value = account.InitialCredit;

                    if (!this._transactionService.CreateNewTransaction(transaction))
                        return 0;
                }
                return accountNumber;
            }
            return 0;
        }

        /// <summary>
        /// Search an existing account by account number.
        /// </summary>
        /// <param name="accountId">Account number.</param>
        /// <returns></returns>
        public AccountModel GetAccountById(long accountId)
        {
            return this._accountRepository.GetById(accountId);
        }

        /// <summary>
        /// Gets all accounts.
        /// </summary>
        /// <returns>Accounts list.</returns>
        public AccountModel[] GetAll()
        {
            return this._accountRepository.GetAll();
        }

        /// <summary>
        /// Update account balance.
        /// </summary>
        /// <param name="transaction">Transaction to be executed over account.</param>
        /// <returns>Success status about transaction execution.</returns>
        public bool UpdateAccountBalance(TransactionModel transaction)
        {
            long accountNumber = 0;

            if (transaction?.DestinationAccount?.AccountNumber > 0
                && transaction.Value > 0 && !string.IsNullOrEmpty(transaction.TransactionType))
            {
                AccountModel account = this._accountRepository.GetById(transaction.DestinationAccount.AccountNumber);

                switch (transaction?.TransactionType)
                {
                    case TransactionTypes.DEPOSIT:
                        account.Balance += transaction.Value;
                        break;
                    case TransactionTypes.WITHDRAW:
                        if (account.Balance >= transaction.Value)
                            account.Balance -= transaction.Value;
                        else
                            return false;
                        break;
                    case TransactionTypes.TRANSFER:
                        AccountModel originAccount = this._accountRepository.GetById(transaction.OriginAccount.AccountNumber);
                        accountNumber = Transfer(originAccount, account, transaction.Value);
                        break;
                    default:
                        return false;
                }
                accountNumber = this._accountRepository.Save(account);

                if (accountNumber > 0)
                    return true;
            }
            return false;            
        }

        private long Transfer(AccountModel origin, AccountModel destination, double value)
        {
            AccountModel destinationAccount = this._accountRepository.GetById(destination.AccountNumber);
            AccountModel originAccount = this._accountRepository.GetById(origin.AccountNumber);

            long accountConfirmation = 0;

            if (originAccount != null && destinationAccount != null)
            {
                if (originAccount.Balance >= value)
                {
                    originAccount.Balance -= value;
                    destinationAccount.Balance += value;

                    if (this._accountRepository.Save(originAccount) > 0)
                        accountConfirmation = this._accountRepository.Save(destinationAccount);
                }
            }
            return accountConfirmation;
        }
    }
}
