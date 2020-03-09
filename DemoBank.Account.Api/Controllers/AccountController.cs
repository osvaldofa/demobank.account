﻿using DemoBank.Account.Infrastructure.Data.Models;
using Microsoft.AspNetCore.Mvc;
using DemoBank.Account.Domain.Interfaces;
using Microsoft.Extensions.Logging;
using System.Diagnostics.CodeAnalysis;

namespace DemoBank.Account.Api.Controllers
{
    /// <summary>
    /// Controller responsible for manage Account API.
    /// </summary>
    [Route("api/v1/account")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly ILogger _logger;
        private readonly IAccountService _accountService;

        /// <summary>
        /// Constructor method invoking dependency injection objects.
        /// </summary>
        /// <param name="accountService">Account Service object.</param>
        /// <param name="logger">Logger service object.</param>        
        public AccountController(IAccountService accountService, ILogger<AccountController> logger)
        {
            this._accountService = accountService;
            this._logger = logger;
        }

        /// <summary>
        /// POST endpoint for creation of new account for existing users.
        /// </summary>
        /// <param name="account">Account data (CustomerId and InitialBalance) for the new account.</param>
        /// <returns>Result of account creation (account number).</returns>
        [HttpPost]
        public ActionResult<string> CreateNewAccountForExistingUser(NewAccount account)
        {
            // Verify if the parameter is valid.
            if (VerifyAccountModel(account))
            {
                long accountNumber = _accountService.CreateNewAccountForExistingUser(account);
                if (accountNumber == 0)
                {
                    this._logger.LogError("---> Error creating new account - Customer not found.");
                    return BadRequest("Account not created - Customer not found."); //HTTP Code 400
                }

                this._logger.LogInformation("---> New account created with number " + accountNumber);
                return Created(accountNumber.ToString(), accountNumber.ToString()); //HTTP Code 201 - Created
            }
            this._logger.LogError("---> Error creating new account - Bad Request.");
            return BadRequest("[ERROR] Invalid object provided for account creation."); //HTTP Code 400    
        }

        /// <summary>
        /// Returns an Account object searchig by Account Number.
        /// </summary>
        /// <param name="accountNumber"></param>
        /// <returns>Account information.</returns>
        [HttpGet("{accountNumber}")]
        public ActionResult<AccountModel> GetAccount(long accountNumber)
        {
            AccountModel account = this._accountService.GetAccountById(accountNumber);
            if (account != null)
                return account;

            this._logger.LogError("---> Error searching for account " + accountNumber);
            return BadRequest("Account not found.");
        }

        /// <summary>
        /// Internal API used to synchronize account data during transaction processing in different services.
        /// </summary>
        /// <param name="accountNumber">Account number.</param>
        /// <param name="transaction">Transaction to be applied (deposit/withdraw)</param>
        /// <returns></returns>
        [HttpPut("{accountNumber}")]
        public ActionResult<bool> UpdateBalance(long accountNumber, [FromBody] TransactionModel transaction)
        {
            if (transaction?.DestinationAccount?.AccountNumber == accountNumber
                && accountNumber > 0)
            {
                if (this._accountService.UpdateAccountBalance(transaction))
                    return true;
            }
            return BadRequest(false);
        }

        /// <summary>
        /// Returns the entire accounts list.
        /// </summary>
        /// <returns>The accounts list.</returns>
        /// 
        [HttpGet]
        public ActionResult<AccountModel[]> GetAllAccounts()
        {
            return this._accountService.GetAll();
        }       

        [ExcludeFromCodeCoverage]
        private bool VerifyAccountModel(NewAccount account)
        {
            if (account?.CustomerId != null && account.CustomerId > 0 && account?.InitialCredit != null)
                return true;
            return false;
        }
    }
}
