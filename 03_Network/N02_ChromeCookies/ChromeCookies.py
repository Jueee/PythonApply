'''
在Python中使用Chrome浏览器已有的Cookies发起HTTP请求。

参考博客：http://blog.csdn.net/pipisorry/article/details/47980653
'''
import subprocess
import sqlite3
import win32crypt
import re,os
import requests

def get_chrome_cookies(url):
    DIST_COOKIE_FILENAME = '.\python-chrome-cookies'
    SOUR_COOKIE_FILENAME = os.path.join(os.environ['LOCALAPPDATA'],r'Google\Chrome\User Data\Default\Cookies')
    if not os.path.exists(SOUR_COOKIE_FILENAME):
        raise Exception('Cookies 文件不存在...')
    subprocess.call(['copy', SOUR_COOKIE_FILENAME, DIST_COOKIE_FILENAME], shell=True)
    conn = sqlite3.connect(".\python-chrome-cookies")
    ret_dict = {}
    for row in conn.execute("SELECT host_key, name, path, value, encrypted_value FROM cookies"):
        if row[0] != url:
            continue
        ret = win32crypt.CryptUnprotectData(row[4], None, None, None, 0)
        ret_dict[row[1]] = ret[1].decode()
    conn.close()
    subprocess.call(['del', '.\python-chrome-cookies'], shell=True)
    return ret_dict
