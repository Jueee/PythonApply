import numpy as np  
import scipy.spatial.distance as ssd  
import matplotlib.pyplot as plt   
  
def read_file(fn):  
    raw_file=open(fn)  
    dataSet=[]  
    for raw_row in raw_file.readlines():  
        row=raw_row.strip().split('\t')  
        dataSet.append((float(row[0]),float(row[1])))  
  
    return np.array(dataSet)  
  
def firstCentroids(k,dataSet):  
    """create the first centroids"""  
  
    num_columns=dataSet.shape[1]  
    centroids=np.zeros((k,num_columns))  
    for j in range(num_columns):  
        minJ=min(dataSet[:,j])  
        rangeJ=max(dataSet[:,j])-minJ  
        for i in range(k):  
            centroids[i,j]=minJ+rangeJ*np.random.uniform(0,1)  
    return np.array(centroids)  
  
def kmeans(k,dataSet):  
    num_rows,num_columns=dataSet.shape  
    centroids=firstCentroids(k,dataSet)  
      
    #store the cluster that the samples belong to  
    clusterAssment=np.zeros((num_rows,2))  
    clusterChanged=True  
    while clusterChanged:  
        clusterChanged=False  
         
        #find the closet centroid  
        for i in range(num_rows):  
            minDis=np.inf;minIndex=-1  
            for j in range(k):  
                distance=ssd.euclidean(dataSet[i,:],centroids[j,:])  
                if distance<minDis:  
                    minDis=distance;minIndex=j  
  
            if(clusterAssment[i,0]!=minIndex): clusterChanged=True  
            clusterAssment[i,:]=minIndex,minDis**2  
          
        #update the centroid location  
        for cent in range(k):  
            ptsInCent=dataSet[np.nonzero(clusterAssment[:,0]==cent)[0]]  
            centroids[cent,:]=np.mean(ptsInCent,axis=0)  
  
    return centroids,clusterAssment 