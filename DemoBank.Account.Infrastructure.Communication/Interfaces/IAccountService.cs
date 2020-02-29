using DemoBank.Account.Infrastructure.Data.Models;

namespace DemoBank.Account.Infrastructure.Communication
{
    public interface IAccountService
    {
        bool UpdateAccountBalance(TransactionModel transaction);
    }
}
