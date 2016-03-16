title: Git
date: 2016-03-11 10:54:12
tags: 
- Git
- Github
- SourceTree
- TAC
- 同济大学苹果俱乐部
categories: 教程
---

# 什么是Git

Git是世界上最先进、最好用的分布式版本控制系统（没有之一）。

如果没有版本控制工具，我们的项目合作也许只能一个人写完另一个接着写，或者同时写最后手动合并的方式来进行合作，显而易见，这会浪费大量的时间，还容易出错。因此Git的宗旨就是让我们在项目中更加方便地进行版本控制。

<!--more-->

> **Git vs SVN**
> 版本控制分为集中式和分布式两种。老牌版本控制系统如SVN和CVS都是集中式版本控制系统，所谓集中式，就是指干活的时候都要先从中央服务器取得新的版本，然后开始干活，干完了再把自己的活推送给中央服务器。最大的缺陷就是必须要联网，一旦中央服务器宕机，谁都别想干活。
>
>  而分布式版本控制中，客户端并不只提取最新版本的文件快照，而是把代码仓库完整地镜像下来。 这么一来，任何一处协同工作用的服务器发生故障，事后都可以用任何一个镜像出来的本地仓库恢复。 因为每一次的克隆操作，实际上都是一次对代码仓库的完整备份。每个人电脑上都有完整的版本库，在多人合作时对相同文件进行修改后，只需要把修改推送给对方。
> 
> 分布式版本控制系统的安全性要高很多，因为每个人电脑里都有完整的版本库，某一个人的电脑坏掉了不要紧，随便从其他人那里复制一个就可以了。而集中式版本控制系统的中央服务器的硬盘要是出了问题，所有人都没法干活了，因为每个人手上只有各自机器上单独的快照。
> 
> 另外，Git还有更强大的分支管理，还不会像CVS一样由于自身设计的缺陷导致提交文件有时候不完整或者版本库莫名损坏的情况。




<!--more-->


# 为什么使用Github

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2016.20.54.png)

很多人不明白Git和Github是什么关系，其实很简单，Github是Git的一个社区，很多程序员把自己的项目在Github上托管。

有很多优秀的程序员把自己的项目或者Framework在Github上面开源，让其他程序员来共享。也正是因为程序员之间这种共享的精神，才使得今天IT业发展的如此迅速。

当然除了Github还有很多可以托管Git项目的社区，比如**Bitbucket**,再如天朝的**Coding**，**gitcafe**(刚刚被Coding收购)等等。笔者使用过Gitcafe，从速度的角度讲，在国内使用绝对比Github方便。但是我还是更加偏向读者使用Github，为什么呢？

1. 社区最重要的是人气，而Github在使用人数上远远多于天朝的几大社区，毕竟Github全球程序员都在使用，而且人家在墙外也不会因为网速问题而纠结╮(╯_╰)╭
2. 人多的最大好处是开源的项目多，在Github上打一个关键词如`UIButton`会出现很多很多的结果，其中不乏优秀的可供我们学习和使用的框架。
![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2016.21.43.png)
3. 另外程序员很有互相帮助的精神，如果你对某个项目提出一个issue，很有可能很快就有人为你解答疑惑。
4. 有人说Github是程序员的门面，在Github上如果有一个star很多的项目对于程序员来说是一种极大的肯定。
5. Github还有很多其它的作用，比如本博客就是托管在Github上的Github Pages，（引擎是Hexo），再比如方便多人协作写书的Gitbook，著名的[***Swift中文版***](https://www.gitbook.com/book/numbbbbb/-the-swift-programming-language-/details)就是一群喜爱iOS编程的大牛托管在Gitbook上面的，不过现在因为国内访问太慢已经迁移到了国内服务器。
![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2016.19.23.png)



# Git Start

好了，扯了一堆没用的，该说重点了，这里只讲如何在Mac OSX上配置Git。

## 安装git

本文将介绍两种安装git的方式。

### 利用CommandLineTool

苹果公司提供了一种极为简便的方式安装Git，那就是安装Xcode的CommandLineTool。安装方式有很多，可以从官网下载（本方法在此不详述），也可以在terminal（终端）中直接输入

```
 xcode-select --install 
```

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2016.39.41.png)

然后如上图会弹出一个对话框问我们是否要安装，我们选择`安装`。安装过程有点慢，安装好以后可以在下面的路径检查是否安装成功。

`/Library/Developer/CommandLineTools/`

> 注意是根路径的Library不是~/Library

安装好CommandLineTool以后我们其实不只是安装了Git,也安装了下列命令行的命令，是不是很方便？

