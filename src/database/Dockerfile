# escape=`

# https://github.com/docker/labs/blob/master/windows/sql-server/Dockerfile.v1

FROM mcr.microsoft.com/windows/servercore:ltsc2019 AS sqlpackage
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV download_url="https://download.microsoft.com/download/6/E/4/6E406E38-0A01-4DD1-B85E-6CA7CF79C8F7/EN/x64/DacFramework.msi"

RUN Invoke-WebRequest -Uri $env:download_url -OutFile DacFramework.msi ; `
    Start-Process msiexec.exe -ArgumentList '/i', 'DacFramework.msi', '/quiet', '/norestart' -NoNewWindow -Wait; `
    Remove-Item -Force DacFramework.msi

FROM mssql2017:latest
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

COPY --from=sqlpackage ["C:\\Program Files\\Microsoft SQL Server\\140\\DAC", "C:\\Program Files\\Microsoft SQL Server\\140\\DAC"]

ARG DBNAME

ENV ACCEPT_EULA="Y" `
    DATA_PATH="C:\data" `
    DBNAME=${DBNAME}

VOLUME ${DATA_PATH}

WORKDIR C:\init
COPY Initialize-Database.ps1 .
ENTRYPOINT ["powershell", "./Initialize-Database.ps1", "-TargetDatabaseName", "$env:DBNAME"]

COPY ${DBNAME}.dacpac .
