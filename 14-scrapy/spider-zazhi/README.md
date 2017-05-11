# 爬取历年的意林杂志目录 
[http://wuxizazhi.cnki.net/MagaList/YLYL.html](http://wuxizazhi.cnki.net/MagaList/YLYL.html)

## scrapy 工程爬取 ##
### 新建工程：
> scrapy startproject zazhi_yilin

### 执行工程：
> cd zazhi_yilin  

爬取2014年的杂志数据
> scrapy crawl yilin_2014  

爬取2009年的杂志数据
> scrapy crawl yilin_2009  

爬取所有年份的杂志数据
> scrapy crawl yilin_all  