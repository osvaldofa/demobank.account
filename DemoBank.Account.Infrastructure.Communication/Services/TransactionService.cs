using DemoBank.Account.Infrastructure.Data.Models;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System.Net.Http;

namespace DemoBank.Account.Infrastructure.Communication.Services
{
    public class TransactionService : ITransactionService
    {
        private readonly ILogger<TransactionService> _logger;
        private readonly IConfiguration _config;
        private readonly HttpClient httpClient;

        public TransactionService(ILogger<TransactionService> logger, IConfiguration config)
        {
            this._logger = logger;
            this._config = config;
            this.httpClient = new HttpClient();
        }

        public bool CreateNewTransaction(TransactionModel transaction)
        {
            string transactionURL = this._config["TransactionServiceURL"];
            this._logger.LogInformation("----------> [TransactionService] Sending new transaction to " + transactionURL);

            HttpResponseMessage response = httpClient.PostAsJsonAsync(transactionURL, transaction).Result;

            if (response.IsSuccessStatusCode)
                return true;

            return false;
        }        
    }
}
