# 更新日志
- 2022/07/27

  修改Dockerfile文件，解决容器时区问题。
  
  还有另一种解决时区问题的方案，不推荐windows用户使用
  ```yml
    volumes:
      - ./data/blog:/root/blog
      - /etc/localtime:/etc/localtime  # 设置时区
  ```

- 2022/06/07
  
  初始化博客的时候，安装一些自定义插件

- 2022/06/05
  
  优化了docker部署方案

  ps: 现在部署不再需要提供hexo的模板文件
  
- 2021/06/01
  
  更新了hexo版本 stun主题版本