> ar
as
asa
bison
BuildStrings
c++
c89
c99
cc
clang
clang++
cmpdylib
codesign_allocate
CpMac
cpp
ctags
ctf_insert
DeRez
dsymutil
dwarfdump
dyldinfo
flex
flex++
g++
gatherheaderdoc
gcc
gcov
GetFileInfo
git
git-cvsserver
git-receive-pack
git-shell
git-upload-archive
git-upload-pack
gm4
gnumake
gperf
hdxml2manxml
headerdoc2html
indent
install_name_tool
ld
lex
libtool
lipo
lldb
lorder
m4
make
MergePef
mig
mkdep
MvMac
nasm
ndisasm
nm
nmedit
otool
pagestuff
projectInfo
ranlib
rebase
redo_prebinding
ResMerger
resolveLinks
Rez
RezDet
RezWack
rpcgen
segedit
SetFile
size
SplitForks
strings
strip
svn
svnadmin
svndumpfilter
svnlook
svnrdump
svnserve
svnsync
svnversion
unifdef
unifdefall
UnRezWack
unwinddump
what
xml2man
yacc



### homebrew安装

另外我们也可通过homebrew来安装git，首先你得有homebrew，啥？没有？

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

如果有了homebrew，来！

```
brew install git
```

到此我们就安装好了git。

## 配置全局账号

安装好Git之后我们打开terminal，输入

```
git --version
```

会显示我们安装的git的版本，笔者安装的版本是`git version 2.5.4 (Apple Git-61)`

然后我们来配一下全局环境。

```
# 用户名
git config --global user.name "Your name here"

# 邮箱
git config --global user.email "your_name@domain.com"
```

## 注册Github账号
如果你还没有在Github注册过账号，那还等啥？快去 [***Github 官网***](http://www.github.com/)  注册吧！

## 绑定SSH

<!--配置了SSH，相当于让Github知道哪些电脑是你的授权电脑，每次从github上执行`git clone` `git pull` `git push`等指令的时候就不必输入密码了！-->

为了向 Git 服务器提供 SSH 公钥，如果某系统用户尚未拥有密钥，必须事先为其生成一份。 这个过程在所有操作系统上都是相似的。 首先，你需要确认自己是否已经拥有密钥。 默认情况下，用户的 SSH 密钥存储在其 `~/.ssh` 目录下。 进入该目录并列出其中内容，你便可以快速确认自己是否已拥有密钥：

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2019.44.36.png)

我们需要寻找一对以 `id_dsa` 或 `id_rsa ` 命名的文件，其中一个带有 `.pub` 扩展名。 `.pub` 文件是你的公钥，另一个则是私钥。 如果找不到这样的文件（或者根本没有 `.ssh` 目录），你可以通过运行 `ssh-keygen` 程序来创建它们。在 `Linux/Mac` 系统中，`ssh-keygen` 随`SSH ` 软件包提供；在 `Windows ` 上，该程序包含于 `MSysGit ` 软件包中。

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2019.50.22.png)

> 注意：
> 
> 1. 因为笔者在写这篇博文的时候已经配置好了SSH不想重置了（傲娇），所以这里就在`~/.ssh/testSSH`中新建一个临时用于演示`ssh-keygen`结果的SSH，如果从未配置过，在`Enter file in which to save the key (/Users/fowafolo/.ssh/id_rsa):`这句话出现时直接按回车就好。
> 2. `ssh-keygen`会要求我们输入两次密钥，如果不想在使用时输入口令，直接留空，回车。

然后我们使用`cat`命令来拿我们的`.pub`文件内容，并将其在Github上绑定。

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2019.57.41.png)

然后打开github个人设置页面，图中点击`Settings`

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2020.01.02.png)

在左侧选择`SSH Keys`

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2020.02.18.png)

点击`new SSH key`

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2020.02.44.png)

填写`Title`和`Key`(key就是刚刚那个`cat`指令得到的`.pub`文件的内容)，然后点击添加即可。



# 基本命令

到这里终于可以讲讲我们最最重点的内容了😂···

Git指令有很多，如果要完全掌握Git的用法，靠一篇博文是远远不够的。这篇文章旨在用最通俗易懂的语言讲述一个实际场景让读者掌握最基本的指令。

## git clone 

我们设想一个场景，工作后manager把你加到了一个git项目组里面，项目在Github托管，你现在有了操作版本库的权限，首先肯定做的是克隆版本库，这里我们要用到第一条常用指令`git clone`。比如我们的项目地址在[https://github.com/anzhehong/J2EE_TEST1](https://github.com/anzhehong/J2EE_TEST1)，那我们要做的是使用`cd`命令先切换到想要保存版本库的文件夹，然后使用`git clone`来进行克隆。如

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2020.14.24.png)

