#!/bin/sh

WORKDIR=/root/blog
cd ${WORKDIR}

# 如果当前目录为空，则新建一个博客网站
if [ "`ls -A $WORKDIR`" = "" ]; then
    echo ">>>>>>>>>>> 当前目录为空,初始化一个博客网站"
    hexo init ./
    echo ">>>>>>>>>>> 安装依赖和hexo插件"
    npm config set registry http://registry.npm.taobao.org/
    npm install
    # 插件安装写在这里
    npm install --save hexo-generator-searchdb \
        hexo-word-counter \
        hexo-generator-sitemap
    echo ">>>>>>>>>>> 安装Next主题"
    git clone https://github.com/next-theme/hexo-theme-next.git themes/next
    sed -i 's/theme: landscape/theme: next/g' _config.yml
else
    echo ">>>>>>>>>>> 使用已有的博客"
fi

# 清除缓存文件和已生成的静态文件
hexo clean
# 生成静态文件
hexo generate
# 启动服务器
hexo server -p ${HEXO_SERVER_PORT} -s
