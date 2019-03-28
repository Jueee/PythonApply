import xlrd  

wb = xlrd.open_workbook('test.xls') 

sh = wb.sheet_by_index(0)   
print(sh, type(sh))
sheetNames = wb.sheet_names()
print(sheetNames, type(sheetNames))

# 获得工作表的两种方法  
sh1 = wb.sheet_by_index(0)
print(sh1, type(sh1))

# 单元格的值
cleeA1 = sh.cell(0,0)
print(cleeA1,type(cleeA1))
cleeA1Value = cleeA1.value
print(cleeA1Value)

# 第一列的值
columnValueList = sh.col_values(0)
print(columnValueList)