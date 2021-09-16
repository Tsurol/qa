# coding:utf-8

"""自定义过滤器:定义->注册"""
from datetime import datetime

import timeago


def num_split(num):
    """实现千分位过滤器"""
    # num:需要格式化的数字 return:格式化后的字符串
    return '{:,}'.format(int(num))


def time_filter(dt):
    """日期和时间格式化显示"""
    # 3分钟前/1小时前
    # dt:datetime类型
    now = datetime.now()
    return timeago.format(dt, now, 'zh_CN')

def data_desc_filter(data):
    """实现将数据缩减过滤器"""
    # data:需要缩减的字符串 return:缩减后的字符串
    last = int(len(data) / 3)
    result = data[:last]
    return result
