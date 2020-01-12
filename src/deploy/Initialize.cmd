@echo off
pushd "%~dp0"

powershell -Command .\Initialize-WebApp.ps1

C:\ServiceMonitor.exe w3svc

:exit
popd
@echo on