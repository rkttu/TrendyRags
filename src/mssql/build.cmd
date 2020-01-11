@echo off
pushd "%~dp0"

docker build -t mssql2017:latest .

:exit
popd
@echo on