然后我们在这个版本库中进行一些操作，比如本次工作的内容就是添加了一个readme.txt，那么我们在提交（`commit`）到版本库之前首先要把这个新的文件加到我们的 ***暂存区*** 。

> 这里有必要补充一下**暂存区**的概念和作用。
> 
> ![](http://www.liaoxuefeng.com/files/attachments/001384907702917346729e9afbf4127b6dfbae9207af016000/0)
> 
> 如图，我们所讲的暂存区介于工作区和版本库。工作区就是电脑能看到的目录，比如我们现在所在的这个J2EE_TEST1文件夹就是当前的工作区，而版本库其实是一个隐藏目录，当我们在当前目录下使用`la`命令，就可以发现这个隐藏目录`.git`
> 
> ![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2013.16.48.png)
> 
> 版本库中存了很多重要内容，其中最重要的就是称为`stage` or `index`的暂存区，还有各个分支，以及指向当前分支的`HEAD`指针头等等。而其中的暂存区，说白了，就是我们工作完之后，正式提交之前存放修改后文件状态的位置。理解这一点对于后面理解git的工作流程十分必要。


## git status

暂存区中保存的都是我们修改过但是还没有提交的内容。加入到暂存区使用的指令是`git add`。我们可以指定加入具体哪个文件到暂存区，也可以使用`.` 来代表加入所有当前路径下未加入到暂存区的内容到暂存区中去。当然，在这之前我们也可以用`git status`指令来查看当前版本库下的git状态。

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2020.26.16.png)

## git add and git commit

上图中`Untracked files:`告诉我们哪些文件是不被追踪的，也就是说没加入到暂存区的，这些未被追踪的文件在我们执行`pull`和`push`等指令的时候是不会影响我们的操作的，因为它们根本不属于这个版本库。我们使用`git add .`之后再次检查状态，发现没有了`Untracked files:`而是多出来了一个`Changes to committed`，这就说明我们已经让git追踪这个文件，但是还没有正式提交到当前的版本库。这个时候就用到了下一个指令`git commit`，它的作用可以简单理解为正式提交到本地的版本库。

如果我们这个时候在terminal执行`git commit`效果如下：

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2020.32.43.png)

terminal会让我们使用**`vim编辑器`**来说明本次提交的内容，比如我们这次主要加了一个文件，那么我们就可以写`add readme.txt`，然后保存。
> 不会vim的读者可以自己google一下基本操作。

或者，我们使用`git commit -m 'message'`来便利地执行`commit`指令，如

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2020.36.19.png)

> 如果你没有将文件加入到暂存区，会提示如下
> ![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2020.49.22.png)
> 
> not staged意思就是说我们没有把它加入到暂存区，当我们执行了`git add readme.txt`之后再次commit即可。

`master`是我们的当前所在分支，后面跟着的字符串（其实是这是省略之后的）代表着这个版本。这样我们就成功提交到本地库。再次检查状态发现

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2020.38.14.png)

## git push

说我们的分支`master`领先了`origin/master`一个`commit`，这是神马意思？很简单，说我们有一次"没推"，那推一下好了，推到哪儿了呢？推到了`origin/master`，也就是远端的`master`分支。这里就要使用另一个常用command了，即`git push`。推的时候有很多选项可以选，这里我们只需要

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2020.41.37.png)

到此我们就完成了一次工作！可喜可贺haha~

## git pull/ git fetch/ git merge/ git rebase

git 命令就这么点儿？想多了！我们来继续刚刚的场景。当你推完了以后，你的项目组成员如果也在这个分支的话，需要将你写的内容`拉`下来，也就是`git pull`指令。

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2020.52.54.png)

这样你的同事就同步了你的修改。

