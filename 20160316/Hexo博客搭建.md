---
title: Hexo博客搭建
date: 2016-03-15 18:14:56
tags:
- Hexo
- 博客
- Github Pages
- TAC
- 同济大学苹果俱乐部
categories:
- 教程
---



# Hexo简介

Hexo是台湾大牛tommy351制作的基于Node.js的静态博客程序。

<!--More-->

Github Pages是Github 提供的服务，是用户编写的、托管在Github上的静态网页，我们可以在上面托管我们的博客，有300M免费空间，资料自己管理。

有人会说写博客可以在CSDN、博客园去写，为什么非要自己折腾一个Github Pages呢？个人认为程序员虽然需要遵守代码规范，遵守项目规范等等规则，但是也需要展示自己不一样的一面。自己搭建的博客完全可以按照自己的想法展现内容，比循规蹈矩的模式要新颖有趣的多。

另外，在使用Hexo的过程中，你一定会遇到或多或少的问题，也是一个锻炼你解决实际问题能力的好机会。好了，废话了不少，开始进入正题。

# 配置环境
## Git配置和SSH绑定

因为我们需要使用Git把博客托管到Github上，所以如果你还没有配置好Github，或者没有绑定SSH到Github的话，请先移步这篇文章：[GIT](http://blog.anzhehong.com/2016/03/11/Git/)

## Node.js环境配置

由于hexo 是基于 Node.js的，所以必须先配置好Node.js的环境，两种方法。

### 通过安装包安装

从 ***[官网](https://nodejs.org/en/)*** 下载安装文件，然后安装这个`.pkg`文件。安装之后你就能在电脑使用`node`和`npm`命令了。

安装完成之后，打开`terminal`，输入

```
curl http://npmjs.org/install.sh | sh
```

紧接着执行下面这条命令，过程中要输入用户的密码。

```
sudo npm update npm -g
```

### 通过Homebrew安装
如果你的电脑配置过了Homebrew，那么你可以用一条命令就安装好Node.js:

```
brew install node
```


通过上面两种方式安装结束后，输入下面这条命令查询是否安装成功。

```
npm -v
```
如笔者的Node.js版本为：`2.7.4`。

## Hexo安装与配置

如果前两步都做好了，那么我们就可以开始安装Hexo啦！在terminal中执行

```
npm install hexo -g
```

其中`-g`代表全局安装，因为`npm`默认为当前项目安装。在terminal中输入`hexo -v`检查安装情况和版本信息。

![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2018.44.58.png)

到此我们就安装好了Hexo的环境。

# Hexo一些基本操作

## hexo init & hexo s
配置好了Hexo，我们赶紧来尝试一下！`cd`到某一路径下，然后调用下面的指令初始化博客。

```
hexo init
```

![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2018.50.05.png)

![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2018.50.27.png)

![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2018.50.48.png)

在经过等待之后，当屏幕上出现了`INFO  Start blogging with Hexo!`的时候，就证明初始化成功了。下面是初始化成功后的文件路径：

![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2018.53.40.png)

其中有一个非常重要的配置文件`_config.yml`，里面保存了很多博客的配置信息，我们用`Sublime`打开大概看一下。

![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2018.54.50.png)

非常通俗易懂，比如`title`字段就是博客名，`author`就是作者名字等等，具体要改些什么要看我们有什么需求。然后我们输入下面的指令先在本地预览一下我们的博客：

```
hexo s #相当于hexo server，会启动本地4000端口。
```

![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2018.56.51.png)

如图，我们启动server之后Hexo提示我们打开`http://localhost:4000/`预览博客，如果要终止预览，只需要在terminal中输入`Ctrl + C`。

![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2018.57.05.png)

上面这个截图就是init之后的博客自带的主题`landscape`，那这个主题存在哪里呢？就在刚刚的目录下，我们发下一个`theme`文件夹，没错，这里可以放很多类似的文件夹，一个文件夹里面有一个主题。也许你会问如果有很多这样的文件夹，那Hexo在启动的时候为什么会知道究竟选用哪个主题呢？很简单，打开刚才的`_config.yml`我们可以找到`theme`字段，只要该主题存在于`/theme`路径下，即可输入主题名指定主题。Hexo有很多精致的主题供我们选择，之后我们会讲到如何切换新主题。

![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2019.01.59.png)

## hexo new <文章名>

我们发现刚刚系统帮我们自动生成了一篇名为`Hello World`的博文，如果我们想新生成一篇博文，很简单，在根目录下调用下面的指令：

```
hexo new <文章名>
```

比如我们新建一个名为`StartHexo `的博文如下图，然后会发现在`/source/_post`目录下多了一个文件`StartHexo.md`，这个`/_post`文件夹就是我们存放博文的位置。

![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2019.06.20.png)

![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2019.08.39.png)

接下来在新建的博客中用`Markdown`写一些内容，然后删掉`hello-world.md`。如果你还不会`Markdown`，请移步：[<Markdown>](http://blog.anzhehong.com/2016/03/11/Markdown/)。

> 说明：如果不想博文的内容在首页全部显示, 并能出现阅读全文按钮效果, 需要在你想在首页显示的部分下添加<!--more-->

![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2019.11.35.png)

保存之后，我们想要预览博客，于是`hexo s`查看变化。

![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2019.20.54.png)

> 有的时候（比如改了主题）你对博客进行了修改然后`heox s`却发现博客还是刚刚的样子。这是因为我们对博客内容进行修改之后，还没用让Hexo帮我们生成静态网页。如果只改`.md`文件的话，是可以的。

## hexo g

如果我们发现博客没变化，就需要调用下面的指令进行生成：

```
hexo g #也就是hexo generate
```

![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2019.16.46.png)

这个时候我们再次打开`http://localhost:4000/`预览博客，就会发现改变都生效了。

## hexo d

`-d `即`-deploy`，是部署的意思，可是我们的博客现在还没有托管自然不能部署。因此我们首先需要将博客与Github绑定。

### 安装Git部署器

```
npm install hexo-deployer-git --save
```

### 修改配置文件

打开`_config.yml`文件，找到关键词`Deployment`

![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2019.23.00.png)

你可以有多种部署器，这里我们只介绍`git`。将你的Deploy这一块填成下面的样子：

```
deploy:
  type: git
  repo: <repository url>
  branch: [branch]
  message: [message]
```

比如我的配置文件是：

![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2019.25.43.png)

在`hexo`某一个版本之后，`type`不能再填`github`，而是要填写`git`。`branch`自然是我们的某个git仓库的主分支。那这个`repo`填什么呢？如果你稍微分析一下就会发现，我是在我的github上面新建了一个名为`anzhehong.github.io`的仓库，所以你只需要在你的github空间新建一个名为`xxxxxx.github.io`的仓库，其中`xxxxxx`是你的github用户名，与访问你github首页跟在`http://github.com/xxxxxx`中的`xxxxxx`是一致的。

> 这一点很重要，很多人不能成功部署都是因为没有正确建库。

然后复制你的仓库的ssh地址。（如图，点击`Download ZIP`左边第二个按钮即可复制。）

![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2019.33.35.png)

然后就可以按照刚刚说的把配置文件中部署那一部分的内容填写好。如图：

![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2019.25.43.png)

执行

```
hexo d
```

然后你就可以访问你的博客啦！`xxxxxx.github.io`

> 以后可以按照下列顺序进行部署
> 
> 1. 修改博客（新增、删除、修改文章等等）
> 
> 2. `hexo clean`
> 
> 3. `hexo g`
> 
> 4. `hexo d`

# 错误速查

其实在安装、配置过程中并不一定会一帆风顺，如果报错了，读者可以把错误google一下，很好找解答。在这里为了方便各位读者，就列出几个可能会出现的错误。欢迎补充。

1. 权限问题

	解决方案：请在命令前加上`sudo`并输入密码。

2. `ERROR Deployer not found: git 或者 ERROR Deployer not found: github`

	解决方案：`npm install hexo-deployer-git  --save`
	
3. `ERROR Plugin load failed: hexo-server`即找不到`hexo server`指令

	解决方案：`sudo npm install hexo-server`或者`sudo npm install hexo-server--save`
	
4. 如果是类似下面的错误

	```
	{ [Error: Cannot find module './build/Release/DTraceProviderBindings'] code: 'MODULE_NOT_FOUND' }
	{ [Error: Cannot find module './build/default/DTraceProviderBindings'] code: 'MODULE_NOT_FOUND' }
	{ [Error: Cannot find module './build/Debug/DTraceProviderBindings'] code: 'MODULE_NOT_FOUND' }

	Try to install with --no-optional option.
	```

	解决方案：`npm install hexo --no-optional`
	
5. 部署的时候执行：`hexo deploy` 命令行没有任何输出，也没有错误。 
	
	解决方案：在部署的`_config.yml`文件中，找到`deploy:`标签，在每个冒号后面必须要***空格***，否则就会出现上述问题。
	
6. 执行`hexo server`显示`running at http://0.0.0.0:4000/ `

	解决方案：可以直接试一下`http://localhost:4000/`
	
# 换主题

我相信很多人会觉得`landscape`这个主题不够精致，想要换个主题。你可以打开google去找一款你喜欢的hexo主题，然后按照下面的方式进行修改。

比如我们介绍一下[iissnan](https://github.com/iissnan)做的主题`Next`，第一步是克隆。如图

```
git clone https://github.com/iissnan/hexo-theme-next themes/next
```

![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2020.09.02.png)

然后修改刚刚提到的`_config.yml`文件， 

![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2020.04.53.png)

> ***注意*** `/theme`文件夹下每个主题的子目录中也都有这个文件，但是那个是配置相应主题的，现在还用不到。

然后例行公事执行`hexo clean` 、`-g` 、`-s`来进行预览，最后进行部署。

看一下效果

HomePage
![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2020.11.04.png)

BlogPage
![](http://7xrts6.com1.z0.glb.clouddn.com/Hexo%E6%90%AD%E5%BB%BA-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-15%2020.11.23.png)



至此，我们的Hexo初期教程就到此结束了。
> Start blogging with Hexo !