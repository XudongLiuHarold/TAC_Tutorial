---
title: SnapKit初识
date: 2016-03-30 22:48:39
tags:
- iOS
- TAC
- 同济大学苹果俱乐部
- SnapKit
- storyboard
categories: 教程
---

# 为什么不直接用Storyboard


对于很多初学iOS开发的童鞋来说，一定对storyboard并不陌生。的确，在storyboard的帮助下很多人爱上了iOS开发，因为它的可视化程度非常高，易于操作和理解。另外，Apple特别推荐使用storyboard进行开发，今后对其维护也一定会使它越来越完善。

那么问题来了，既然storyboard这么好，为啥还要代码撸界面？

<!--More-->

storyboard开发纵然快速，但是也有其劣势。

1. 首先，`Interface Builder`里面的代码很难理解。啥？你不知道什么是`Interface Builder`?请在Storyboard文件上右键，如下图，选择`Srouce Code`。

	<img src="http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-30%2023.06.58.png" height = 400>

	是不是打开了新世界的大门？原来storyboard的本质是XML文档，我滴个亲娘。

	<img src="http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-30%2023.07.09.png" height = 400>

	我相信对于绝大多数人来说，听到XML的时候内心是拒绝的，毕竟易读性太差。然而这并不是我们抛弃storyboard的原因，我们又不去写XML。真正的原因是，在进行团队项目合作的时候，如果大家都操作了storyboard，会出现很多奇怪的conflict，随随便便就几百个conflict，而且你又读不懂某个冲突究竟是哪里的，到底该留哪个，所以解决冲突会浪费大量的时间。

2. 编译速度

	如果你的项目有大量Interface Builder的内容，那么编译器来特别，特别，特别的慢。。。有个学长说过，按了编译上个厕所回来结果发现Xcode还没有编译完，我想此时内心会是崩溃的，如图
	
	<img src = "http://7xrts6.com1.z0.glb.clouddn.com/Blog-zootopia-trailer-sloth.jpg">
	
	这一点让我特别怀疑Storyboard是不是Apple亲生的，不过相信Apple这么重视Storyboard，一定会不断改进的。

3. 另外一个让我们选择代码撸界面的理由是，用代码撸出来的东西比用storyboard拖出来的东西更容易复用。这在大公司里十分常见，毕竟项目长期进行下去的话，一直用storyboard拖所有界面还是蛮累的。
	
4. 再有，其实用代码写界面也可以很快呀，如果你真的熟练。何况还有各种类似于`SnapKit`这样的深刻库。


# NSLayoutConstraint

当然如果你对苹果原生的方法情有独钟，不妨尝试一下用它原生的类来创建constraint，比如我们要做下面这个简单的效果，要求蓝色块和红色块宽度相等，上下边相齐，如图。

<img src="http://7xrts6.com1.z0.glb.clouddn.com/bluered.png" height = 400>

你可以添加如下代码实现上述效果。

```swift
let blueView = UIView()
        blueView.backgroundColor = UIColor.blueColor()
        // 禁止Autoresizing转为Autolayout的约束
        blueView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(blueView)
        
        let redView = UIView()
        redView.backgroundColor = UIColor.redColor()
        redView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(redView)
        
        let blueLeft = NSLayoutConstraint(item: blueView, attribute: .Left, relatedBy: .Equal,
                                          toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 20)
        let blueBottom = NSLayoutConstraint(item: blueView, attribute: .Bottom, relatedBy: .Equal,
                                            toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: -20)
        let blueRight = NSLayoutConstraint(item: blueView, attribute: .Right, relatedBy: .Equal,
                                           toItem: redView, attribute: .Left, multiplier: 1.0, constant: -20)
        
        let blueHeight = NSLayoutConstraint(item: blueView, attribute: .Height, relatedBy: .Equal,
                                            toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 40)
        
        let equalWidth = NSLayoutConstraint(item: blueView, attribute: .Width, relatedBy: .Equal,
                                           toItem: redView, attribute: .Width, multiplier: 1.0, constant: 0)
        
        let redTop = NSLayoutConstraint(item: redView, attribute: .Top, relatedBy: .Equal,
                                        toItem: blueView, attribute: .Top, multiplier: 1.0, constant: 0)
        
        let redBottom = NSLayoutConstraint(item: redView, attribute: .Bottom, relatedBy: .Equal,
                                           toItem: blueView, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        let redRight = NSLayoutConstraint(item: redView, attribute: .Right, relatedBy: .Equal,
                                          toItem: self.view, attribute: .Right, multiplier: 1.0, constant: -20)
        
        self.view.addConstraints([blueLeft, blueBottom, blueRight, blueHeight, equalWidth, redTop, redBottom, redRight])
```

