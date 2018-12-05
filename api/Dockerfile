# Build Stage
FROM microsoft/dotnet:2.1-sdk
WORKDIR /api

COPY api.csproj .
RUN dotnet restore

COPY . .
RUN dotnet publish -o /publish

# Runtime Image Stage
FROM microsoft/dotnet:2.1-aspnetcore-runtime
WORKDIR /publish
COPY . .
ENTRYPOINT ["dotnet", "api.dll"]
