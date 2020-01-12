@echo off
pushd "%~dp0"

powershell ^
  $SA_PASSWORD=[Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR((Read-Host -Prompt 'Specify SA account password' -AsSecureString))); ^
  $CONTAINER_ID=(docker.exe run -d --name trendyragsdb -e SA_PASSWORD=$SA_PASSWORD -v C:\database:C:\data -p 1433:1433 trendyragsdb:latest); ^
  Write-Host 'Press Ctrl+C to exit log watch'; ^
  docker.exe logs -f $CONTAINER_ID

:exit
popd
@echo on