using DemoBank.Account.Domain.Interfaces;
using DemoBank.Account.Domain.Services;
using DemoBank.Account.Infrastructure.Data.Models;
using DemoBank.Account.Infrastructure.Data.Repositories;
using DemoBank.Account.Api.Controllers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using NSubstitute;
using DemoBank.Account.Infrastructure.Communication;
using DemoBank.Account.CrossCutting.Enumerators;

namespace DemoBank.Test
{
    [TestClass]
    public class DemoBankAPITest
    {
        private ICustomerRepository customerRepository;
        private IAccountRepository accountRepository;

        private IAccountService accountService;
        private ITransactionService transactionService;

        private AccountController accountController;

        private ILogger<AccountController> accountLogger;
        private ILogger<AccountService> serviceLogger;        

        /// <summary>
        /// Initializes mock objects for test purposes.
        /// </summary>
        [TestInitialize]
        public void TestInitialization()
        {
            this.customerRepository = Substitute.For<ICustomerRepository>();            
            this.accountRepository = Substitute.For<IAccountRepository>();            

            this.accountLogger = Substitute.For<ILogger<AccountController>>();
            this.serviceLogger = Substitute.For<ILogger<AccountService>>();
            
            this.transactionService = Substitute.For<ITransactionService>();
            this.accountService = new AccountService(this.accountRepository, this.customerRepository, this.serviceLogger, this.transactionService);
            this.accountController = new AccountController(this.accountService, this.accountLogger);            
        }

        [TestCleanup]
        public void TestClean()
        {
            this.customerRepository = null;
            this.accountRepository = null;

            this.accountService = null;
        }       


        #region TEST METHODS

        /// <summary>
        /// Test the creation of new account for a valid customer.
        /// </summary>
        [TestMethod]
        public void TestCreateNewAccountWithValidCustomer()
        {
            // Set account repository mock.
            CustomerModel customer = new CustomerModel(1010, "John", "Doe");
            AccountModel newAccount = new AccountModel(0, customer, 0);

            this.accountRepository.Save(newAccount).ReturnsForAnyArgs(1001);
            this.customerRepository.GetById(1010).Returns(customer);

            NewAccount envelope = new NewAccount();
            envelope.CustomerId = 1010;
            envelope.InitialCredit = 0;            

            Assert.IsInstanceOfType(this.accountController.CreateNewAccountForExistingUser(envelope).Result, typeof(CreatedResult));
        }

        /// <summary>
        /// Test the creation of new account for an invalid customer.
        /// </summary>
        [TestMethod]
        public void TestCreateNewAccountWithInvalidCustomer()
        {
            // Set account repository mock.
            CustomerModel customer = new CustomerModel(1010, "John", "Doe");
            AccountModel newAccount = new AccountModel(0, customer, 0);

            this.accountRepository.Save(newAccount).ReturnsForAnyArgs(1001);
            this.customerRepository.GetById(1010).ReturnsForAnyArgs(a => null);

            NewAccount envelope = new NewAccount();
            envelope.CustomerId = 1010;
            envelope.InitialCredit = 0;

            Assert.IsNotInstanceOfType(this.accountController.CreateNewAccountForExistingUser(envelope).Result, typeof(CreatedResult));
        }

        /// <summary>
        /// Test the creation of new account for an invalid customer.
        /// </summary>
        [TestMethod]
        public void TestCreateNewAccountWithInvalidRequest()
        {
            NewAccount newAccount = new NewAccount();
            newAccount.InitialCredit = 100;
            
            Assert.IsInstanceOfType(this.accountController.CreateNewAccountForExistingUser(newAccount).Result, 
                typeof(BadRequestObjectResult));
        }


        /// <summary>
        /// Test account search by account number.
        /// </summary>
        [TestMethod]
        public void TestGetAccountByAccountNumber()
        {
            // Set account repository mock.
            CustomerModel customer = new CustomerModel(1010, "John", "Doe");
            AccountModel account = new AccountModel(1101, customer, 100);

            this.accountRepository.GetById(1101).Returns(account);
            AccountModel actual = this.accountController.GetAccount(1101).Value;
            Assert.AreEqual(1101, actual.AccountNumber);
        }

        /// <summary>
        /// Test account search by account number.
        /// </summary>
        [TestMethod]
        public void TestGetAccountByInvalidAccountNumber()
        {
            // Set account repository mock.
            CustomerModel customer = new CustomerModel(1010, "John", "Doe");
            AccountModel account = new AccountModel(1101, customer, 100);
            this.accountRepository.GetById(1101).Returns(account);

            Assert.AreEqual(null, this.accountController.GetAccount(1100).Value);
        }

        [TestMethod]
        public void TestUpdateAccountBalance()
        {
            // Set account repository mock.
            CustomerModel customer = new CustomerModel(1010, "John", "Doe");
            AccountModel account = new AccountModel(1101, customer, 100);
            TransactionModel transaction = new TransactionModel();
            transaction.DestinationAccount = account;
            transaction.TransactionType = TransactionTypes.DEPOSIT;
            transaction.Value = 100;

            this.accountRepository.GetById(1101).Returns(account);
            this.accountRepository.Save(account).ReturnsForAnyArgs(1101);
            
            Assert.IsTrue(this.accountController.UpdateBalance(1101, transaction).Value);
        }

        [TestMethod]
        public void GetAllAccounts()
        {
            // Set account repository mock.
            CustomerModel customer = new CustomerModel(1010, "John", "Doe");
            AccountModel account = new AccountModel(1101, customer, 100);
            AccountModel[] accounts = new AccountModel[] { account };
            this.accountRepository.GetAll().ReturnsForAnyArgs(accounts);

            Assert.AreEqual(this.accountController.GetAllAccounts().Value.Length, 1);
        }        

        #endregion

    }
}
