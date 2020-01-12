@echo off
pushd "%~dp0"

docker build -t trendyrags:latest -f Dockerfile ..

:exit
popd
@echo on