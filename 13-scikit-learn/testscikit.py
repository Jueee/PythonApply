# coding:utf-8

import sys 
reload(sys) 
sys.setdefaultencoding('utf8')


from sklearn.feature_extraction.text import CountVectorizer
from sklearn.feature_extraction.text import TfidfTransformer

corpus=["中华 民族 血汗",
        "人民 血汗",
        "共和 国 数学 中华 英语 物理"]

# CountVectorizer是一个向量计数器
vectorizer = CountVectorizer()

# fit_transform把corpus二维数组转成了一个csr_matrix类型（稀疏矩阵）
print(type(vectorizer.fit_transform(corpus)))

# 打印稀疏矩阵的表示形式，即把二维数组里的所有词语组成的稀疏矩阵的第几行第几列有值
print(vectorizer.fit_transform(corpus))

# 把稀疏矩阵输出成真实矩阵
print(vectorizer.fit_transform(corpus).todense())

print("-----------------------------------------------------")

vectorizer=CountVectorizer()
csr_mat = vectorizer.fit_transform(corpus)
transformer=TfidfTransformer()
tfidf=transformer.fit_transform(csr_mat)
print type(tfidf)
print tfidf
print tfidf.todense()

word=vectorizer.get_feature_names()
for w in word:
    print w.decode('utf-8').encode('gbk')

