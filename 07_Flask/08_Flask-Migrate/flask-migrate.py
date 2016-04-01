#! /usr/bin/python
# -*- coding: utf-8 -*-
'''
使用Flask-Migrate来做数据库的Migrations


开发进行到一定阶段，你会发现model的结构需要发生改变，Flask-SQLAlchemy从Model来构建数据库表结构只会发生在以前表不存在的时候，当然你也可以不管数据丢失先删除数据库。

更好的做法是使用数据库迁移框架，就像代码能够进行版本控制一样，一个数据库迁移框架能够跟踪数据库的变化，并且渐进的应用数据库的改变。

我们使用Flask-Migrate extension扩展来和Flask-Script集成，全部通过命令行来达到目的。
'''
'''
安装：
(venv) $ pip2 install flask-migrate
'''

# 如下展示而来该扩展的配置方式：
import os
from flask import Flask
from flask.ext.migrate import Migrate, MigrateCommand
from flask.ext.sqlalchemy import SQLAlchemy
from flask.ext.script import Manager

app = Flask(__name__)
basedir = os.path.abspath(os.path.dirname(__file__))
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///'+os.path.join(basedir,'data.sqlite')
app.config['SQLALCHEMY_COMMIT_ON_TEARDOWN'] = True
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
db = SQLAlchemy(app)
migrate = Migrate(app, db) 
manager = Manager(app)
manager.add_command('db', MigrateCommand)