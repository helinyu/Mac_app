# Mac_app


<h2>CleanMac 项目</h2><br/>

[详情技术连接](https://helinyu.github.io/mac/)

微信号： bruscar  
邮箱： 2319979647@qq.com
欢迎各位大佬来交流

基本的界面架构：
1、节本的界面结构已经设置了
    1.1、分为左边 ，就是一个业务列表
    1.2、就是针对每个业务的详细操作内

> 功能分类
1）智能扫描 <br/>
2）系统垃圾<br/>
3）邮件附件<br/>
4）Itunes垃圾<br/>
5）废纸篓<br/>
6）移除恶意软件<br/>
7）隐私<br/>
8）优化<br/>
9）维护<br/>
10）卸载器<br/>
11）更新程序<br/>
12）扩展<br/>
13）空间透镜<br/>
14）大型和旧文件<br/>
15）碎纸机<br/>

2、 基本的详细内容处理

2.1 废纸篓 <br/>
    2.1.1. 废纸篓的功能基本上可以完成了 <br/>
        2.1.1.1 初始化状态， 扫描状态， 扫描结束之后状态<br/>
        ** note：还需要解决的：<br/>
            1）查看项目，应该是一个树结构， ====> 公共页面<br/>
            2）UI的调整，现在UI不是很熟悉，有点挫<br/>


<hr/>
<h2>Note: 准备处理的业务</h2>

11 更新程序<br/>
    
    11.1 怎么样获取到更新程序的信息
    可能的方案：
    （1）将application下面的所有软件都扫描一遍，然后获取网络上面的版本信心，如果有并且版本大于当前的，就可以显示可以更新 <br/>
    （2）mac app 开发里面提供el这样的接口  <br/>

    11.2 更新
    mac中实现应用更新
    
////
 先写主页面； 
 
