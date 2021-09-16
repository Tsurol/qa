# coding:utf-8
import os

"""项目的配置文件"""


class Config(object):
    """SQLALCHEMY配置"""
    # 连接数据库配置URI
    SQLALCHEMY_DATABASE_URI = 'mysql://root:root@localhost/qa_flask'
    # 动态追踪修改设置，如未设置只会提示警告
    SQLALCHEMY_TRACK_MODIFICATIONS = True
    # # 查询时会显示原始SQL语句
    # SQLALCHEMY_ECHO = True
    """秘钥设置"""
    SECRET_KEY = 'Tsurol123'
    """文件上传的根路径"""
    MEDIA_ROOT = os.path.join(os.path.dirname(__file__), 'medias')
