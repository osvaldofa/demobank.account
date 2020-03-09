using System.Diagnostics.CodeAnalysis;

namespace DemoBank.Account.CrossCutting.Enumerators
{
    [ExcludeFromCodeCoverage]
    public static class TransactionTypes
    {
        public const string DEPOSIT = "deposit";
        public const string WITHDRAW = "withdraw";
        public const string TRANSFER = "transfer";
    }
}
