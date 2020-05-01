#!/bin/bash
cd ./data
docker build -t hexo-blog:latest .
cd ../
docker-compose -f "docker-compose.yml" up -d