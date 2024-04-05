FROM mcr.microsoft.com/dotnet/sdk:8.0 as build

WORKDIR /app
COPY . ./
RUN dotnet publish FrontEnd/FrontEnd.csproj -c Release -o out/frontend; \
    dotnet publish BackEnd/BackEnd.csproj -c Release -o out/backend;

FROM mcr.microsoft.com/dotnet/aspnet:8.0 as backend
WORKDIR /app
COPY --from=build /app/out/backend .
ENTRYPOINT ["/app/BackEnd"]

FROM mcr.microsoft.com/dotnet/aspnet:8.0 as frontend
WORKDIR /app
COPY --from=build /app/out/frontend .
ENTRYPOINT ["/app/FrontEnd"]
