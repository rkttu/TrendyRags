@echo off
pushd "%~dp0"

docker build -t trendyragsdb:latest --build-arg DBNAMES=TrendyRags -f Dockerfile ..\..\src

:exit
popd
@echo on