# UI Demo Tutorial

我们拿一个普通的社交软件的例子来做示范，假设我们要做一个与微博类似的客户端，那么将从下面几个方面开始考虑。

## 整体布局

**插播**：很多人觉得自己不会设计，看到图形和颜色就头大，但是我认为，我们只是没有好的灵感来源而已。和写文章一样，天下设计也是一大“抄”。“抄”的过程，就是取其精华、去其糟粕的过程，我们只要有基本的鉴赏能力，就能做出一个符合规范和审美的“不错的”app设计。

**此处为正文开始**：
那么我们要“抄”，第一步就是按照我们的需求来拟定一个整体的布局。由于我讲的主题更偏向“程序员做设计”，所以我们这次就不考虑美观上的创新或项目idea的创新了。

**好的，现在进入正题**：
作为一个社交软件，我们先来看一下微博：

<img src="http://cl.ly/3h2K2Q121g3g/weibo%E5%89%AF%E6%9C%AC.png" width="300">

我个人是不太喜欢微博默认的橙色配色的，但是这个配色其实很符合需求，然后微博这个底部的tab bar也是比较简单清楚的。（这里提醒一下，iOS设计里的tabbar一般都是要求既有icon又有文字的，这样不容易造成用户的误解）

那我们再看一下它不够友好或者我们不喜欢的地方。我从自己的角度出发，不太喜欢下面那个tabbar中间按钮的圆角矩形的设计，我更偏向于圆形的设计，就像这样：

<img src="http://ui4app.qiniudn.com/photo/app/52abbcfecb7e84f12b8b6a43.jpg" width="300"/>

所以我决定在我们的设计中选用圆形button。

然后接下来的一步是设计基础配色。我认为，橙红色系一般比较适用于较日常（微博）、娱乐性（唱吧、全民K歌）的社交app，而蓝色系则更适用于商务（钉钉）、实名制（facebook）等类型的社交app，然后绿色系一般偏向环保、健康等类型的社交app。假设我们想做一个轻商务型的app，例如车友之间的社交软件，那么我选择蓝色作为基调，就像这样：

1. 我们先[搜搜看](https://dribbble.com/search?q=ios++blue)有没有```ios blue```关键词的设计（:new_moon_with_face:就是这么简单粗暴）
	发现了[这个](https://dribbble.com/shots/1131223-iOS-7-University-App/attachments/144919)，看上去不错：

	<img src="http://cl.ly/1e1h3p1W1X1Y/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-21%20%E4%B8%8B%E5%8D%882.59.12.png" width="600"/>
2. 好的我们着手开始抄，抄完效果如下：

	<img src="http://cl.ly/2w1u0v3b3337/Image%202016-03-21%20at%203.04.38%20%E4%B8%8B%E5%8D%88.png" width="400">

接下来，我们照抄tabbar布局（喂）：首页、消息、发布、发现、我的:new_moon_with_face:，这里的icon我也不是很喜欢，所以准备换个风格，那么我们来看看有没有我们喜欢的风格：

1. [搜一搜](https://dribbble.com/search?q=tabbar)```tabbar```关键词，找到了[这个](https://dribbble.com/shots/1925069-Lynny-Icon-Set-Free)，感觉不错：

	<img src="https://d13yacurqjgara.cloudfront.net/users/2404/screenshots/1925069/lynny.png" width="400">
2. 好的我们又着手开始抄，效果如下：

	<img src="http://cl.ly/003V0i3Q2S33/Image%202016-03-21%20at%203.46.47%20%E4%B8%8B%E5%8D%88.png" width="400">

至此，我们的整体布局框架就搭好了。

## 每个界面的布局（这里拿一个界面作为例子）

我这里拿“我的”做例子主要是比较简单而且实用。

假设我现在没有什么构思，那么我又开始在dribbble上[搜索](https://dribbble.com/shots/876515-Search-for-friends-list)了，看到了这个：

<img src="http://cl.ly/322n1X1M290R/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-21%20%E4%B8%8B%E5%8D%883.54.41.png" width="400">

我觉得他的tableview cell设计很符合我的想法，那么我又开始抄了:new_moon_with_face:

我的实现结果如下：

<img src="http://cl.ly/1Y0e2v3Z1P0C/%E6%88%91%E7%9A%84.png" width="500">

这里就可以用到之前推荐的几个插件了！

## 跳转

由于时间关系，这次暂且不讲，不过跳转也是一门学问……

====

Copyright 2016 &copy; Mandy Xue