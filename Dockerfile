FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build

MAINTAINER Manh Le

WORKDIR /app
COPY . ./
RUN dir

RUN dotnet restore

RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 AS runtime
WORKDIR /app
COPY --from=build /app .


WORKDIR /app/FirstMVCCore/out
EXPOSE 8080/tcp
ENV ASPNETCORE_URLS http://*:8080
ENTRYPOINT ["dotnet","FirstMVCCore.dll"]