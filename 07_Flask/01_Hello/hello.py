#! /usr/bin/python
# -*- coding: utf-8 -*-

from flask import Flask
from flask import request
from flask import make_response
from flask import redirect
from flask import abort

# 所有Flask的应用程序必须构建一个Flask的对象，然后通过协议将从客户端收到的所有请求交给这个实例进行处理
# Flask的构造函数只接收一个参数，这里是__name__会指向该程序片段所在的模块。
app = Flask(__name__)

# Web客户端请求的链接地址不同，后台会通过route来决定每个链接对应的哪块处理代码。
# 最简单的做法就是使用Flask实例中提供的方法app.route来注册一个方法到路由上：
@app.route('/')
def index():
    user_agent = request.headers.get('User-Agent')
    return '<h1>Hello World !%s</h1>' % user_agent

# Flask路由上是可以配置动态参数的：
@app.route('/user/<name>')
def user(name):
    return '<h1>Hello %s!</h1>' % name

@app.route('/test1')
def test1():
    response = make_response('<h1>This document carries a cookie!</h1>')
    response.set_cookie('answer','43')
    return response

@app.route('/test2')
def test2():
    return redirect('http://www.example.com')

@app.route('/test3/<id>')
def test3():
    abort(404)

# if判定条件是为了保证：
# 只有该script被直接执行的时候才去启动server
# 因为如果该script是被当做模块引入的，那么很可能在其他的script中已经启动过server了。
if __name__ == '__main__':
    # 应用程序实例有一个run方法用于启动Flask所集成的Web服务器：
    # run方法有很多可选参数可以配置，比如设置debug=True能够进入调试模式方便查看调试信息。
    app.run(debug=True)