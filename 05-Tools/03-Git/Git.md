## 1、git push

> upstream不是针对远程仓库的，而是针对branch的
>
> 但是upstream和有几个远程库没有必然联系。比如远程库A上有3个分支branch1、branch2、branch3。
>
> 远程库B上有3个分支branchx、branchy、branchz。本地仓库有2个分支local1和local2。那么当初始状态时，local1和local2和任何一个分支都没有关联，也就是没有upstream。当通过git branch --set-upstream-to A/branch1 local1命令执行后，会给local1和branch1两个分支建立关联，也就是说local1的upstream指向的是branch1。这样的好处就是在local1分支上执行git push（git pull同理）操作时不用附加其它参数，Git就会自动将local1分支上的内容push到branch1上去。同样，local2分支也可以和远程库A和远程库B上的任何一个分支建立关联，只要给local2分支设置了upstream，就可以在local2分支上用git push（git pull同理）方便地与目标分支推拉数据。综上所述，upstream与有几个远程库没有关系，它是分支与分支之间的流通道。
>
> 再来说说git push -u和git branch --set-upstream-to指令之间的区别。
>
> 举个例子：我要把本地分支mybranch1与远程仓库origin里的分支mybranch1建立关联。
>
> （如果使用下列途径1的话，首先，你要切换到mybranch1分支上（git checkout mybranch1））
>
> 两个途径：1. git push -u origin mybranch1 2. git branch --set-upstream-to=origin/mybranch1 mybranch1
>
> 这两种方式都可以达到目的。但是1方法更通用，因为你的远程库有可能并没有mybranch1分支，这种情况下你用2方法就不可行，连目标分支都不存在，怎么进行关联呢？所以可以总结一下：git push -u origin mybranch1 相当于 git push origin mybranch1 + git branch --set-upstream-to=origin/mybranch1 mybranch1

```shell
## git push的完整命令
git push的一般形式为 git push <远程主机名> <本地分支名> : <远程分支名>
## 将本地分支推送到到远程，如果没有则远端创建一个新分支
git push -u origin localbranch
```

### 1.1 git push 错误

```shell
## 当远端有提交，本地分支提交时出现的错误解决方式
git pull origin master --allow-unrelated-histories
```

