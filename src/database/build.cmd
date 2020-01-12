@echo off
pushd "%~dp0"

docker build -t trendyragsdb:latest --build-arg DBNAMES=TrendyRags .

:exit
popd
@echo on