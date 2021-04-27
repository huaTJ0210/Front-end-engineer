

#### 1、基本搭建

[从零到一实现前后端分离项目的gitlab-ci流程](https://segmentfault.com/a/1190000019727657?utm_source=sf-related)

#### 2、gitlab-ci.yml文件

> 微信小程序自动化部署
>
> [微信小程序自动部署](https://zhuanlan.zhihu.com/p/141423748)

```yml
stages:
  - build
  - deploy

build_job:
  stage: build 
  only:
    - master
  tags:
# tags 指定 runner,因为有很多个 gitlab runner，而且都是 lunix，
#你需要用到 window 那台机器，这个不知道咋配的时候，可以问问运维
    - window
  script:
    - npm run build # 如果是 uniapp 或者 其他类似，需要构建的，要用这个命令，如果是原生的，不需要这个

deploy:
  stage: deploy
  only:
    - master
  tags:
    - window
  script:
    - C:\xxx\wechatDevTool\cli.bat -u 0.1.0 --upload-desc 最新的描述 # 这里使用微信开发者工具提供的命令行工具进行上传体验
```

