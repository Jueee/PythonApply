获取Chrome浏览器保存的Cookie信息，方便调用登录页面。

使用方法：  

	# 使用方法参考
	if __name__=='__main__':
	    print('------使用requests进行解析访问------')
	    DOMAIN_NAME = '.zhihu.com'
	    get_url = r'https://www.zhihu.com/people/jueee/answers'
	    response = requests.get(get_url, cookies=get_chrome_cookies(DOMAIN_NAME))
	    
	    html_doc = response.text.encode('gbk','ignore').decode('gbk')
	    # print(html_doc)
	    
	    for match in re.finditer(r'<a class="question_link".*?href="(.*?)">(.*?)</a>', html_doc):
	        link = match.group(1)
	        title = match.group(2)
	        print('https://www.zhihu.com'+link,title)

执行结果：    

	https://www.zhihu.com/question/29152259/answer/43716583 你最喜欢的同人剪辑是哪支？  
	https://www.zhihu.com/question/26492841/answer/42708054 你见过最高明的「一句话毁掉小清新」是哪个？  
	https://www.zhihu.com/question/27399217/answer/36473733 Chrome 浏览器设计的神细节有哪些？  
	https://www.zhihu.com/question/24465544/answer/28110228 有炮不约的男人都是什么心态？  
	https://www.zhihu.com/question/24316367/answer/27393765 《无间道》刘德华打电话给曾志伟报信，查通话记录能查出谁是卧底吗？  
	https://www.zhihu.com/question/24309066/answer/27365662 跟不漂亮的女孩子谈恋爱是什么感觉？  
	https://www.zhihu.com/question/20009729/answer/27301991 哪句墓志铭让你印象深刻？
	https://www.zhihu.com/question/24239308/answer/27137138 数学中有哪些明明是暴力破解还给人美感的证明？  
	https://www.zhihu.com/question/24227312/answer/27097912 你听过最简短却很虐心的故事是哪个？  
	https://www.zhihu.com/question/23862357/answer/27026634 你见过最具孤独感的图片是什么？  
	https://www.zhihu.com/question/24201475/answer/27005427 如何用一句话形容一个人看遍了罪恶，却还能保持一颗善良的心？  
	https://www.zhihu.com/question/23927665/answer/26107911 如何看待女作家六六的这条微博？  
	https://www.zhihu.com/question/23838369/answer/25827820 如果《生活大爆炸》的主角换成四个学霸屌丝女和一个帅气无知男，还会有人看吗？为什么？  
	https://www.zhihu.com/question/23837461/answer/25824764 你遇到有哪些「设计值得吐槽」的 Logo？  
	https://www.zhihu.com/question/23525351/answer/25565868 怎样用正确的姿势吃小笼包？  
	https://www.zhihu.com/question/23727878/answer/25488058 男生会因为什么小事或细节对一个女生突然产生好感？  
	https://www.zhihu.com/question/23680305/answer/25339483 大学如何能谈一场真实的恋爱？  
	https://www.zhihu.com/question/23668906/answer/25293145 深泉学院（Deep Springs College，也译为幽泉学院）是一所什么样的学校？与网上许多描述有哪些出入？  
	https://www.zhihu.com/question/20894671/answer/25228803 日常生活中有哪些十分钟就能学会并可以终生受用的技能？  
	[Finished in 3.0s]