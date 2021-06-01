# Docker部署hexo脚本


## 目录说明

```bash
blog
├── data  # 存放你的hexo博客根目录下所有内容
├── source # 存放你的hexo博客的source文件夹下的内容
└── themes # 存放你的hexo博客的themes的内容
```


## 食用方法：

1. 将本项目clone到```/home/blog```下

```bash
cd /home/blog
git clone https://github.com/xia5800/docker-hexo.git
```

2. 给shell脚本添加可执行权限

```bash
chmod +a *.sh
```

3. 初始化

```bash
./init-blog.sh
```

4. 浏览器访问```http://服务器ip:8080```



## 更新博客

博客启动成功之后，如果上传了新文章或者对以前的文章进行了更改, 只需要执行

```bash
./restart-blog.sh
```

即可对博客内容进行更新。

如果修改了主题或者hexo的配置文件，则需要执行

```bash
./config-blog.sh
```

**注意**：新文章请上传到```/blog/source/_posts```文件夹下，上传到```/blog/data/source/_posts```文件夹无效



## 替换成你的博客

本项目的hexo博客为刚刚初始化的博客，如果你需要替换成自己已有的博客。需要做如下操作

- 将你的hexo博客根目录下的所有文件（不包括```node_modules```文件夹），替换```/data```下的内容。注意保留Dockerfile文件
- 将你的hexo博客source目录下的所有文件，替换```/source```下的内容。
- 将你的hexo博客themes目录下的所有文件，替换```/themes```下的内容。



## 修改你的配置

如果你的hexo路径不在```/home/blog```下，则需要将```docker-compose.yml```文件内的```/home/blog/source```和```/home/blog/themes```修改成你的路径。



## 以下插件已经安装过了

```bash
# stun主题
git clone https://github.com/liuyib/hexo-theme-stun.git themes/stun
npm install hexo-render-pug --save
# 生成atom.xml 开启rss功能
npm install hexo-generator-feed --save
# 文章预计的阅读时间、文章字数统计
npm install hexo-wordcount --save
# 生成sitemap
npm install hexo-generator-sitemap --save
# 博客本地搜索功能
npm install hexo-generator-search --save
# Markdown emoji语法支持 与其他插件冲突，建议从http://emojihomepage.com/这个网站复制粘贴emoji
# npm install hexo-filter-github-emojis --save
# live2d动画支持
npm install hexo-helper-live2d --save
# 音视频播放插件
npm install hexo-tag-mmedia --save
# 图片插件
npm install hexo-asset-image --save
```

## live2d模型库
[https://github.com/xiazeyu/live2d-widget-models](https://github.com/xiazeyu/live2d-widget-models)


## 配置文档

- [hexo官方文档](https://hexo.io/zh-cn/docs/)
- [hexo-theme-stun 配置文档](https://liuyib.github.io/hexo-theme-stun/zh-CN/guide/quick-start.html)
- [hexo插件使用与配置](https://easyhexo.com/3-Plugins-use-and-config/)
