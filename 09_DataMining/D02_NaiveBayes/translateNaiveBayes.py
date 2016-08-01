#! /usr/bin/python
# -*- coding: utf-8 -*-
'''
拼写检查（spelling corrector）
'''


import re, collections  

'''
解释文档
http://www.ruanyifeng.com/blog/2012/10/spelling_corrector.html

Google的研发总监Peter Norvig，写过一篇著名的文章，解释这种方法的原理。
http://norvig.com/spell-correct.html
'''

# 定义words()函数，用来取出文本库的每一个词
# lower()将所有词都转成小写，避免因为大小写不同，而被算作两个词
def words(text): return re.findall('[a-z]+', text.lower())   

# 定义一个train()函数，用来建立一个"字典"结构。
# 文本库的每一个词，都是这个"字典"的键；它们所对应的值，就是这个词在文本库的出现频率。
def train(features):  
    # 每一个词的默认出现频率为1。这是针对那些没有出现在文本库的词。
    # 如果一个词没有在文本库出现，我们并不能认定它就是一个不存在的词，因此将每个词出现的默认频率设为1。
    model=collections.defaultdict(lambda: 1)  
    # 以后每出现一次，频率就增加1。
    for f in features:  
        model[f] += 1  
    return model  

# 使用words()和train()函数，生成上一步的"词频字典"，放入变量NWORDS。
NWORDS = train(words(file('big.txt').read()))  
  
alphabet = 'abcdefghijklmnopqrstuvwxyz'  
  
# 定义edits1()函数，用来生成所有与输入参数word的"编辑距离"为1的词。
def edits1(word):  
    # splits：将word依次按照每一位分割成前后两半。
    # 比如，'abc'会被分割成 [('', 'abc'), ('a', 'bc'), ('ab', 'c'), ('abc', '')] 。
    splits=[(word[:i], word[i:]) for i in range(len(word) + 1)]  
    # beletes：依次删除word的每一位后、所形成的所有新词。
    # 比如，'abc'对应的deletes就是 ['bc', 'ac', 'ab'] 。
    deletes=[a + b[1:] for a, b in splits if b]  
    # transposes：依次交换word的邻近两位，所形成的所有新词。
    # 比如，'abc'对应的transposes就是 ['bac', 'acb'] 。
    transposes=[a + b[1] + b[0] + b[2:] for a, b in splits if len(b)>1]  
    # replaces：将word的每一位依次替换成其他25个字母，所形成的所有新词。
    # 比如，'abc'对应的replaces就是 ['abc', 'bbc', 'cbc', ... , 'abx', ' aby', 'abz' ] ，一共包含78个词（26 × 3）。
    replaces=[a + c + b[1:] for a, b in splits for c in alphabet if b] 
    # inserts：在word的邻近两位之间依次插入一个字母，所形成的所有新词。
    # 比如，'abc' 对应的inserts就是['aabc', 'babc', 'cabc', ..., 'abcx', 'abcy', 'abcz']，一共包含104个词（26 × 4）。 
    inserts=[a + c + b  for a, b in splits for c in alphabet]  
    # edit1()返回deletes、transposes、replaces、inserts的合集，这就是与word"编辑距离"等于1的所有词。
    # 对于一个n位的词，会返回54n+25个词。
    return set(deletes + transposes + replaces + inserts)  

# 定义edit2()函数，用来生成所有与word的"编辑距离"为2的词语。
# 但是这样的话，会返回一个 (54n+25) * (54n+25) 的数组，实在是太大了
def edits2(word):
　　return set(e2 for e1 in edits1(word) for e2 in edits1(e1))

# 因此，我们将edit2()改为known_edits2()函数，将返回的词限定为在文本库中出现过的词。
def known_edits2(word):  
    return set(e2 for e1 in edits1(word) for e2 in edits1(e1) if e2 in NWORDS)  

# 定义correct()函数，用来从所有备选的词中，选出用户最可能想要拼写的词。
def known(words): return set(w for w in words if w in NWORDS)  
  
def correct(word):  
    '''
    我们采用的规则为：
    （1）如果word是文本库现有的词，说明该词拼写正确，直接返回这个词；
　　（2）如果word不是现有的词，则返回"编辑距离"为1的词之中，在文本库出现频率最高的那个词；
　　（3）如果"编辑距离"为1的词，都不是文本库现有的词，则返回"编辑距离"为2的词中，出现频率最高的那个词；
　　（4）如果上述三条规则，都无法得到结果，则直接返回word。
    '''
    candidates = known([word]) or known(edits1(word)) or known_edits2(word) or [word]  
    return max(candidates, key=NWORDS.get)  


if __name__=='__main__':
    print correct("tount")

'''
缺陷

我们使用的这种算法，有一些缺陷，如果投入生产环境，必须在这些方面加入改进。

（1）文本库必须有很高的精确性，不能包含拼写错误的词。
如果用户输入一个错误的拼法，文本库恰好包含了这种拼法，它就会被当成正确的拼法。

（2）对于不包含在文本库中的新词，没有提出解决办法。
如果用户输入一个新词，这个词不在文本库之中，就会被当作错误的拼写进行纠正。

（3）程序返回的是"编辑距离"为1的词，但某些情况下，正确的词的"编辑距离"为2。
比如，用户输入reciet，会被纠正为recite（编辑距离为1）,但用户真正想要输入的词是receipt（编辑距离为2）。也就是说，"编辑距离"越短越正确的规则，并非所有情况下都成立。

（4）有些常见拼写错误的"编辑距离"大于2。
这样的错误，程序无法发现。

（5）用户输入的词的拼写正确，但是其实想输入的是另一个词。
比如，用户输入是where，这个词拼写正确，程序不会纠正。但是，用户真正想输入的其实是were，不小心多打了一个h。

（6）程序返回的是出现频率最高的词，但用户真正想输入的是另一个词。
比如，用户输入ther，程序会返回the，因为它的出现频率最高。但是，用户真正想输入的其实是their，少打了一个i。也就是说，出现频率最高的词，不一定就是用户想输入的词。

（7）某些词有不同的拼法，程序无法辨别。
比如，英国英语和美国英语的拼法不一致。英国用户输入'humur'，应该被纠正为'humour'；美国用户输入'humur'，应该被纠正为'humor'。但是，我们的程序会统一纠正为'humor'。

'''