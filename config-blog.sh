#!/bin/bash
docker rm -f hexo-blog
docker rmi hexo-blog
./init-blog.sh