#! /usr/bin/python
# -*- coding: utf-8 -*-


'''
带命令行选项的Flask-Script


Flask有大量的用于不同目的的扩展可以使用，如果这些还不满足要求你还可以开发自己的扩展。
该部分会介绍如何集成一个用于加强命令行的功能的扩展，使命令行能携带参数。


使用pip安装该扩展：
(venv) $ pip2 install flask-script

'''

from flask import Flask
from flask.ext.script import Manager

app = Flask(__name__)
manager = Manager(app)

@app.route('/')
def index():
    return '<h1>Hello World....</h1>'


if __name__ == '__main__':
    manager.run()

'''
usage: flask-scirpt.py [-?] {shell,runserver} ...

positional arguments:
  {shell,runserver}
    shell            Runs a Python shell inside Flask application context.
    runserver        Runs the Flask development server i.e. app.run()

optional arguments:
  -?, --help         show this help message and exit
'''


'''
如上，必选参数为runserver/shell, 这里我们要做的是runserver。

要查看runserver有哪些参数，可以如下方式查看：

E:\code\Python\06-PythonApply\07_Flask\02_Script>python flask-scirpt.py runserve
r --help
usage: flask-scirpt.py runserver [-?] [-h HOST] [-p PORT] [--threaded]
                                 [--processes PROCESSES]
                                 [--passthrough-errors] [-d] [-D] [-r] [-R]

Runs the Flask development server i.e. app.run()

optional arguments:
  -?, --help            show this help message and exit
  -h HOST, --host HOST
  -p PORT, --port PORT
  --threaded
  --processes PROCESSES
  --passthrough-errors
  -d, --debug           enable the Werkzeug debugger (DO NOT use in production
                        code)
  -D, --no-debug        disable the Werkzeug debugger
  -r, --reload          monitor Python files for changes (not 100{'const':
                        True, 'help': 'monitor Python files for changes (not
                        100% safe for production use)', 'option_strings':
                        ['-r', '--reload'], 'dest': 'use_reloader',
                        'required': False, 'nargs': 0, 'choices': None,
                        'default': None, 'prog': 'flask-scirpt.py runserver',
                        'container': <argparse._ArgumentGroup object at
                        0x00000000033DD390>, 'type': None, 'metavar': None}afe
                        for production use)
  -R, --no-reload       do not monitor Python files for changes

E:\code\Python\06-PythonApply\07_Flask\02_Script>

'''