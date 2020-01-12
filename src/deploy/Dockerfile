# escape=`

# https://github.com/microsoft/aspnet-docker/blob/master/3.5-windowsservercore-ltsc2019/runtime/Dockerfile

FROM mcr.microsoft.com/dotnet/framework/runtime:3.5-windowsservercore-ltsc2019

RUN powershell -Command Add-WindowsFeature Web-Server & `
    powershell -Command Add-WindowsFeature Web-Asp-Net & `
    %windir%\System32\inetsrv\appcmd set apppool /apppool.name:DefaultAppPool /managedRuntimeVersion:v2.0 & `
    powershell -Command Remove-Item -Recurse C:\inetpub\wwwroot\* & `
    powershell -Command Invoke-WebRequest -Uri https://dotnetbinaries.blob.core.windows.net/servicemonitor/2.0.1.6/ServiceMonitor.exe -OutFile C:\ServiceMonitor.exe ;

EXPOSE 80

WORKDIR C:\init
COPY deploy\Initialize-WebApp.ps1 .
COPY deploy\Initialize.cmd .
ENTRYPOINT ["cmd", "/c", "/init/Initialize.cmd"]

HEALTHCHECK --interval=30s --timeout=20s --start-period=1s `
 CMD curl.exe http://localhost/

WORKDIR /inetpub/wwwroot
COPY web/ .
