#! /usr/bin/python
# -*- coding: utf-8 -*-

import email

def resolveEML(emlName):
    fp = open(emlName, "r")
    msg = email.message_from_file(fp)
    
    
    # 循环信件中的每一个mime的数据块
    for par in msg.walk():
        if not par.is_multipart(): # 这里要判断是否是multipart，是的话，里面的数据是无用的，至于为什么可以了解mime相关知识。
            name = par.get_param("name") #如果是附件，这里就会取出附件的文件名
            if name:
                #有附件
                print('附件名:', name)
                data = par.get_payload(decode=True) #　解码出附件数据，然后存储到文件中
        
                try:
                    f = open(name, 'wb') #注意一定要用wb来打开文件，因为附件一般都是二进制文件
                except:
                    print('附件名有非法字符，自动换一个')
                    f = open('aaaa', 'wb')
                f.write(data)
                f.close()
            else:
                #不是附件，是文本内容
                eml_text = par.get_payload(decode=True)
                eml_decode = eml_text.decode().encode('gbk','ignore').decode('gbk')
                print(eml_decode) # 解码出文本内容，直接输出来就可以了。
                
            print('+'*60) # 用来区别各个部分的输出  
 
# 无附件
if __name__ == '__main__':
    resolveEML("E:/test.eml")

# 有附件
if __name__ != '__main__':
    resolveEML("../testAttach.eml")