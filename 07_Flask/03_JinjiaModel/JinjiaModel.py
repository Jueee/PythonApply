#! /usr/bin/python
# -*- coding: utf-8 -*-

'''
View Function有两个任务：
（1）处理业务逻辑；
（2）返回响应内容。

将两者分开管理能够使代码更好容易维护，模板起的就是这么一个作用。


Jinjia模板引擎
模板只是一些包含文本的字符串，设置的变量标记位最终会被模板引擎用数据替换。

要使用Jinjia模板，第一步是定义模板，Jinjia2默认会到templates子目录中寻找模板，所以在该目录下定义两个模板文件：

'''
from flask import Flask 
from flask import render_template

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/user/<name>')
def user(name):
    return render_template('user.html',name=name)

class Human(object):
    def somemethod(self):
        return 'what the fucking world!'
        
@app.route('/type')
def type():
    mydict = {"key":"to be or not to be"}
    mylist = ['it','is','a','problem']
    myintvar = 0
    myobj = Human()
    name = 'jue'
    return render_template('type.html',name=name,mydict=mydict,mylist=mylist,myintvar=myintvar,myobj=myobj)

@app.route('/flow')
def flow():
    user='Jueee'
    return render_template('flow.html',user=user)

@app.route('/loop')
def loop():
    comments = ['To be','or','not to be']
    return render_template('loop.html',comments=comments)

# Jinja2同样支持宏，这和Python代码中的函数很像。
@app.route('/macro')
def macro():
    comments = ['To be','or','not to be']
    return render_template('macro.html',comments=comments)

# 外部导入Macro
@app.route('/comments')
def comments():
    comments = ['to be','or','not to be']
    return render_template('comments.html',comments=comments)

# 模板继承
@app.route('/extends')
def extends():
    return render_template('child.html')


if __name__=='__main__':
    app.run(debug=True)