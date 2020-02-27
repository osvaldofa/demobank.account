FROM microsoft/dotnet:2.2-sdk AS build-env
WORKDIR /

# Copy csproj and restore as distinct layers
COPY *.sln ./
COPY DemoBank.Services.Account.Api/*.* DemoBank.Services.Account.Api/

COPY DemoBank.Services.Account.Domain/*.* DemoBank.Services.Account.Domain/
COPY DemoBank.Services.Account.Data/*.* DemoBank.Services.Account.Data/
COPY DemoBank.Services.CrossCutting/*.* DemoBank.Services.CrossCutting/
COPY DemoBank.Services.Test/*.* DemoBank.Services.Test/

COPY . ./
RUN dotnet restore

# Copy everything else and build
WORKDIR /DemoBank.Services.Account.Api
RUN dotnet publish -c Release -o /app

# Build runtime image
FROM microsoft/dotnet:2.2-aspnetcore-runtime

WORKDIR /app
COPY --from=build-env /app .
ENTRYPOINT ["dotnet", "DemoBank.Services.Account.Api.dll"]

EXPOSE 80
