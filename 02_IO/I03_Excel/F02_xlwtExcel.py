import xlwt
from xlutils.copy import copy

wbk = xlwt.Workbook()
sheet = wbk.add_sheet('sheet 1')
sheet.write(0,2,'test test')
wbk.save('test.xls')


# 修改内容警告解决方式：使用cell_overwrite_ok=True来创建worksheet:  
# sheet2 =  wbk.add_sheet('sheet 2', cell_overwrite_ok=True) 