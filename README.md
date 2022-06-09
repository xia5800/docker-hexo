# Docker部署hexo脚本


## 文件说明

```bash
.
├── Dockerfile              # docker镜像配置文件
├── docker-compose.yml      # docker-compose脚本
├── docker-entrypoint.sh    # 容器启动配置脚本
├── README.md
├── docs
│   └── CHANGE_LOG.md
└── shell
    ├── exec.sh             # 进入docker容器
    ├── logs.sh             # 查看容器日志
    ├── restart.sh          # 重启容器
    ├── stop.sh             # 停止容器
    └── start.sh            # 启动容器
```



## 初始化一个博客

1. 将本项目clone到```/home/blog```下

```bash
cd /home/blog
git clone https://github.com/xia5800/docker-hexo.git
```

2. 给shell脚本添加可执行权限

```bash
cd shell
chmod a+x *.sh
```

3. 启动

```bash
# 因为要初始化博客以及安装插件、主题等，可能需要等待比较长的一段时间 ps:容器成功启动不代表hexo已经启动完毕
./start.sh
```

4. 浏览器访问```http://服务器ip:8080```



## 更新博客

hexo启动成功之后，如果上传了新文章或者对以前的文章进行了更改, 只需要执行

```bash
cd shell
./restart.sh
```

即可对博客内容进行更新。

博客的存放路径为：`./data/blog/source/_posts`



## 查看博客运行日志
查看docker容器的日志

```bash
cd shell
./logs.sh
```



## 进入容器

某些时候，例如：`想给博客装一个hexo插件，但是我服务器上没有安装node`。
这个时候，可以进入容器，执行`npm install xxxx`

进入容器的方法
```bash
cd shell
./exec.sh
```



## 以下插件已经安装过了

已安装的插件,参考：[插件安装与配置](https://easyhexo.com/3-Plugins-use-and-config/)

```bash
# next主题本地搜索插件
npm install hexo-generator-searchdb --save
# 文章字数统计插件
npm install hexo-word-counter --save
# 生成sitemap插件
npm install hexo-generator-sitemap --save
```

已安装的主题

```bash
# next主题
git clone https://github.com/next-theme/hexo-theme-next.git themes/next
```





## 其它问题

> 如何修改配置？

修改了hexo或者主题的配置文件，只需要`./restart.sh`即可

```bash
cd ./data/blog/
# 修改配置
nano _config.yml
```

重启容器，使配置生效

```bash
cd /home/blog/shell
./restart.sh
```



> 如何安装主题？

**方法一（在容器外部修改）：**

进入`./data/blog/`

```bash
cd ./data/blog/
```

下载主题

```
# 前往主题目录
cd ./themes

# git clone 博客主题
git clone https://github.com/liuyib/hexo-theme-stun.git stun
```

配置主题，参考：[hexo-theme-stun 配置文档](https://liuyib.github.io/hexo-theme-stun/zh-CN/guide/quick-start.html)

```bash
# 修改theme: next为theme: stun
nano _config.yml
# 修改其它...
```

重启容器，使配置生效

```bash
cd /home/blog/shell
./restart.sh
```



**方法二（在容器内部修改）：**

进入容器

```bash
cd shell
./exec.sh
```

下载主题

```bash
# 前往主题目录
cd ./themes

# git clone 博客主题
git clone https://github.com/liuyib/hexo-theme-stun.git stun
```

配置主题，参考：[hexo-theme-stun 配置文档](https://liuyib.github.io/hexo-theme-stun/zh-CN/guide/quick-start.html)

```bash
# 修改theme: next为theme: stun
nano ../_config.yml
# 修改其它...

# 退出容器
exit
```

重启，使配置生效

```
./restart.sh
```