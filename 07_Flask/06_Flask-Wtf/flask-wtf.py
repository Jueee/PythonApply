#! /usr/bin/python
# -*- coding: utf-8 -*-

'''
为了解决表单验证之类的重复和繁琐的问题，可以引入Flask-WTF来让表单使用变得简单
（注：如果不使用Flask自带的模板，而是用Angular.js等前端技术本章可以略过，因为表单验证是跟Jinjia2模板紧密关联在一起的）。

通过pip安装：
(venv) $ pip2 install flask-wtf
'''
'''
CSRF是Cross-Site Request Forgery Protection的缩写。
通常发生在一个站点发送请求到另一个受害者登陆的站点时。
'''
from flask import Flask
from flask import render_template
from flask import session,redirect,url_for
from flask import flash
from flask.ext.bootstrap import Bootstrap
from flask.ext.wtf import Form
from wtforms import StringField,SubmitField
from wtforms.validators import Required

class NameForm(Form):
    # StringField会被转换为input[type="field",label="What is your name?"]
    # 提交之前会执Require的validator
    name = StringField('What is your name?', validators=[Required()])
    submit = SubmitField('Submit')

'''
app.config常备用来存储一些配置信息，甚至还能够从文件中导入配置；
SECRET_KEY是常用来做加密的变量，它会被用来生成一个token，该token用于每次登陆时候的校验。
'''
app = Flask(__name__)
app.config['SECRET_KEY'] = 'hard to guess string'
bootstrap = Bootstrap(app)

@app.route('/',methods=['GET','POST'])
def index():
    name = None
    form = NameForm()
    if form.validate_on_submit():
        old_name = session.get('name')
        '''
        仅在名字发生了更新的时候调用flash()
        对于错误、确认、警告信息，Flask提供了flash()方法。
        使用分为python中调用flask()和在模板中呈现message两部分
        '''
        if old_name is not None and old_name != form.name.data:
            flash('Looks like you have changed your name!')
        '''
        在之前的例子中用户进入页面时候发送的是get请求，填写name提交标案以后是post请求，提交完后刷新页面，页面会提示是否离开当前页面。
        这是因为之前的请求是post的，刷新会导致重新发送该请求。

        由此引入重定向来解决这个问题，为了防止重定向以后的数据丢失，我们要讲数据存储在session中
        '''
        session['name'] = form.name.data
        return redirect(url_for('index'))
    return render_template('index.html', form=form, name=name)

if __name__ == '__main__':
    app.run(debug=True)

