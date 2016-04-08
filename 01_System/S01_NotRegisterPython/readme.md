####问题描述：   
在Win7环境下已安装 Python3.4，准备安装 win32crypt，运行安装程序报错：   
	
	Python versin3.4 required， which was not found in the registry.
找不到 Python的安装路径，又不能手动输入。
####错误原因：  
因为安装 Python3.4时没加入注册表，在注册表中注册一下就Ok了。  
注：win7是 64的原因，在安装 Python（32位）时，如果选择只为当前用户，以上问题是不会出现的，如果选择所有用户，那就用上面的方法解决吧。
####解决方案：
执行 register3.4.py，将 Python 信息加入注册表。    
