using DemoBank.Account.Domain.Interfaces;
using DemoBank.Account.Domain.Services;
using DemoBank.Account.Infrastructure.Communication;
using DemoBank.Account.Infrastructure.Communication.Services;
using DemoBank.Account.Infrastructure.Data.Repositories;
using Microsoft.Extensions.DependencyInjection;

namespace DemoBank.Account.Api
{
    /// <summary>
    /// Startup extension methods.
    /// </summary>
    public abstract class InjectorBase
    {
        /// <summary>
        /// Configure dependency injections.
        /// </summary>
        /// <param name="service">Service collection instantiated on StartUp class.</param>
        public void ConfigureInjections(IServiceCollection service) 
        {
            // Configure dependency injection for Domain Services
            ConfigureServiceInjections(service);

            // Configure dependency injection for Repositories
            ConfigureRepositoryInjections(service);
        }

        private void ConfigureServiceInjections(IServiceCollection service)
        {
            // Attaching  Account service dependency injection.
            service.AddSingleton(typeof(IAccountService), typeof(AccountService));

            // Attaching external transaction service dependency injection.
            service.AddSingleton(typeof(ITransactionService), typeof(TransactionService));
        }

        private void ConfigureRepositoryInjections(IServiceCollection service)
        {
            // Attaching Account Repository for data access provider.
            service.AddSingleton(typeof(IAccountRepository), typeof(AccountRepository));

            // Attaching Customer Repository for data access provider.
            service.AddSingleton(typeof(ICustomerRepository), typeof(CustomerRepository));

            // Attaching Transaction Repository for data access provider.
            service.AddSingleton(typeof(ITransactionRepository), typeof(TransactionRepository));
        }
    }
}
