import uuid
import socket
import netifaces

# 获得本机MAC地址
def get_mac_address(): 
    mac=uuid.UUID(int = uuid.getnode()).hex[-12:] 
    return "-".join([mac[e:e+2] for e in range(0,11,2)])


# 获取本机电脑名
def get_host_name():
    return socket.getfqdn(socket.gethostname())


# 获取本机ip
def get_ip_address():
    myname = get_host_name()
    return socket.gethostbyname(myname)

# 获得Mac和IP
def networkinfo():
    devlist = []
    tempList = []
    devices = netifaces.interfaces()
    for dev in devices:
        devlist.append(dev)
    for devinfo in devlist:
        tmpdict = {}
        infos = netifaces.ifaddresses(devinfo)
        if len(infos) < 2:
            continue
        ip = infos[netifaces.AF_INET][0]['addr']
        if ip != '' and ip != '127.0.0.1':
            tmpdict["ip"] = ip
            tmpdict["mac"] = infos[netifaces.AF_LINK][0]['addr']
            break
    tempList.append(tmpdict)
    return tempList

if __name__ == '__main__':
    print(get_mac_address())
    print(get_host_name())
    print(get_ip_address())

    print(networkinfo())