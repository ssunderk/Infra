FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY ["Engaze.Event.API/Engaze.Event.API.csproj", "Engaze.Event.API/"]
RUN dotnet restore "Engaze.Event.API/Engaze.Event.API.csproj"
COPY . .
WORKDIR "/src/Engaze.Event.API"
RUN dotnet build "Engaze.Event.API.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "Engaze.Event.API.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Engaze.Event.API.dll"]