不知道你是不是被恶心到了，反正我是拒绝写这么多代码实现这么一个简单的功能的╮(╯_╰)╭

> 如果你对UIView和UIWindow还不是很熟悉，可以首先阅读一下这篇文章[View and Window](http://anzhehong.coding.io/2016/04/05/ViewAndWindow/)

所以这个时候类似于SnapKit等神库就出现啦！接下来我们来了解下SnapKit。


# SnapKit

好了，该介绍主角了——SnapKit。其实有很多写界面布局的库，但是博主用的比较多的就是这个。

## 源码地址

[https://github.com/SnapKit/SnapKit](https://github.com/SnapKit/SnapKit)

![](https://camo.githubusercontent.com/31e716ea5f9dcf84442b4a908c4751e39f45aa47/687474703a2f2f736e61706b69742e696f2f696d616765732f62616e6e65722e6a7067)

## 环境要求

* iOS 7.0+ / OS X 10.9+
* Swift 2.0
* Xcode 7.0+

## How to Install

### Carthage

如果还没安装Carthage的话，可以使用Homebrew一键安装。

```bash
brew update
brew install carthage
```

然后就可以用它快速地集成到项目中啦。

```bash
github "SnapKit/SnapKit" >= 0.15.0
```

### Cocoapods
Cocoapods也可以安装Carthage，同样地如果没有安装过cocoapods，可以一键安装。

```bash
gem install cocoapods
```

然后`cd`到你的项目路径下，在`Podfile`中加入`pod 'SnapKit', '~> 0.15.0'
`。如果还没有`Podfile`，可以按照下列步骤来做。

```bash
cd #你的项目目录
pod init
```

然后编辑你的`Podfile`，最后应该是这样的。

> use_frameworks!
> 
> target 'SnapKitDemo' do
> 
> ***pod 'SnapKit', '~> 0.15.0'***
> 
> end
> 
> target 'SnapKitDemoTests' do
> 
> end
> 
> target 'SnapKitDemoUITests' do
> 
> end


然后执行

```bash
pod install
```
直到终端提示我们安装完毕如图。

<img src = "http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-31%2000.00.22.png" height = 300>

## 基本用法

### 小试牛刀

打开`workspace`之后，在需要使用`SnapKit`的文件中引入后我们就可以使用SnapKit了。

```swift
import SnapKit
```

我们先来体验一下。

我们在`ViewController.swift`的`viewDidLoad()`中加入下面这段代码，用来在屏幕中间显示一个label。

```swift
let box = UIView()
box.backgroundColor = UIColor.CustomGreenColor()
let superView = self.view
superView.addSubview(box)

/**
 *  Method One
 */
box.snp_makeConstraints { (make) -> Void in
    make.top.equalTo(superView).offset(20)
    make.left.equalTo(superView).offset(20)
    make.bottom.equalTo(superView).offset(-20)
    make.right.equalTo(superView).offset(-20)
}
```
> 这里的CustomGreenColor()是博主扩展的UIColor颜色
> 
```swift
extension UIColor {
int 
    class func CustomGreenColor() -> UIColor {
        return UIColor(red: 36/255, 
        green: 169/255, blue: 255/255, alpha: 1.0)
    }
}
```
>


当然还可以更简洁地起到相同作用

```swift
/**
 *  Method Two
 */
box.snp_makeConstraints { (make) -> Void in
    make.edges.equalTo(superView).inset(UIEdgeInsetsMake(20, 20, 20, 20))
}
```
效果如图

<img src = "http://7xrts6.com1.z0.glb.clouddn.com/Blog-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-31%2000.23.33.png" height = 400 >

### 用法介绍

上面只是SnapKit最简单的一个Demo，接下来我们来进一步了解一下SnapKit的语法。

#### 比较关系

上面用的都是`.equalTo()`，实际上除此之外还有`. lessThanOrEqualTo `和`. greaterThanOrEqualTo `，用来限制大于等于或者是小于等于。

#### View变量

下面这个表中第一列是使用SnapKit的View Attribute，右边一列是其对应的NSLayoutAttribute。

| ViewAttribute     | NSLayoutAttribute          |
|-------------------|----------------------------|
| view.snp_left     | NSLayoutAttribute.Left     |
| view.snp_right    | NSLayoutAttribute.Right    |
| view.snp_top      | NSLayoutAttribute.Top      |
| view.snp_bottom   | NSLayoutAttribute.Bottom   |
| view.snp_leading  | NSLayoutAttribute.Leading  |
| view.snp_trailing | NSLayoutAttribute.Trailing |
| view.snp_width    | NSLayoutAttribute.Width    |
| view.snp_height   | NSLayoutAttribute.Height   |
| view.snp_centerX  | NSLayoutAttribute.CenterX  |
| view.snp_centerY  | NSLayoutAttribute.CenterY  |
| view.snp_baseline | NSLayoutAttribute.Baseline |

基本上很容易理解，但是其中需要注意,left和leading不总是相等的，下面是官方的解释。前边`NSLayoutAttributeLeading`和后边`NSLayoutAttributeTrailing`，这里前边和后边并不是总是为左边和右边的，有些国家的前边是右边后边是左边所以这样设定是为了国际化考虑。还有视图基准线`NSLayoutAttributeBaseline`通常是指视图的底部放文字的地方。不必深究，但是如果习惯使用storyboard的话建议使用`leading`和`trailing`。

> The attributes leading and trailing are the same as left and right for left-to-right languages such as English, but in a right-to-left environment such as Hebrew or Arabic, leading and trailing are the same as right and left. When you create constraints, leading and trailing are the default values. You should usually use leading and trailing to make sure your interface is laid out appropriately in all languages, unless you’re making constraints that should remain the same regardless of language (such as the order of master and detail panes in a split view).
> 

#### UIView/NSView

在比较关系后面跟着的变量可以是view本身，也可以是`NSView`类型。如下面两种写法的效果是一样的。

```swift
make.left.greaterThanOrEqualTo(label)
make.left.greaterThanOrEqualTo(label.snp_left)
```

#### 优先级

有的时候如果限制很多很容易冲突，这个时候如果我们设置了`constraint`的优先级，则可以改变`. prority `来人为控制优先考虑满足哪一条限制。

你可以很方便地调用`priorityHigh ` 、`priorityMedium `、`priorityLow `等来限制，也可以设置一个数字来表示优先级大小。如：

```swift
make.left.greaterThanOrEqualTo(label.snp_left).priorityLow()
make.top.equalTo(label.snp_top).priority(600)
```

#### 偏移
如果上面介绍的比较关系不能满足需求，比如你需要让一个控件的左边距离它的父View的左边界小于等于15的话，可以这么写：

```swift
#假设label1的父view叫做superView
make.left.lessThanOrEqualTo(superView).offset(15)
```

#### 组合模式

##### edges

假如现在有这样的要求，`view1`的父`view`是`view2`，现在要`view1`和`view`的上下左右边界都相当，只需要

```swift
make.edges.equalTo(view2)
```

如果需要`top`比`父view`偏移5单位，左边偏移`10`单位，底部偏移`-10`单位，右面偏移`-10`单位，只需要这么写：

```swift
make.edges.equalTo(superview).inset(UIEdgeInsetsMake(5, 10, 10, 10))
```

##### size

如果不想分开设置`width`和`height`，可以直接设置`size`：

```swift
make.size.greaterThanOrEqualTo(superView)
```

现在要求是让`label`的`width`是`superView`的`width-100`，`height`是`父view`的`height-50`，你可以这么写：

```swift
make.size.equalTo(superview).offset(CGSizeMake(-100, -50))
```

##### center

可以分开设置`centerX`和`centerY`，也可以直接设置`center`，像这样：

```swift
make.center.equalTo(button1)

make.center.equalTo(superview).offset(CGPointMake(-5, 10))
```

##### 更为可读的方式

如果你这样写，照样可以非常方便地限制：

```swift
make.left.right.bottom.equalTo(superView)
make.top.equalTo(superView).offset(100)
```

***

其实到这里为止，我们对SnapKit已经基本掌握了，如果还想了解更多更新的用法，可以去[SnapKit 的Github](https://github.com/SnapKit/SnapKit)上去star一下。

另外，如果你想下载到我写的代码这些Demo，以及一个使用SnapKit写的登录注册界面Demo，可以去[同济大学苹果俱乐部内部交流资料](https://github.com/xdliu002/TAC_communication/tree/master/20160407)去找~【ps,欢迎star】

# 附件

> 附：本教程的全部源码

```swift
//
//  ViewController.swift
//  SnapKitDemo
//
//  Created by FOWAFOLO on 16/3/30.
//  Copyright © 2016年 TAC. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //MARK: - ViewController Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
//        original()
//        addLabel()
//        addBox()
//        testEdges()
//        testSize()
//        testCenter()
//        testReadble()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - NSLayoutConstraint布局
    /**
     底部均与分布的两个色块
     */
    func original() {
        
        let blueView = UIView()
        blueView.backgroundColor = UIColor.blueColor()
        // 禁止Autoresizing转为Autolayout的约束
        blueView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(blueView)
        
        let redView = UIView()
        redView.backgroundColor = UIColor.redColor()
        redView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(redView)
        
        let blueLeft = NSLayoutConstraint(item: blueView, attribute: .Left, relatedBy: .Equal,
                                          toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 20)
        let blueBottom = NSLayoutConstraint(item: blueView, attribute: .Bottom, relatedBy: .Equal,
                                            toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: -20)
        let blueRight = NSLayoutConstraint(item: blueView, attribute: .Right, relatedBy: .Equal,
                                           toItem: redView, attribute: .Left, multiplier: 1.0, constant: -20)
        
        let blueHeight = NSLayoutConstraint(item: blueView, attribute: .Height, relatedBy: .Equal,
                                            toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 40)
        
        let equalWidth = NSLayoutConstraint(item: blueView, attribute: .Width, relatedBy: .Equal,
                                            toItem: redView, attribute: .Width, multiplier: 1.0, constant: 0)
        
        let redTop = NSLayoutConstraint(item: redView, attribute: .Top, relatedBy: .Equal,
                                        toItem: blueView, attribute: .Top, multiplier: 1.0, constant: 0)
        
        let redBottom = NSLayoutConstraint(item: redView, attribute: .Bottom, relatedBy: .Equal,
                                           toItem: blueView, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        let redRight = NSLayoutConstraint(item: redView, attribute: .Right, relatedBy: .Equal,
                                          toItem: self.view, attribute: .Right, multiplier: 1.0, constant: -20)
        
        self.view.addConstraints([blueLeft, blueBottom, blueRight, blueHeight, equalWidth, redTop, redBottom, redRight])
    }
    
    //MARK: - SnapKit方法布局
    /**
     屏幕中间的label
     使用leading,trailing,center
     */
    func addLabel() {
        let label = UILabel()
        label.text = "Let's play with SnapKit"
        label.textAlignment = .Center
        label.font = UIFont.boldSystemFontOfSize(20)
        label.textColor = UIColor.CustomGreenColor()
        self.view.addSubview(label)
        label.snp_makeConstraints { (make) in
            make.leading.equalTo(self.view.snp_leading)
            make.trailing.equalTo(self.view.snp_trailing)
            make.centerY.equalTo(self.view)
        }
    }
    
    /**
     两种方法在屏幕放置一个和屏幕几乎等大的色块
     分别使用top,bottom,left,right
     */
    func addBox() {
        let box = UIView()
        box.backgroundColor = UIColor.CustomGreenColor()
        let superView = self.view
        superView.addSubview(box)
        
        /**
         *  Method One
         */
        box.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(superView).offset(20)
            make.left.equalTo(superView).offset(20)
            make.bottom.equalTo(superView).offset(-20)
            make.right.equalTo(superView).offset(-20)
        }
        
        /**
         *  Method Two
         */
//        box.snp_makeConstraints { (make) -> Void in
//            make.edges.equalTo(superView).inset(UIEdgeInsetsMake(20, 20, 20, 20))
//        }
    }
    
    /**
     效果和上面一个类似
     使用edges属性
     */
    func testEdges() {
        let view = UIView()
        view.backgroundColor = UIColor.CustomGreenColor()
        let superView = self.view
        superView.addSubview(view)
        view.snp_makeConstraints { (make) in
            make.edges.equalTo(superView).inset(UIEdgeInsetsMake(5, 10, 20, 50))
        }
    }
    
    /**
     使用size属性
     */
    func testSize() {
        let view = UIView()
        view.backgroundColor = UIColor.CustomGreenColor()
        let superView = self.view
        superView.addSubview(view)
        view.snp_makeConstraints { (make) in
            make.size.equalTo(superView).offset(CGSizeMake(-100, -50))
        }
    }
    
    /**
     使用center属性
     */
    func testCenter() {
        let view = UIView()
        view.backgroundColor = UIColor.CustomGreenColor()
        let superView = self.view
        superView.addSubview(view)
        view.snp_makeConstraints { (make) in
            make.center.equalTo(superView).offset(CGPointMake(-30, 20))
            make.size.equalTo(superView).offset(CGSizeMake(-200, -200))
        }
    }
    
    /**
     更为可读、简易的方式
     */
    func testReadble() {
        let view = UIView()
        view.backgroundColor = UIColor.CustomGreenColor()
        let superView = self.view
        superView.addSubview(view)
        view.snp_makeConstraints { (make) in
            make.left.right.bottom.equalTo(superView)
            make.top.equalTo(superView).offset(100)
        }
    }
}

//MARK: - Custom UIColor
extension UIColor {
    class func CustomGreenColor() -> UIColor {
        return UIColor(red: 36/255, green: 169/255, blue: 255/255, alpha: 1.0)
    }
}
```