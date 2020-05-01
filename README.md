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
git clone https://github.com/ylwnpzzn/docker-hexo.git
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