# Cocoa Pods & Xcode Plugins

===

## CocoaPods

-  **What is CocoaPods?**
-  **How to install cocoa pods?**
-  **Usage of cocoa pods **
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
``bash
$ sudo gem install cocoapods
$ pod setup
``
- 如果你的gem版本太老可能遇到问题，所以需要更新一下你的gem
```bash
$ sudo gem update --system
```
- 当然，因为总所周知的原因，我们需要使用淘宝的镜像
```bash
$ gem sources --remove https://rubygems.org/
$ gem sources -a https://ruby.taobao.org/
$ gem sources -l
```
- 同样，因为总所周知的原因，pod setup 这条命令会执行非常非常长的时间，所以我们也需要使用镜像索引
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
- 然后你就可以输入你想要添加的第三方库了


