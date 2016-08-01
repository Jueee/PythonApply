import commonDDB

from associationRule import *

commonDDB.dbName = 'mailin'


def read_data():  
    sql = "SELECT MtaRule FROM UserReport where SendTime>date_add(now(), interval -24 hour) and MtaRule not in ('') limit 100"
    cur = commonDDB.selectSQL(sql)
    return [sorted(c[0].split(";")) for c in cur]  
  
def main():  
    sentences=read_data()  
    assrules=associationRule(sentences)  
    assrules.apriori()  
    assrules.generateRules()  
  
if __name__=="__main__":  
    main() 