using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Threading.Tasks;

namespace DemoBank.Account.Infrastructure.Data.Models
{
    [ExcludeFromCodeCoverage]
    public class NewAccount
    {
        public long CustomerId { get; set; }
        public double InitialCredit { get; set; }
    }
}
