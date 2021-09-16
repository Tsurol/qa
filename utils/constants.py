# coding:utf-8

"""常量配置"""
from enum import Enum, unique


@unique  # 让枚举类中不能有重复值
class UserStatus(Enum):
    """用户状态"""
    USER_ACTIVE = 1  # 启用,可以登录
    USER_IN_ACTIVE = 0  # 禁用,不可登录


@unique
class UserRole(Enum):
    """用户角色"""
    COMMON = 0  # 普通用户,可使用前台功能
    ADMIN = 1  # 管理员用户,可使用后台管理功能
    SUPER_ADMIN = 2  # 超级管理员,可以删除敏感数据,如用户等


@unique
class IfValid(Enum):
    """第三方账户逻辑删除"""
    VALID = 1  # 有效
    INVALID = 0  # 无效


@unique
class IfPublic(Enum):
    """第三方账户逻辑删除"""
    PUBLIC = 1  # 公开
    PRIVATE = 0  # 私密

