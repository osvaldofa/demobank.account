FROM microsoft/dotnet:2.2-sdk AS build-env
WORKDIR /

# Copy csproj and restore as distinct layers
COPY *.sln ./
COPY DemoBank.Account.Api/*.* DemoBank.Account.Api/
COPY DemoBank.Account.Domain/*.* DemoBank.Account.Domain/
COPY DemoBank.Account.Infrastructure.Data/*.* DemoBank.Account.Infrastructure.Data/
COPY DemoBank.Account.CrossCutting/*.* DemoBank.Account.CrossCutting/
COPY DemoBank.Account.Test/*.* DemoBank.Account.Test/

COPY . ./
RUN dotnet restore

# Copy everything else and build
WORKDIR /DemoBank.Account.Api
RUN mv appsettings.Docker.json appsettings.json
RUN dotnet publish -c Release -o /app

# Build runtime image
FROM microsoft/dotnet:2.2-aspnetcore-runtime

WORKDIR /app
COPY --from=build-env /app .
ENTRYPOINT ["dotnet", "DemoBank.Account.Api.dll"]

EXPOSE 80
