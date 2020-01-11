@echo off
pushd "%~dp0"

set SA_PASSWORD=
docker run -d --name trendyragsdb -e SA_PASSWORD=%SA_PASSWORD% -v C:\database:C:\data -p 1433:1433 trendyragdb:latest

:exit
popd
@echo on