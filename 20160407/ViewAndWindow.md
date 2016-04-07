---
title: View And Window
date: 2016-04-05 15:28:47
tags:
- iOS
- TAC
- 同济大学苹果俱乐部
- UIView
- UIWindow
categories: 教程
---

# UIKit
UIKit中提供一系列的Class(类)来建立和管理IOS应用程序的用户界面(UI)接口、应用程序对象、事件控制、绘图模型、窗口、视图和用于控制触摸屏等的接口。可以理解成是苹果提供给开发和来操纵程序和界面的一个API库。而UIWindow和UIView是我们进行iOS开发必须要了解的两个部分。因此笔者就二者的关系、各自必须掌握的知识点进行了小结。

<!--More-->

要说UIView和UIWindow的关系，我们首先来看一下UIKit这个库给我们提供了哪些内容。

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-uikit_classes.jpg)

我们看到UIResponder有UIApplication、UIView和UIViewController三个子类，UIWindow又是UIView的一个子类。

对于初学者而言可能对于UIApplication比较陌生。UIApplication类提供了对运行在IOS设备上的app集中控制和调度的机制。每一个IOS app必须有一个而且只能有一个UIApplication或者其子类的实例。当程序启动的时候，会调用`UIApplicationMain`函数，在这个函数中会创建一个UIapplication类的单例，这个单例在整个IOS系统中就是你的App的抽象。之后你就能够通过`UIApplication.sharedApplication()`方法来调用该单例。

如图，默认入口AppDelegate中使用`@UIApplicationMain`来表明程序入口。

<img src = "http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-04-05%2015.46.20.png" height = 200>

关于UIApplication的具体使用，本文不再赘述。

# UIWindow（窗口）和UIView（视图）

## 关系

窗口和视图是为iPhone应用程序构造用户界面的可视组件。窗口为内容显示提供背景平台，而视图负责绝大部分的内容描画，并负责响应用户的交互。

我们可以理解为，UIWindow是画框，UIView是画布，我们在绘制画面的时候总是在画布上进行绘制，然而画布是在画框上挂着的。其实二者的关系用Apple官方指南的一张图就能看懂。

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-view-layer-store.jpg)

## UIWindow
iOS应用程序通常只有一个窗口，表示为一个UIWindow类的实例。应用程序在启动时创建这个窗口（或者从nib文件进行装载），并往窗口中加入一或多个视图，然后将它显示出来。窗口显示出来之后，很少需要再次引用它。其实这一点也许也能解释为何iOS的UIWindow继承于UIView，而MAC OSX的NSWindow继承于NSResponder。一般情况下，iOS应用并不需要我们去创建、切换窗口。

## UIView

### UIView作用的探讨

除了显示内容和处理事件之外，UIView还可以用于管理一或多个`subView`(子视图)。子视图是指嵌入到另一视图对象边框内部的视图对象，而被嵌入的视图则被称为`superView`（父视图或超视图）。视图的这种布局方式被称为视图层次，一个视图可以包含任意数量的子视图，通过为子视图添加子视图的方式，视图可以实现任意深度的嵌套。视图在视图层次中的组织方式决定了在屏幕上显示的内容，原因是子视图总是被显示在其父视图的上方；这个组织方法还决定了视图如何响应事件和变化。每个父视图都负责管理其直接的子视图，即根据需要调整它们的位置和尺寸，以及响应它们没有处理的事件。

所以总结起来UIView的三个作用：

1. 描画和动画
2. 父子视图管理和布局
3. 事件响应

### 继承关系

我们再来看一下UIView这部分的类继承关系。

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-view_classes.jpg)

除了`UIWindow`，`UIControl`之外，其它各个子类都是最基本的iOS控件，但是各个控件之间可能也有继承关系。比如其中最最常用到的`UITableView`其实是`UIScrollView`的子类。而`UIControl`则是内部实现了事件监听的控件，如`UIButton`,`UISlider`等。

# 必须知道的

在这一部分，笔者想接着上面的话题总结一些iOS开发中最最基本的、最最常用的知识点。

## 布局

