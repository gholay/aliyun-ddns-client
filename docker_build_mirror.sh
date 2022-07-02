#!/bin/bash
tag=`date '+%Y%m%d%H%M'`

docker build -t registry.cn-hangzhou.aliyuncs.com/crawl-dev/ddns:$tag .
docker push registry.cn-hangzhou.aliyuncs.com/crawl-dev/ddns:$tag
