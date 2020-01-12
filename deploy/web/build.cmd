@echo off
pushd "%~dp0"

docker build -t trendyrags:latest -f Dockerfile ..\..\src

:exit
popd
@echo on