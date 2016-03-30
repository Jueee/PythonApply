#! /usr/bin/python
# -*- coding: utf-8 -*-
'''
集成Bootstrap
要使用 Bootstrap ，最直观的办法是引入对应的css和js文件.
在Flask中只需要安装Flask-Bootstrap，然后在模板中继承base.html就可以使用Bootstrap。

安装flask-bootstrap
(venv) $ pip2 install flask-bootstrap
'''
from flask import Flask 
from flask import render_template
from flask.ext.bootstrap import Bootstrap

app = Flask(__name__)
bootstrap = Bootstrap(app)

@app.route('/bootstrap/<name>')
def bootstrap(name):
    return render_template('bootstrap.html', name=name)

@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'),404

@app.errorhandler(500)
def page_server_error(e):
    return render_template('505.html'),500

if __name__=='__main__':
    app.run(debug=True)    