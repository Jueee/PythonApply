# -*- coding: utf-8 -*-
import smtplib
import mimetypes
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.image import MIMEImage

mail_user="test@weiyongqiang.club"    #用户名
mail_pass="weiyongqiang"   #口令 
mail_postfix="weiyongqiang.club"  #发件箱的后缀
mailto_list=["jue@weiyongqiang.club","me@weiyongqiang.club"] 

mail_host="smtp.ym.163.com"  #设置服务器
mail_port="994"

def AutoSendMail(subject,content,image1):
    msg = MIMEMultipart()
    msg['From'] = mail_user
    msg['To'] = mailto_list
    msg['Subject'] = subject


    txt = MIMEText(content,'plain','gb2312')     
    msg.attach(txt)
    
    image = MIMEImage(open(image1,'rb').read())
    image.add_header('Content-ID','<image1>')
    msg.attach(image)
    
    
    server = smtplib.SMTP()
    server.connect(mail_host)
    server.login(mail_user,mail_pass)
    server.sendmail(msg['From'],msg['To'],msg.as_string())
    server.quit()
    
if __name__ == "__main__":
    AutoSendMail("hello world","这是中文的邮件内容哦","D:\\test\\weixinfriends.jpg")