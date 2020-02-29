using DemoBank.Account.Infrastructure.Data.Models;

namespace DemoBank.Account.Infrastructure.Communication
{
    public interface ITransactionService
    {
        bool CreateNewTransaction(TransactionModel transaction);
    }
}
