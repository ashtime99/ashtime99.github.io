---
title: Windows Terminal美化增强指南
categories: ['安装搭建']
tags: ['Windows Terminal']
date: 2021-09-01 16:27:27
---

## 最终效果
**开启复古的 CRT 效果**
![CRT 效果](https://img-blog.csdnimg.cn/da2614bf8c3b415387c37a8b988413fe.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_Q1NETiBAYXNodGltZTk5,size_16,color_FFFFFF,t_70#pic_center)

**正常效果**
![正常效果](https://img-blog.csdnimg.cn/4442002ff8bc4f56a567eb33876a7cec.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_Q1NETiBAYXNodGltZTk5,size_16,color_FFFFFF,t_70#pic_center)
<!--more-->
## 安装
在window商店搜索`Windows Terminal`，注意不要选择Preview版。
或者在GitHub上下载[microsoft/terminal](https://github.com/microsoft/terminal/releases)
![安装界面](https://img-blog.csdnimg.cn/416da853d111498bbf0b6fd6187e827a.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_Q1NETiBAYXNodGltZTk5,size_16,color_FFFFFF,t_70#pic_center)
**最开始的样子**
![最开始的样子](https://img-blog.csdnimg.cn/6765d1ec5a6948c585166071bdee468e.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_Q1NETiBAYXNodGltZTk5,size_16,color_FFFFFF,t_70#pic_center)

**查看PowerShell版本**
打开PowerShell输入：
```powershell
$PSVersionTable.PSVersion.Major 
```
大家默认的PowerShell版本是5，我安装了7.1.4版本，有需要可以去github上下载。
GitHub上的PowerShell：[PowerShell/PowerShell](https://github.com/PowerShell/PowerShell/releases)

## 颜色主题
在[Windows Terminal Themes](https://windowsterminalthemes.dev/)这个网站中，选择自己喜欢的颜色主题。
我选择的[Andromeda](https://windowsterminalthemes.dev/?theme=Andromeda)
选好后复制，打开setting.json，把主题配置复制到里面
![设置](https://img-blog.csdnimg.cn/36593ce07be54907a4d3ea0f9f150f50.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_Q1NETiBAYXNodGltZTk5,size_16,color_FFFFFF,t_70#pic_center)
![打开json文件](https://img-blog.csdnimg.cn/9ee228b34af84bc9b4a19486b4c4036c.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_Q1NETiBAYXNodGltZTk5,size_16,color_FFFFFF,t_70#pic_center)
```json
"schemes": [
	{
	  "name": "Andromeda",
	  "black": "#000000",
	  "red": "#cd3131",
	  "green": "#05bc79",
	  "yellow": "#e5e512",
	  "blue": "#2472c8",
	  "purple": "#bc3fbc",
	  "cyan": "#0fa8cd",
	  "white": "#e5e5e5",
	  "brightBlack": "#666666",
	  "brightRed": "#cd3131",
	  "brightGreen": "#05bc79",
	  "brightYellow": "#e5e512",
	  "brightBlue": "#2472c8",
	  "brightPurple": "#bc3fbc",
	  "brightCyan": "#0fa8cd",
	  "brightWhite": "#e5e5e5",
	  "background": "#262a33",
	  "foreground": "#e5e5e5",
	  "selectionBackground": "#5a5c62",
	  "cursorColor": "#f8f8f0"
	}
]
```
再找到配置文件中`profiles`>`defaults`，把主题名字输入。
```json
"defaults": 
{
	"colorScheme": "Andromeda"
}
```
`defaults`的配置是针对全局的，如果想要不同终端的样式不同，可以去`list`里的终端去配。
## 字体
**[更纱黑体](https://github.com/be5invis/Sarasa-Gothic)**
等距更纱黑体 SC 是极少数做到中文和英文2:1严格对齐的字体，看起来比较舒服。
为了防止后面`oh-my-posh`的主题出现字体不支持的乱码，推荐下载Nerd补丁版，不过仍存在某些主题会有乱码的情况。
[Sarasa Mono SC Nerd](https://github.com/laishulu/Sarasa-Mono-SC-Nerd)
```json
"defaults": 
{
	"colorScheme": "Andromeda",
	"fontFace": "更纱黑体 Mono SC Nerd",
    "fontSize": 14
}
```

## 模块
**安装**
```powershell
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
Install-Module DirColors -Scope CurrentUser
Install-Module PSReadLine -Scope CurrentUser
```

**posh-git**
> posh-git 是一个 PowerShell 模块，它通过提供可以在 PowerShell 提示符中显示的 Git 状态摘要信息来集成 Git 和 PowerShell，例如：![posh-git](https://img-blog.csdnimg.cn/6bb3a24321e1434086bf58af701d05b1.png)  
注意：如果你的电脑里没有安装Git，在输入`Import-Module posh-git`会报错

**oh-my-posh**
> Powershell 的主题引擎，其灵感来自 Chris Benti 在PS-Config和Oh-My-ZSH在 OSX 和 Linux上所做的工作（因此得名）。
>注意：我安装的是Oh My Posh V3，部分命令会与老版不同。[官方文档](https://ohmyposh.dev/docs)
>- 列出所有主题 
`Get-PoshThemes`
>- 选择并设置您喜欢的那个
`Set-PoshPrompt -Theme Paradox`

**DirColors**
使文件显示多姿多彩。

**PSReadLine**
PSReadLine 在 Github 上属于 Powershell 官方组织库之下，是一款实用的增强 Powershell 的工具。

**保存配置，启动生效**
```powershell
$PROFILE
code $PROFILE
```
在文件`Microsoft.PowerShell_profile.ps1`中添加，并且保存，下次启动就自动加载了。
```powershell
Import-Module DirColors
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme ys
```
在文件`Microsoft.PowerShell_profile.ps1`中还可以添加一些初始化的文字：
```powershell
Get-Date -Format 'yyyy/MM/dd hh:mm:ss'
Write-Host "$env:UserName 你好,今天刷LeetCode了么🎉🎉🎉"
```
可以根据PowerShell的语法自由发挥~
## 部分操作
**分屏**
普通分屏：`Alt` + `Shift` + `d`
水平分屏：`Alt` + `Shift` + `-`
垂直分屏：`Alt` + `Shift` + `+`

**放大/缩小**
`Ctrl`+ `+/-` （或者 `Ctrl` + `鼠标滚轮`）

**聚焦**
切换聚焦的分屏视图：`alt` + `(left/right/up/down)`
调节分屏的窗口大小：`alt` + `shift` + `(left/right/up/down)`

## 其他
**常用的配置**
完整配置请查阅[文档](https://docs.microsoft.com/zh-cn/windows/terminal/)
```json
"colorScheme": "Andromeda", // 颜色主题
"fontFace": "更纱黑体 Mono SC Nerd", // 字体
"fontSize": 14, // 字体大小
"fontWeight": "bold", // 文字宽度，可设置加粗
"experimental.retroTerminalEffect": true, // 复古的 CRT 效果
"acrylicOpacity": 0.1, // 背景透明度(0-1)
"useAcrylic": true, // 毛玻璃
"backgroundImage": "图片路径", // 背景图片
"backgroundImageStretchMode": "uniformToFill", // 填充模式
"backgroundImageOpacity": 0.1, // 图片透明度（0-1）
"cursorColor": "#FFFFFF", // 光标颜色
"cursorShape": "bar", // 光标形状
"startingDirectory": "起始目录", // 起始目录
"antialiasingMode": "cleartype" //消除文字锯齿
```
**去掉logo**
觉得加载的提示烦人的话
```powershell
PowerShell 7.1.4
Copyright (c) Microsoft Corporation.
```
在配置文件中，配置-nologo，注意版本：
```json
"commandline": "powershell.exe -nologo", //5
"commandline": "pwsh.exe -nologo", //7
```

**SSH配置**
在配置文件中添加，[guid生成地址](https://www.guidgenerator.com/online-guid-generator.aspx)
注意：`guid`不允许重复
```powershell
{
	"guid": "{f879cccf-3a41-42cf-bb92-0e3754cfda43}",
	"hidden": false,
	"name": "名字",
	"commandline": "ssh 用户名@服务器地址"
}
```
有用的话，别忘记点赞👍，收藏❤

