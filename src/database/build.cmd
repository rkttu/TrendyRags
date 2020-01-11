@echo off
pushd "%~dp0"

docker build -t trendyragdb:latest --build-arg DBNAME=TrendyRags .

:exit
popd
@echo on