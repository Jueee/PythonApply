# -*- coding: utf-8 -*-
'''
发送html文本邮件
小五义：http://www.cnblogs.com/xiaowuyi
'''
import smtplib  
from email.mime.text import MIMEText  
from email.mime.multipart import MIMEMultipart


mail_user="test@weiyongqiang.club"    #用户名
mail_pass="weiyongqiang"   #口令 
mail_postfix="weiyongqiang.club"  #发件箱的后缀
mailto_list=["jue@weiyongqiang.club"] 

mail_host="smtp.ym.163.com"  #设置服务器
mail_port="994"
  
def send_mail(to_list,subject,content):  #to_list：收件人；sub：主题；content：邮件内容
    #创建一个带附件的实例
    msg = MIMEMultipart()

    #构造附件1
    att1 = MIMEText(open('sendEmail-Html.py', 'rb').read(), 'base64', 'gb2312')
    att1["Content-Type"] = 'application/octet-stream'
    att1["Content-Disposition"] = 'attachment; filename="sendEmailHtml.py"'#这里的filename可以任意写，写什么名字，邮件中显示什么名字
    msg.attach(att1)

    #构造附件2
    att2 = MIMEText(open('sendEmail-Text.py', 'rb').read(), 'base64', 'gb2312')
    att2["Content-Type"] = 'application/octet-stream'
    att2["Content-Disposition"] = 'attachment; filename="123.txt"'
    msg.attach(att2)

    #加邮件头
    msg['to'] = to_list
    msg['from'] = mail_user
    msg['subject'] = subject
    #发送邮件
    try:
        server = smtplib.SMTP()
        server.connect(mail_host)
        server.login(mail_user,mail_pass)#XXX为用户名，XXXXX为密码
        server.sendmail(msg['from'], msg['to'],msg.as_string())
        server.quit()
        return True
    except Exception as e:  
        print(str(e))
        return False  

if __name__ == '__main__':  
    if send_mail(mailto_list,"hello","<a href='http://www.cnblogs.com/xiaowuyi'>小五义</a>"):  
        print("发送成功"  )
    else:  
        print("发送失败")