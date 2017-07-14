file = open("Content.txt")

html = ""
while 1:
    line = file.readline()
    if not line:
        break
    html += """<section style="overflow:hidden;"><section style="width: 100%; padding: 0rem 1rem; box-sizing: border-box; font-size: 0.875rem; line-height: 1.5; height: auto; overflow: hidden;"><p>
<span style="font-size: 15px;">"""+line+"""</span><br/></section><svg style="width:100%;height:40rem;margin-top:-40rem;" ><rect style="width:100%;height:40rem;fill: #fff;"><animate attributename="opacity" begin="click" dur="3s" from="1" to="0" fill="freeze" ></animate></rect></svg></section>"""

print(html)
with open("result.html", 'w') as f:  
   f.write(html)  