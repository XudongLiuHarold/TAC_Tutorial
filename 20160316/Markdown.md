title: Markdown
date: 2016-03-11 10:54:06
tags: 
- Markdown
- TAC
- 同济大学苹果俱乐部
categories: 教程
---



# 什么是Markdown

Markdown 是一种用来写作的轻量级「标记语言」，它用简洁的语法代替排版，而不像一般我们用的字处理软件 Word 或 Pages 有大量的排版、字体设置。它使我们专心于码字，用「标记」语法，来代替常见的排版格式。
> 什么是**标记语言**？
> 
> 可以理解为就是用一些符号来代替手动排版的过程。

<!--more-->

# 为什么使用Markdown
* 正如前文所说，Markdown可以让我们更专注于写作，而不是排版。
* 学习成本也不需要太多，因为常用标记就那么几个。
* 内容直观，便于交流协作。
* 使用.md文件可以轻松导出HTML、PDF文件

# 支持Markdown的编辑器
## MAC
Mac OSX 平台上有众多支持Markdown语法的编辑器，笔者用过其中比较火的两种Mou，MacDown和马克飞象等，个人感觉MacDown更好用。
> ps,这几款软件都支持实时预览，马克飞象是为了配合印象笔记使用的。
> 
> Macdown下载地址：[http://macdown.uranusjr.com/](http://macdown.uranusjr.com/)

![扩展屏](http://7xrts6.com1.z0.glb.clouddn.com/Blog-markdown001.png)

## Windows
不好意思没用过。。。此处资料来自[Markdown认识与入门](http://sspai.com/25137)

` 
有两款还算不错，一款叫 MarkdownPad ，另一款叫 MarkPad。
`


## Web
[简书](http://www.jianshu.com/)
上面有不少技术大牛写的博文，也有不少小清新文章，是一个非常火的社区。

# 常用标记
## 标题
非常简单，一个#就是一级标题，两个#就是二级标题，共有六级标题。

> 建议在#后面加一个空格，否则有的编辑器识别不了。

**例如**

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-13%2019.40.04.png)

效果如下

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-13%2019.40.10.png)



## 列表
列表可以帮助我们更有条理地进行总结归纳，因此十分常用。分为有序列表和无序列表。
### 有序列表
使用`数字`和`.`的标记，如

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-13%2019.44.09.png)

效果如下：

1. China
2. USA
3. Japan

### 无序列表
使用`-`或者`*`的标记，例如

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-13%2019.46.55.png)

- China
- USA
* Japan


## 引用
有的时候如果引用了别人的内容或者想突出显示某一部分内容，可以用引用的方式，标记符号为`>`,例如

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-13%2019.49.02.png)
> 同济大学苹果俱乐部

## 链接
### 网页链接
标记为`[]()`,其中方括号中为链接名字，显示在最后的文档中，而圆括号中的内容为链接地址，如

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-13%2019.51.30.png)

[腾讯网](http://www.qq.com)

### 图片链接

图片链接就是网页链接前加一个英文叹号`!`，如

![一张网页上的图片](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-13%2019.53.38.png)

## 字体格式
### 粗体
使用两个`*`包含一段文字为粗体，如

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-13%2019.55.56.png)

**我是粗体**

### 斜体
使用一个`*`包含的文字，如

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-13%2019.57.05.png)

*我是斜体*

## 代码框
在文档中显示代码框是非常整洁的，因此程序员一定要学会这个哦！标记很简单，用一对或者三对**\`**标记即可，区别请读者自己体会~

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-13%2020.04.21.png)

```
//段代码
void main () {
}
```

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-13%2020.04.29.png)

`
//单行
void main() {
}
`

> 有些编辑器和浏览器还支持代码块高亮，有兴趣的读者可以自行谷歌~在MacDown中非常简单，可以这样写出高亮代码。
> 
> ![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-14%2015.07.35.png)
> 
> 效果为
> 
> ```swift
var foundedTime = 200309
let fullName = "同济大学苹果俱乐部"
```

## 表格
表格是最繁琐的，使用实例如下

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-13%2020.10.15.png)

效果为


| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

## 分割线

分割线非常简单，可以用三个`*`或者三个`-`，效果为

***

---

## 结束语
至此，大部分常用语法已经介绍完毕，如果还需要深入了解读者可参考

[MarkDown中文版语法说明](http://wowubuntu.com/markdown/#list)

另外，还有一个在线练习Markdown语法的例子~

[https://www.zybuluo.com/mdeditor](https://www.zybuluo.com/mdeditor)
