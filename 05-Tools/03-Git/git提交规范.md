## git使用规范

### 1、git commit -m'update message'

> 约束提交的内容

```shell
# 主要type
feat:     增加新功能
fix:      修复bug
```

### 2、分支的使用

#### 2.1 首次从远端master中获取

```shell
## （1） 拉取master上的代码
git clone xxxxx.git
## (2)  本地创建分支
git checkout -b  dev-branchNamenp
## (3) 本地首次提交代码 [当前未创建远程分支]
git add .
git commit -m'feat: 新加xxx功能'
git push -u origin dev-branchName  ## 远程会自动创建分支
## (4) 提交代码：【本地关联的远程分支已存在】
git pull # 拉取远程更新，有冲突的情况进行冲突合并
git add .
git commit -m'feat: 新加xxx功能'
git push
```

#### 2.2 协同开发

> B要在A开发的分支上进行协同开发

```shell
## （1） 拉取master上的代码
git clone xxxxx.git
## (2)  本地创建分支[dev-branchName:本地分支名称； remoteBranchName：远程分支名称]
git checkout -b  dev-branchName origin/remoteBranchName
```