> `git pull`其实是`git fetch`和`git merge`合二为一的指令，其中`git fetch <remote> <branch>`是从远程仓库导入到本地仓库。而`git merge`则是合并`origin/master`和`master`，即`git merge <remote>/<branch>`，例子为：`git merge origin/master`，即合并本地分支和远端的mater分支。总结起来就是，`git pull`会自动合并，而`fetch`不会。
> 
> `git pull --rebase <remote>`和`git pull <remote>`相同，但是使用`git rebase`合并远程分支和本地分支。用`--rebase`来标记可以保证线性的项目历史，防止合并提交（merge commits）的产生。很多开发者倾向于使用rebase而不是merge，因为“我想要把我的更改放在其他人完成的工作之后”。因为很多开发都频繁使用rebase，因此可以全局配置：
> 
> ```
> git config --global branch.autosetuprebase always
> ```
> 
> 如果读者还想了解`merge`和`rebase`的区别，这里有一篇[文章](http://blog.isming.me/2014/09/26/git-rebase-merge/)讲得很形象。

## git branch

除此之外，Git相比SVN的一大优势是分支管理，我们怎能不了解一下。

分支代表了一条独立的开发流水线，在Git中，分支是你日常开发流程中的一部分。当你想要添加一个新的功能或是修复一个bug时，不管bug是大是小，都应该新建一个分支来封装你的修改。这确保了不稳定的代码永远不会被提交到主代码库中，它同时给了你机会，在并入主分支前清理你的分支历史。

![](https://camo.githubusercontent.com/d454f28510358154ff815a45f7f5dbea6be9691f/68747470733a2f2f7777772e61746c61737369616e2e636f6d2f6769742f696d616765732f7475746f7269616c732f636f6c6c61626f726174696e672f7573696e672d6272616e636865732f30312e737667)

比如，上图将一个拥有两条独立开发线的仓库可视化，其中一条是一个不起眼的功能，另一条是长期运行的功能。使用分支开发时，不仅可以同时在两条线上工作，还可以保持主要的master branch混入奇怪的代码。

因为在Git中分支其实只是指向某次提交的`指针`，因此创建、修改、删除分支的时候其实只是移动了一下指针的位置，因此速度很快，而且仓库不会受其影响。

继续我们刚刚的话题，假如这个时候项目组要开发一个全新的功能，需要新建一个分支，首先我们查看一下仓库已有分支

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2022.28.59.png)

可见目前我们只有一个master分支，现在新建一个`newFeature`分支

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2022.30.21.png)

现在我们本地的仓库有两个分支，分别为`master`和`newFeature`，其实现在他们还是指向了通一次提交。我们只需要使用`git checkout`来选中这个分支，然后使用标准的`git add`和`git commit`命令。

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2022.33.41.png)

我们在这次提交中增加了一个txt文件，最后	`git status`看出我们还是在新的分支上。当我们这个分支的内容全部完成之后，就可以使用`git merge`来进行分支的合并，将其合并到`master`分支上来。

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2022.36.27.png)

这个时候我们就可以删除掉这个newFeature分支来了。可是如果我们没有完全合并会出现下面的情况，于是我们在master分之下重新merge了newFeature分支，然后重新删除。

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2022.39.30.png)

至此，我们仓库中又只剩下了一个分支。

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2022.28.59.png)

## 其它
其实，还有很多没讲到的指令，有兴趣的读者可以细度下鸣谢中的两个链接。但是本文中的这些指令应付日常项目中的一些操作还是绰绰有余的。

# 工具推荐

哈哈，我猜很多初学者第一次看到那么多指令的时候整个人都不好了，那么接下来就给大家介绍一个图形化操作界面（我为啥不早说？hhh你来打我呀！）。

其实很多IDE都集成了Git，比如笔者使用的Xcode，IntelliJ Idea，Visual Studio等等。这些IDE具体如何使用将不再详述，本文主要介绍一下第三方管理工具Source Tree。

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2022.49.20.png)

这就是SourceTree 的主界面，每一个Cell里面都是一个仓库，我们看到第五个仓库是刚刚操作的J2EE_TEST1仓库，双击进入。

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2022.51.53.png)

我们发现这个界面有绝大多数刚刚讲的指令所对应的功能（没找到的话可以google一下用sourceTree怎么操作某一指令）。左边的一栏分别是文件状态、分支、标签、远端等等，其中文件状态中的工作副本显示的是缓存区和待加入缓存区的内容。比如我现在修改了仓库中某一文件，然后点击工作副本，状态如下。

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2022.56.10.png)

我们选中`未暂存文件`中的readme.txt，发现右边有红红绿绿的部分，红色的表示删掉的，绿色的表示编辑、增加的。点击`未暂存文件`左边的框，即可把所有文件提交到缓存区。

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2022.59.07.png)

然后我们在下面那个框里面填写commit信息，如果没有选中`立即推送变更到origin/master`点击提交，就只行了`commit`操作。然后点击推送，就进行了`push`操作。如果选中了`立即推送变更到origin/master`，则在`commit`之后自动进行了`push`如图。

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2023.08.01.png)

另外sourceTree还可以更方便的对分支进行创建、checkout、合并、删除等等，读者有兴趣可以自行研究一下，很简单。


# 鸣谢

[廖雪峰的Git指南](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)

[SAP某位大牛小伙伴](https://github.com/geeeeeeeeek/git-recipes/wiki/3.4-%E4%BD%BF%E7%94%A8%E5%88%86%E6%94%AF)
