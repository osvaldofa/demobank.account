FROM microsoft/dotnet:2.2-sdk AS build-env
WORKDIR /

# Copy csproj and restore as distinct layers
COPY *.sln ./
#COPY nuget.config ./
#COPY DemoBank.Account.Presentation/DemoBank.Account.Api.csproj DemoBank.Account.Api/
COPY DemoBank.Account.Presentation/*.* DemoBank.Account.Api/
COPY DemoBank.Account.Domain/DemoBank.Account.Domain.csproj DemoBank.Account.Domain/
COPY DemoBank.Account.Data/DemoBank.Account.Infrastructure.Data.csproj DemoBank.Account.Infrastructure.Data/
COPY DemoBank.CrossCutting/DemoBank.Account.CrossCutting.csproj DemoBank.Account.CrossCutting/
COPY DemoBank.Test/DemoBank.Account.Test.csproj DemoBank.Account.Test/
COPY . ./
RUN dotnet restore

# Copy everything else and build
WORKDIR /DemoBank.Account.Api
RUN dotnet publish -c Release -o /app

# Build runtime image
FROM microsoft/dotnet:2.2-aspnetcore-runtime

WORKDIR /app
COPY --from=build-env /app .
ENTRYPOINT ["dotnet", "DemoBank.Account.Api.dll"]

EXPOSE 80