你可以把整个UIKit的View布局系统看成一个递归的系统，一个view在父view中布局，父view又在其父view中布局，最后直到在UIWindow上布局。这样递归的布局开来，就能构建起我们看到的app的界面。

但是这些`View`是如何摞在一起的呢？这个是有规则的。

### 坐标系
UIKit中的坐标是基于这样的坐标系统：以左上角为坐标的原点，原点向下和向右为坐标轴正向。坐标值由浮点数来表示，内容的布局和定位因此具有更高的精度。下图就显示了这个相对于屏幕的坐标系统，这个坐标系统同时也用于UIWindow和UIView类。

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-native_coordinate_system.jpg)

在编写界面代码时，需要知道当前起作用的坐标系统。每个窗口和视图对象都维护一个自己本地的坐标系统。视图中发生的所有描画都是相对 于视图本地的坐标系统。但是，每个视图的边框矩形都是通过其父视图的坐标系统来指定。

### 平面内布局

在UIKit的几何布局模型中核心的一个数据结构是：`CGRect`，它确定了一个View在父View中坐标系的绝对位置。

我们看一下关于布局的核心数据结构`CGRect`是如何定义的。

```swift
/* Points. */

struct CGPoint {
  CGFloat x;
  CGFloat y;
};
typedef struct CGPoint CGPoint;

/* Sizes. */

struct CGSize {
  CGFloat width;
  CGFloat height;
};
typedef struct CGSize CGSize;

/* Rectangles. */

struct CGRect {
  CGPoint origin;
  CGSize size;
};
typedef struct CGRect CGRect;
```

一个`CGRect`中包含了一个原点（`point`）和一组宽高的信息（`size`）。其实一个`CGRect`就是描述了一个长方形的块。

### frame vs bounds

UIView有两个类似的属性：`frame`和`bounds`，很多初学者并不知道他们的区别。其实看一张图就够了。

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-1411611417625738.jpg)

> ps，安利一下图片来源，Stanford iOS课程 

下面是`StackOverflow`上面一个人的解释，个人感觉解释的很清楚。

> Here's the cheatsheet:
> 
> frame is where the view is (with respect to the superview)
> 
> bounds is where the view is allowed to draw (with respect to itself)
> 
> Some more clarification:
> 
> If you are positioning the view in its superview, you almost always change the frame origin.
> 
> If you are clipping where the UIView is drawing, you almost always modify its bounds.
> 
> Note that you are allowed to have bounds that is bigger than the frame. That is, you can draw "outside the lines" of where you are.

一言以蔽之，`frame`的`origin`是相对于父视图的坐标系来讲的；而`bounds`是相对于每一个view自身的坐标系来讲的。为什么每个view都需要这个坐标系呢？试想，如果想剪切一个view一部分视图，有了这个属性就会很方便。

### Z-Order布局

所谓`Z-Order`布局，其实讲的就是将各个View摞起来之后的空间树形结构。我们可以在debug的时候打开Xcode自带的视图调试模式。如图，选择`View UI Hierarchy`。

<img src = "http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-04-05%2016.51.08.png" height = 300>

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-04-05%2016.49.11.png)

展开之后是这样的~是不是很清晰。

![](http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-04-05%2016.50.24.png)

那我们如何建立各个View之间的关系呢？下面列出的是一些最常用的方法，一看单词就懂。

```swift
– addSubview:
– bringSubviewToFront:
– sendSubviewToBack:
– removeFromSuperview
– insertSubview:atIndex:
– insertSubview:aboveSubview:
– insertSubview:belowSubview:
– exchangeSubviewAtIndex:withSubviewAtIndex:
– isDescendantOfView:
```
比如，`addSubView` 是直接将一个View附加在当前View上面。而这个附加过程，可以暂时先简单的理解成一个堆栈的PUSH操作。先附加的View被压在下面，后附加的View在最上面。但是`UIView`并没有提供`POP`的方法，而是可以通过类似数组的方式访问一个View的子View，并进行删除。


> **希望本文对你理解UIView和UIWindow有一定的帮助O(∩_∩)O~**