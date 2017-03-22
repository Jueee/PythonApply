from wxpy import *

bot = Bot(cache_path=True)
print(bot)

# 好友分布
# print(bot.friends().stats_text())

# 获取所有好友
# print(bot.friends())

# 获取所有群聊
# print(bot.groups())

# 获取所有公众号
#print(bot.mps())

if __name__ != '__main__':
    # 搜索好友
    my_friends = bot.friends().search('决', sex=MALE, city='杭州')
    if len(my_friends)>0:
        # 获取好友
        my_friend = my_friends[0]
        print(my_friend)
        # 发送信息
        # my_friend.send("Hello,WeChat!")
        # my_friend.send_image('weixinfriends.jpg')
        print(my_friend.is_friend)
# 好友
if __name__ != '__main__':
    my_friends = bot.friends()
    print(len(my_friends))
    for my_friend in my_friends:
        print(my_friend.is_friend,my_friend.remark_name,my_friend.province,my_friend.city)

# 群聊
if __name__ == '__main__':
    group_receiver = ensure_one(bot.groups().search('十三'))
    print(group_receiver)
    print(group_receiver.members)
    print(group_receiver.owner)
    # 指定这个群为接收者
    logger = get_wechat_logger(group_receiver)

    logger.error('公务员居然还考这些，也是有点奇葩的。。')
