from math import log  
import operator  
import matplotlib.pyplot as plt  
  
def calcEntropy(dataSet):  
    """calculate the shannon entropy"""  
    numEntries=len(dataSet)  
    labelCounts={}  
    for entry in dataSet:  
        entry_label=entry[-1]  
        if entry_label not in labelCounts:  
            labelCounts[entry_label]=0  
        labelCounts[entry_label]+=1  
  
    entropy=0.0  
    for key in labelCounts:  
        prob=float(labelCounts[key])/numEntries  
        entropy-=prob*log(prob,2)  
  
    return entropy  
  
def createDataSet():  
    dataSet = [[1, 1, 'yes'],  
            [1, 1, 'yes'],  
            [1, 0, 'no'],  
            [0, 1, 'no'],  
            [0, 1, 'no']]  
    labels = ['no surfacing','flippers']  
    return dataSet, labels  
  
def splitDataSet(dataSet,axis,pivot):  
    """split dataset on feature"""  
    retDataSet=[]  
    for entry in dataSet:  
        if entry[axis]==pivot:  
            reduced_entry=entry[:axis]  
            reduced_entry.extend(entry[axis+1:])  
            retDataSet.append(reduced_entry)  
    return retDataSet  
  
def bestFeatureToSplit(dataSet):  
    """chooose the best feature to split """  
    numFeatures=len(dataSet[0])-1  
    baseEntropy=calcEntropy(dataSet)  
    bestInfoGain=0.0; bestFeature=-1  
    for axis in range(numFeatures):  
        #create unique list of class labels  
        featureList=[entry[axis] for entry in dataSet]  
        uniqueFeaList=set(featureList)  
        newEntropy=0.0  
        for value in uniqueFeaList:  
            subDataSet=splitDataSet(dataSet,axis,value)  
            prob=float(len(subDataSet))/len(dataSet)  
            newEntropy+=prob*calcEntropy(subDataSet)  
        infoGain=baseEntropy-newEntropy  
        #find the best infomation gain  
        if infoGain>bestInfoGain:  
            bestInfoGain=infoGain  
            bestFeature=axis  
    return bestFeature  
  
def majorityVote(classList):  
    """take a majority vote"""  
    classCount={}  
    for vote in classList:  
        if vote not in classCount.keys():  
            classCount[vote]=0  
        classCount+=1  
    sortedClassCount=sorted(classCount.iteritems(),  
            key=operator.itemgetter(1),reverse=True)  
    return sortedClassCount[0][0]  
  
def createTree(dataSet,labels):  
    classList=[entry[-1] for entry in dataSet]  
    #stop when all classes are equal  
    if classList.count(classList[0])==len(classList):  
        return classList[0]  
    #when no more features, return majority vote  
    if len(dataSet[0])==1:  
        return majorityVote(classList)  
     
    bestFeature=bestFeatureToSplit(dataSet)  
    bestFeatLabel=labels[bestFeature]  
    myTree={bestFeatLabel:{}}  
    del(labels[bestFeature])  
    subLabels=labels[:]  
    featureList=[entry[bestFeature] for entry in dataSet]  
    uniqueFeaList=set(featureList)  
    #split dataset according to the values of the best feature  
    for value in uniqueFeaList:  
        subDataSet=splitDataSet(dataSet,bestFeature,value)  
        myTree[bestFeatLabel][value]=createTree(subDataSet,subLabels)  
    return myTree  

if __name__ == '__main__':
    dataSet = ['1','2','3','4','5']
    labels = "adfadadas"
    createTree(dataSet, labels)