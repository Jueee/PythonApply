from scrapy.selector import Selector
from scrapy.http import HtmlResponse

body = '<html><body><span>good</span></body></html>'
span_text = Selector(text=body).xpath('//span/text()').extract()
print span_text