# 从UI的角度讲控件

## 基本控件

不管开发还是设计，我们都要首先知道每一种控件的名字

1. Content Views
	* TextView
	* TableView

		<img src="http://cl.ly/0t1Y41191v2T/TableView.png" width="350"/>
	* ScrollView
	* ImageView
	* CollectionView

		<img src="http://cl.ly/2C2V0j1g3i0K/Image%202016-03-18%20at%2011.19.10%20%E4%B8%8B%E5%8D%88.png" width="350"/>

2. Bars
	* StatusBar

		<img src="http://cl.ly/041r3F002O24/Status%20Bar.png" width="350"/>
	* NavigationBar

		<img src="http://cl.ly/0J0i2P1d2o12/Navigation%20Bar.png" width="350"/>
	* TabBar

		<img src="http://cl.ly/040r353a2D1H/Image%202016-03-18%20at%2011.17.46%20%E4%B8%8B%E5%8D%88.png" width="350"/>
	* ToolBar
	* SearchBar

3. Controls
	* Button
	* Label
	* TextField
	* Switch

		<img src="http://cl.ly/2r0H2K0i0Y0U/Switch.png" width="50"/>
	* Slider

		<img src="http://cl.ly/0y2d0Z2C1l2g/Image%202016-03-18%20at%2011.23.20%20%E4%B8%8B%E5%8D%88.png" width="350"/>
	* Segment

		<img src="http://cl.ly/3u3H3H3M3v45/Image%202016-03-18%20at%2011.23.09%20%E4%B8%8B%E5%8D%88.png" width="250"/>
	* DatePicker
		
		<img src="http://cl.ly/3F092c0q3M2D/Image%202016-03-18%20at%2011.22.31%20%E4%B8%8B%E5%8D%88.png" width="250"/>

4. Temporary Views
	* AlertView
		
		<img src="http://cl.ly/1F3M1C3E2X3r/Image%202016-03-18%20at%2011.23.49%20%E4%B8%8B%E5%8D%88.png" width="250"/>
	* ActionSheet
		
		<img src="http://cl.ly/3e1B0i1T421p/Image%202016-03-18%20at%2011.24.06%20%E4%B8%8B%E5%8D%88.png" width="250"/>
	* ActivityView
		
		<img src="http://cl.ly/3u021y450B3A/Image%202016-03-18%20at%2011.18.50%20%E4%B8%8B%E5%8D%88.png" width="350"/>
	* Popover
		
		<img src="http://cl.ly/1e0h2l1e1N2y/Image%202016-03-18%20at%2011.19.48%20%E4%B8%8B%E5%8D%88.png" width="350"/>

5. More...

## iOS设计的基本纲领（摘抄自Human Interface Guidelines:neutral_face:）

1. iOS三大设计原则：
	1. Deference：UI帮助用户理解内容，不能分散用户对内容的注意力
	2. Clarity：文字、图标清晰，功能驱动设计
	3. Depth：视觉层次感

2. 充分利用整个屏幕；减少拟物化设计；使用半透明UI
3. 留白；使用系统字体；bar上使用无边框按钮
4. AutoLayout

## 没有设计师？程序员也可以做出漂亮的设计

1. Sketch模版
	* iOS模版
	* iOS app图标模版
	* Web模版

2. 界面设计
	* 用什么做参考？
	* 如何优雅地“借鉴”
		* [详细教程](https://github.com/xdliu002/TAC_communication/blob/Mandy/TAC_UIDesign/Demo_Tutorial.md)
		* [下载Demo](http://cl.ly/0B1s3J3I0v0u/download/UIDesign_Demo.sketch)
	* 注意细节

3. Sketch一些有用的插件
	* Steps:
		1. Sketch Toolbox [下载 :arrow_down:](http://sketchtoolbox.com/)
		2. 去系统设置给个权限
		3. 打开toolbox搜索想要的插件下载就好啦～

	* 插件推荐（[参考资料](http://www.sketchcn.com/sketch-tips-tricks-1.html)）
		1. Content Generator Sketch Plugin
		2. Sketch Measure（我也是最近才知道，这个真的好用到爆炸了:boom:）
		3. Rename It
		4. More...（欢迎分享:hushed:)

## 设计与编程的结合

1. 什么是1x、2x、3x图片？怎么导出？

	* 首先，**PPI**是每英寸的像素数目，我们都知道Retina和非Retina的区别，自然Retina PPI更高。
	* **像素**（pixels/px）是数码显示上最小的计算单位。所以在同一个屏幕尺寸，更高的PPI，就能显示更多的像素，同时渲染的内容也会更清晰。
	* 而**点**（points/pt）是一个与分辨率无关的计算单位（真实尺寸）。根据屏幕的像素密度，一个点可以包含多个像素（例如，在标准Retina显示屏上1pt里有2x2个像素）。
	* 当为多种显示设备设计时，应该以“点”为单位作参考，但仍然需要以3种不同的分辨率导出你的素材，不管是在哪种分辨率下设计应用。

	| Device         | Resolution Ratio | PPI   | Size  |
	| -------------- |:----------------:|:-----:| -----:|
	| iPhone 6 Plus  | ```@3x```        | 401   | 5.5"  |
	| iPhone 6       | ```@2x```        | 326   | 4.7"  |
	| iPhone 5/5S/5C | ```@2x```        | 326   | 4.0"  |
	| iPhone 4/4S    | ```@2x```        | 326   | 3.5"  |
	| iPhone 1/2/3   | ```@1x```        | 163   | 3.5"  |
	| iPad Air/4     | ```@2x```        | 264   | 9.7"  |
	| iPad Mini2/3   | ```@2x```        | 326   | 7.9"  |
	| Other iPad     | ```@1x```        | 132   | /     |

	* Sketch导出方法介绍：
		1. Make Exportable
		2. Export

2. 如何切图？什么样的图需要切？
	简单来说就是“自定义”的图。
	一般就是这几类：
	* icon (selected/unselected)
	* 额…好像其他也没有什么了，一般icon切的最多

3. 专业的设计师是需要标出尺寸的！
	现在呢，如果你用PS我也不知道什么好方法，不过我们的sketch插件已经解决了这个可怕的问题:sunglasses:

## 从设计到编程，编程中有关UI的小tips

1. @IBOutlet
2. User Defined Runtime Attributes
3. 多Storyboard
4. 屏幕旋转

## iOS设计的几个注意事项

1. 参考其他应用设计时，请**务必**使用iOS设备下的应用（否则风格会跑偏）
2. 设计以**简洁**为主，颜色不要过多，图片质量要过硬
3. 设计是为了特定用户群做的，没有必要满足所有人的要求，所以**不要怕有人说丑**
4. **整体风格统一！整体风格统一！整体风格统一！重要的话说三遍！**

## Reference

1. [Dribbble](https://dribbble.com/)
2. [Pinterest](https://jp.pinterest.com/)
3. [iOS Human Interface Guidelines](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/MobileHIG/)
4. [iOS Human Interface Guidelines 中文版](http://isux.tencent.com/ios8-human-interface-guidelines.html)
5. [Learn Sketch3](https://designcode.io/sketch)
6. [UI中国](http://www.ui.cn/)
7. [UI4App](http://www.ui4app.com/category/)
8. [Sketch中文用户手册](http://sketchcn.com/sketch-chinese-user-manual.html)

其他的还等待大家挖掘～

## 再给大家推荐几个微信号

1. UI设计达人：BestUIDesign
2. CocoaChina：cocoachinabbs
3. iOS大全：iOShub

====

Copyright 2016 &copy; Mandy Xue