@echo off
pushd "%~dp0"

docker build -t trendyragdb:latest --build-arg DBNAMES=TrendyRags,TrendyRags2 .

:exit
popd
@echo on