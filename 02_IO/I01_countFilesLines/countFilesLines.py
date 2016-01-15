'''
计算文件夹中的代码行数
'''
import sys,os  
  
#计算一个文件的行数  
def afileline(f_path):  
    res = 0  
    f = open(f_path,"r",1,"utf-8",'ignore')  
    for lines in f:  
        #空行的判断借助一个拆分字符串的函数split
        if(lines.split()):  
            res += 1  
    return res  
  
def countFilesLines(f_path):  
    allline = 0  
    allfiles = 0  
    for root,dirs,files in os.walk(f_path):
        for afile in files: 
            ext = afile.split('.')  
            ext = ext[-1]  
            if(ext in ['java','xml','js','html','jsp','vm']):  
                itpath = root + os.sep + afile  
                allfiles += 1  
                allline += afileline(itpath)  
    print (f_path,'文件数量:', allfiles)  
    print (f_path,'代码行数:', allline)  

if __name__ == '__main__':
    countFilesLines('E:\\TCMP4.0\\trunk\\Sources\\trust\\webapp-hstdc\\WebContent')
    countFilesLines('E:\\TCMP4.0\\trunk\\Sources\\trust\\webapp-hstdc\\src')