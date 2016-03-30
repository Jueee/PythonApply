#! /usr/bin/python
# -*- coding: utf-8 -*-
'''
本地化时间和日期


用户遍及在世界各地，因此统一用UTC来表示时间日期。
但是在每个客户端，用户所看到的时间格式应该有所不同。
这个工作最适合交给客户端-浏览器来做，因为浏览器能获取到用户的地区和语言设置。

有这么一个客户端的js库叫moment.js实现了很多时间日期处理相关的方法，在Flask中可以通过安装flask-moment来使用它。

安装
(venv)$ pip2 install flask-moment
'''
from flask import Flask 
from flask import render_template
from flask.ext.bootstrap import Bootstrap
from flask.ext.moment import Moment
from datetime import datetime

app = Flask(__name__)
bootstrap = Bootstrap(app)
moment = Moment(app)

@app.route('/')
def index():
    return render_template('index.html',current_time=datetime.utcnow())

if __name__ == '__main__':
    app.run(debug=True)