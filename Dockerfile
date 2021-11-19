# Use Microsoft's official build .NET image.
FROM mcr.microsoft.com/dotnet/core/sdk:2.1-alpine AS build
WORKDIR /app

# Copy local code to the container image.
COPY . .
WORKDIR /app/AspNetCoreWebAppK8s/

# Install production dependencies.
RUN dotnet restore

# Build a release artifact.
RUN dotnet publish -c Release -o out

# Use Microsoft's official runtime .NET image.
FROM mcr.microsoft.com/dotnet/core/aspnet:2.1-alpine AS runtime
WORKDIR /app
COPY --from=build /app/AspNetCoreWebAppK8s/out ./

# Make sure the app binds to port 8080
ENV ASPNETCORE_URLS http://*:8080

# Run the web service on container startup.
ENTRYPOINT ["dotnet", "AspNetCoreWebAppK8s.dll"]
