import commonDDB

from associationRule import *

commonDDB.dbName = 'mailin'


def read_file(raw_file):  
    """read file"""  
    sql = "SELECT MtaRule FROM `mailgasp`.`UserReport`  where SendTime>date_add(now(), interval -24 hour) and MtaRule not in ('') limit 1000"
    cur = commonDDB.selectSQL(sql)
    return [sorted(c[0].split(";")) for c in cur]  
  
def main():  
    sentences=read_file('mushroom.dat')  
    assrules=associationRule(sentences)  
    assrules.apriori()  
    assrules.generateRules()  
  
if __name__=="__main__":  
    main() 