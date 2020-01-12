@echo off
pushd "%~dp0"

powershell ^
  $PASSWORD=[Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR((Read-Host -Prompt 'Specify database SA account password' -AsSecureString))); ^
  $CONTAINER_ID=(docker.exe run -d --name trendyrags -e DATABASE_NAME=TrendyRags -e HOST_NAME=TrendyRagsDB -e USER_ID=sa -e PASSWORD=$PASSWORD -p 80:80 trendyrags:latest); ^
  Write-Host 'Press Ctrl+C to exit log watch'; ^
  docker.exe logs -f $CONTAINER_ID

:exit
popd
@echo on