#-*_coding:utf8-*-

from flask import Flask
from flask import request
from flask import render_template


app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def home():
    return render_template('ExpandGridTest.html')

if __name__ == '__main__':
    app.run()