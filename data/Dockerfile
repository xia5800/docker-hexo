FROM node:14
# 切换工作空间为
WORKDIR /root/blog
# 拷贝json文件
COPY package*.json ./
# 配置淘宝镜像源
RUN npm config set registry http://registry.npm.taobao.org/
# 安装hexo脚手架
RUN npm install hexo-cli -g
# 安装依赖
RUN npm install
# 拷贝博客所有内容到容器
COPY . .
# 开放4000端口
EXPOSE 4000
# 容器启动的时候执行的命令
ENTRYPOINT ["hexo","clean"]
ENTRYPOINT ["hexo","s"]