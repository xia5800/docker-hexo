ARG NODE_VERSION=14

FROM node:${NODE_VERSION}-alpine
# 更新系统
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update && apk upgrade
# 设置时区
RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && apk del tzdata
# 安装git、nano
RUN apk add git nano
# 配置淘宝镜像源
RUN npm config set registry http://registry.npm.taobao.org/
# 安装hexo脚手架
RUN npm install hexo-cli -g

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh

# 容器启动的时候执行的命令
ENTRYPOINT ["docker-entrypoint.sh"]