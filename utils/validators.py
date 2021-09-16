# coding:utf-8


import re

from wtforms import ValidationError

# 强制验证用户名为手机号
from modules import User, UserProfile


def phone_required(form, field):
    # form为表单类的实例对象，为固定格式
    """自定义的手机号验证"""
    username = field.data  # field.data是数据(field==form.username)
    pattern = r'^1[0-9]{10}$'
    if not re.search(pattern, username):
        raise ValidationError('请输入手机号')
    return field


def validate_nickname(form, field):
    """检测用户昵称是否已经存在"""
    nickname = User.query.filter_by(nickname=field.data).first()
    if nickname:
        raise ValidationError('该用户昵称已存在')
    return field


def validate_sex(form, field):
    """用户性别只能是男或女"""
    sex = field.data
    sex_list = ['男', '女']
    if sex not in sex_list:
        raise ValidationError('性别只能是男或女')
    return field


def validate_realname(form, field):
    """用户性别只能是男或女"""
    realname = field.data
    pattern = r'^([\\u4e00-\\u9fa5]{1,20}|[a-zA-Z\\.\\s]{1,20})$'
    if not re.search(pattern, realname):
        raise ValidationError('请输入您的真实姓名')
    return field
