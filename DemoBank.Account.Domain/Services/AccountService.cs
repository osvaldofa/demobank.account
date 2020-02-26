using DemoBank.Account.Domain.Interfaces;
using DemoBank.Account.Infrastructure.Data.Models;
using DemoBank.Account.Infrastructure.Data.Repositories;
using DemoBank.CrossCutting.Enumerators;

namespace DemoBank.Account.Domain.Services
{
    public class AccountService : IAccountService
    {
        // Data repository for Account objects.
        private readonly IAccountRepository _accountRepository;

        // Data repository for Customer objects.
        private readonly ICustomerRepository _customerRepository;

        /// <summary>
        /// Constructor method using dependency injection to instantiate local reference to Account Repository.
        /// </summary>
        /// <param name="accountRepository">Account Repository instantiated by dependency injection.</param>
        public AccountService(IAccountRepository accountRepository, ICustomerRepository customerRepository)
        {
            this._accountRepository = accountRepository;
            this._customerRepository = customerRepository;
        }

        /// <summary>
        /// Create a new account for an existing customer.
        /// </summary>
        /// <param name="account"></param>
        /// <returns></returns>
        public long CreateNewAccountForExistingUser(NewAccount account)
        {
            CustomerModel customer = _customerRepository.GetById(account.CustomerId);
            if (customer != null)
            {
                if (account.InitialCredit > 0)
                {
                    AccountModel newAccount = new AccountModel(0, customer, 0);
                    long accountNumber = this._accountRepository.Save(newAccount);

                    // Create a deposit transaction.
                    return accountNumber;
                }                
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
        /// Update account balance.
        /// </summary>
        /// <param name="transaction">Transaction to be executed over account.</param>
        /// <returns>Success status about transaction execution.</returns>
        public bool UpdateAccountBalance(TransactionModel transaction)
        {
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
                    default:
                        return false;
                }
                long accountNumber = this._accountRepository.Save(account);

                if (accountNumber > 0)
                    return true;
            }
            return false;            
        }
    }
}
