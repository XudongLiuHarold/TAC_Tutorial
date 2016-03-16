# Cocoa Pods & Xcode Plugins


## CocoaPods

-  **What is CocoaPods?**
-  **How to install CocoaPods?**
-  **Usage of CocoaPods**
-  **Example**

===

### What is Cocoapods?


-  依赖管理工具（java的maven，nodes的npm）
-  Github（所有的源码均在Github 上）
-  第三方库的使用
-  [Cocoapods官方网站](https://cocoapods.org/)
-  [Github iOS TOP 1000](https://github.com/iamdaiyuan/ios_top_1000)

===


### Install:

- Mac 下自带ruby，所以我们可以非常简单地在terminal里面这样安装：
```bash
$ sudo gem install cocoapods
$ pod setup
```
- 如果你的gem版本太老可能遇到问题，所以需要更新一下你的gem
```bash
$ sudo gem update --system
```
- 当然，因为众所周知的原因，我们需要使用淘宝的镜像
```bash
$ gem sources --remove https://rubygems.org/
$ gem sources -a https://ruby.taobao.org/
$ gem sources -l
```
- 同样，因为众所周知的原因，pod setup 这条命令会执行非常非常长的时间，所以我们也需要使用镜像索引
```bash
$ pod repo remove master
$ pod repo add master https://gitcafe.com/akuandev/Specs.git
$ pod repo update
```
- 这里我使用的是git cafe的镜像
- 所以符合中国特色社会主义的整体的流程是这样的:
```bash
$ gem sources --remove https://rubygems.org/
$ gem sources -a https://ruby.taobao.org/
$ gem sources -l
$ sudo gem install cocoapods
$ pod repo remove master
$ pod repo add master https://gitcafe.com/akuandev/Specs.git
$ pod repo update
$ pod setup
```

===

### Usage:

- 首先cd到你的项目根目录下
- 然后执行下面的命令
```bash
$ pod init 
$ vi Podfile 
```
- 然后你就可以输入你想要添加的第三方库了,这里我们使用两个第三方的库
    - RESideMenu
    - LTNavigationBar
```bash
pod 'RESideMenu'
pod 'LTNavigationBar', '~> 2.1.2'
```

- 然后执行这条指令:
```bash
pod install --no-repo-update --verbose
```
- 等待安装完成就好

===

### Example 

##### 见同目录下的[PodsDemo](https://github.com/xdliu002/TAC_communication/tree/Harold/PodsDemo)

===

## Xcode Plugins

#### Xcode本身已经为我们提供了很多强大的功能和应用，但是我们可以使用一些Xcode的插件来使Xcode变得更加的powerful.

- [Alcatraz](https://github.com/alcatraz/Alcatraz) Xcode的插件管理工具
- [XAlign](https://github.com/qfish/XAlign) 代码排版工具
- [VVDocumenter](https://github.com/onevcat/VVDocumenter-Xcode) 快速添加注释
- [Injection](https://github.com/johnno1962/injectionforxcode) 实时调试
- [FuzzyAutocompletePlugin](https://github.com/FuzzyAutocomplete/FuzzyAutocompletePlugin) 代码补全
- [CocoaPods-XcodePlugin](https://github.com/kattrali/cocoapods-xcode-plugin) cocoapods图形化界面


===


