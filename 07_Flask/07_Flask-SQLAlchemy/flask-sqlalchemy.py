#! /usr/bin/python
# -*- coding: utf-8 -*-

'''
使用Flask-SQLAlchemy进行数据库管理
Flask-SQLAlchemy是一个使用了SQLAlchemy的扩展。 
SQLAlchemy 是一个强大的关系型数据库框架，它能够支持多种数据库并提供了高层的ORM和底层的原生数据库操作。
'''
'''
安装
(venv) $ pip2 install flask-sqlalchemy
'''
'''
数据库URL

在Flask-SQLAlchemy中，数据库被表示为一个URL，如下所示：

MySQL mysql://username:password@hostname/database
Postgres postgresql://username:password@hostname/database
SQLite (Unix) sqlite:////absolute/path/to/database
SQLite (Windows) sqlite:///c:/absolute/path/to/database

hostname对应一台主机，username和password好理解，对于sqlite数据库是没有用户名密码的，所以它只是目录下的一个文件而已。
'''
import os
from flask import Flask
from flask import render_template
from flask import session,redirect,url_for
from flask.ext.wtf import Form
from flask.ext.sqlalchemy import SQLAlchemy
from flask.ext.bootstrap import Bootstrap
from wtforms import StringField,SubmitField
from wtforms.validators import Required

basedir = os.path.abspath(os.path.dirname(__file__))
print basedir
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///'+os.path.join(basedir,'data.sqlite')
app.config['SQLALCHEMY_COMMIT_ON_TEARDOWN'] = True
'''
C:\Program Files (x86)\Python27\lib\site-packages\flask_sqlalchemy\__init__.py:800: UserWarning: SQLALCHEMY_TRACK_MODIFICATIONS adds significant overhead and will be disabled by default in the future.  Set it to True to suppress this warning.
  warnings.warn('SQLALCHEMY_TRACK_MODIFICATIONS adds significant overhead and will be disabled by default in the future.  Set it to True to suppress this warning.')

这条Warning的大意是：‘SQLALCHEMY_TRACK_MODIFICATIONS’ 这项配置在未来的版本中会被默认为禁止状态，把它设置为True即可取消warning。

在你的flask Config中，添加这条配置即可：
SQLALCHEMY_TRACK_MODIFICATIONS = True  
'''
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True

db = SQLAlchemy(app)


class Role(db.Model):
    # 类变量 __tablename__ 定义了表名
    __tablename__ = 'roles'
    # 所有的属性都定义为db.Column的实例对象
    # db.Column的第一个参数是类别第二个参数是可选配置参数（所有table都要有primary key）
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64),unique=True)
    # __repr__()方法是为了方便调试和测试用。
    def __repr__(self):
        return '<Role %r>' % self.name 
    # 一对多的关系
    users = db.relationship('User',backref='role')

class User(db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(64), unique=True, index=True)
    def __repr__(self):
        return '<User %r>' % self.username
    # 一对多的关系
    role_id = db.Column(db.Integer, db.ForeignKey('roles.id'))

if __name__ != '__main__':
    # create_all会创建所有的model
    db.create_all()

if __name__ != '__main__':
    # 重新设计表结构以后需要drop掉之前的表
    db.drop_all()
    db.create_all()

if __name__ != '__main__':
    admin_role = Role(name='Admin')
    mod_role = Role(name='Moderator')
    user_role = Role(name='User')
    user_john = User(username='john', role=admin_role) 
    user_susan = User(username='susan', role=user_role) 
    user_david = User(username='david', role=user_role)

    # 因为没有commit所有的对象都还没有id
    print(admin_role.id) # None
    print(mod_role.id)   # None
    print(user_role.id)  # None

    # 用db.session管理对象的持续化
    db.session.add(admin_role)
    db.session.add(mod_role)
    db.session.add(user_role)
    db.session.add(user_john)
    db.session.add(user_susan)
    db.session.add(user_david)
    
    db.session.commit()

    # 数据已经提交带数据库
    print(admin_role.id)  # 1
    print(mod_role.id)    # 2
    print(user_role.id)   # 3

    # 修改属性
    admin_role.name = 'Administrator'
    db.session.add(admin_role)
    db.session.commit()
    print(admin_role.name)  # Administrator

    # 删除
    db.session.delete(mod_role)
    db.session.commit()
    print(mod_role)     # <Role u'Moderator'>

    # 查询
    print(Role.query.all())
    # [<Role u'Administrator'>, <Role u'User'>]
    print(User.query.all())
    # [<User u'john'>, <User u'susan'>, <User u'david'>]

    # 过滤器
    print(User.query.filter_by(role=user_role).all())
    # [<User u'susan'>, <User u'david'>]

    # 还可以获取到原生的查询语句
    print(str(User.query.filter_by(role=user_role)))
    '''
    SELECT users.id AS users_id, users.username AS users_username, users.role_id AS users_role_id 
    FROM users 
    WHERE :param_1 = users.role_id
    '''

    # 关联查询
    users = user_role.users
    print(users)
    # [<User u'susan'>, <User u'david'>]
    print(users[0].role)
    # <Role u'User'>

'''
Python Shell集成Model
如果每次打开Shell都要手动导入未免太繁琐了，Flask-Script提供了配置可以自动导入对象：

from flask.ext.script import Shell
def make_shell_context():
    return dict(app=app, db=db, User=User, Role=Role)

manager.add_command("shell", Shell(make_context=make_shell_context))

'''

app = Flask(__name__)
app.config['SECRET_KEY'] = 'hard to guess string'
bootstrap = Bootstrap(app)

class NameForm(Form):
    # StringField会被转换为input[type="field",label="What is your name?"]
    # 提交之前会执Require的validator
    name = StringField('What is your name?', validators=[Required()])
    submit = SubmitField('Submit')


@app.route('/', methods=['GET','POST'])
def index():
    form = NameForm()
    if form.validate_on_submit():
        user = User.query.filter_by(username=form.name.data).first()
        if user is None:
            user = User(username=form.name.data)
            db.session.add(user)
            session['known'] = False
        else:
            session['known'] = True
        session['name'] = form.name.data
        form.name.data = ''
        return redirect(url_for('index'))
    return render_template('index.html', form=form, name=session.get('name'), known=session.get('known',False))

if __name__ == '__main__':
    app.run(debug=True)