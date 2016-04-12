#! /usr/bin/python
# -*- coding: utf-8 -*-
'''
Flask-Mail提供的邮件支持


当某些事件被触发，应用程序通常需要通过邮件方式通知用户。

Python的原生包smtplib能够被用于发送邮件，但是Flask的扩展Flask-Mail更好包装了smtplib能够方便地和Flask进行交互。
'''
'''
安装
(venv) $ pip3 install flask-mail
'''
import os
from flask import Flask 
from flask import render_template
from flask.ext.mail import Message


app = Flask(__name__)
app.config['MAIL_SERVER'] = 'smtp.qq.com'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USE_TLS'] = True
app.config['MAIL_USERNAME'] = os.environ.get('MAIL_USERNAME')
app.config['MAIL_PASSWORD'] = os.environ.get('MAIL_PASSWORD')


@app.route('/')
def index():
    return render_template('index.html')


if __name__ == '__main__':
    msg = Message('test subject', sender = 'you@example.com', recipients=['you@example.com'])
    msg.body = 'text body'
    msg.html = '<b>HTML</b> body'
    with app.contenxt():
        mail.send(msg)
    app.run(debug=True)








