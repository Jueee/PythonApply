# -*- coding: UTF-8 -*-
'''
发送txt文本邮件
小五义：http://www.cnblogs.com/xiaowuyi
'''
import smtplib  
from email.mime.text import MIMEText  


mail_user="test@weiyongqiang.club"    #用户名
mail_pass="weiyongqiang"   #口令 
mail_postfix="weiyongqiang.club"  #发件箱的后缀
mailto_list=["jue@weiyongqiang.club"] 

mail_host="smtp.ym.163.com"  #设置服务器
mail_port="994"
  
def send_mail(to_list,sub,content):  
    me="hello"+"<"+mail_user+"@"+mail_postfix+">"  
    msg = MIMEText(content,_subtype='plain',_charset='utf-8')  
    msg['Subject'] = sub  
    msg['From'] = me  
    msg['To'] = ";".join(to_list)  
    try:  
        server = smtplib.SMTP_SSL(mail_host,mail_port) 
        server.login(mail_user,mail_pass)  
        server.sendmail(me, to_list, msg.as_string())  
        server.close()  
        return True  
    except Exception as e:  
        print(str(e))
        return False  

if __name__ == '__main__':  
    if send_mail(mailto_list,"hello","hello world！"):  
        print("发送成功")
    else:  
        print("发送失败") 