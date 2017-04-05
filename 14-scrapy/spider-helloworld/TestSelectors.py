# -*- coding: utf-8 -*-

from scrapy.selector import Selector
from scrapy.http import HtmlResponse

# 以文字构造:
body = '<html><body><span>good</span></body></html>'
print Selector(text=body).xpath('//span/text()').extract()

# 以response构造:
response = HtmlResponse(url='http://example.com',body=body)
print Selector(response=response).xpath('//span/text()').extract()
# 为了方便起见，response对象以 .selector 属性提供了一个selector， 您可以随时使用该快捷方法:
print response.selector.xpath('//span/text()').extract()
print response.xpath('//span/text()').extract()


doc = """
    <div>
        <ul>
             <li class="item-0"><a href="link1.html">first item</a></li>
             <li class="item-1"><a href="link2.html">second item</a></li>
             <li class="item-inactive"><a href="link3.html">third item</a></li>
             <li class="item-1"><a href="link4.html">fourth item</a></li>
             <li class="item-0"><a href="link5.html">fifth item</a></li>
         </ul>
     </div>
     """
sel = Selector(text=doc, type="html")
print sel.xpath('//li//@href').extract()
# 在列表中选择有”class”元素且结尾为一个数字的链接:
print sel.xpath('//li[re:test(@class, "item-\d$")]//@href').extract()

# 使用itemscopes组和对应的itemprops来提取微数据
doc = """
<div itemscope itemtype="http://schema.org/Product">
  <span itemprop="name">Kenmore White 17" Microwave</span>
  <img src="kenmore-microwave-17in.jpg" alt='Kenmore 17" Microwave' />
  <div itemprop="aggregateRating"
    itemscope itemtype="http://schema.org/AggregateRating">
   Rated <span itemprop="ratingValue">3.5</span>/5
   based on <span itemprop="reviewCount">11</span> customer reviews
  </div>

  <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
    <span itemprop="price">$55.00</span>
    <link itemprop="availability" href="http://schema.org/InStock" />In stock
  </div>

  Product description:
  <span itemprop="description">0.7 cubic feet countertop microwave.
  Has six preset cooking categories and convenience features like
  Add-A-Minute and Child Lock.</span>

  Customer reviews:

  <div itemprop="review" itemscope itemtype="http://schema.org/Review">
    <span itemprop="name">Not a happy camper</span> -
    by <span itemprop="author">Ellie</span>,
    <meta itemprop="datePublished" content="2011-04-01">April 1, 2011
    <div itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">
      <meta itemprop="worstRating" content = "1">
      <span itemprop="ratingValue">1</span>/
      <span itemprop="bestRating">5</span>stars
    </div>
    <span itemprop="description">The lamp burned out and now I have to replace
    it. </span>
  </div>

  <div itemprop="review" itemscope itemtype="http://schema.org/Review">
    <span itemprop="name">Value purchase</span> -
    by <span itemprop="author">Lucas</span>,
    <meta itemprop="datePublished" content="2011-03-25">March 25, 2011
    <div itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">
      <meta itemprop="worstRating" content = "1"/>
      <span itemprop="ratingValue">4</span>/
      <span itemprop="bestRating">5</span>stars
    </div>
    <span itemprop="description">Great microwave for the price. It is small and
    fits in my apartment.</span>
  </div>
  ...
</div>
"""
sel = Selector(text=doc, type="html")
for scope in sel.xpath('//div[@itemscope]'):
    print "current scope:", scope.xpath('@itemtype').extract()
    props = scope.xpath('''
                set:difference(./descendant::*/@itemprop,
                               .//*[@itemscope]/*/@itemprop)''')
    print "    properties:", props.extract()
    print


import logging
logging.warning("This is a warning")