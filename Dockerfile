# Build stage
FROM microsoft/dotnet:2.1-sdk AS build-env

WORKDIR /generator

# restore
COPY api/api.csproj ./api/
RUN dotnet restore api/api.csproj
COPY tests/tests.csproj ./tests/
RUN dotnet restore tests/tests.csproj

# RUN ls -alR [if we have this line we dont have to do a docker run after the build to se the files that were copied]

# copy src
COPY . .

# tests
RUN dotnet test tests/tests.csproj
# publish



# Runtime stage