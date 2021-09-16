# coding:utf-8
from flask_login import AnonymousUserMixin

from utils import constants
from datetime import datetime
from flask_sqlalchemy import SQLAlchemy

# 实例化SQLAlchemy类
db = SQLAlchemy()


class User(db.Model):
    """用户模型"""
    __tablename__ = 'accounts_user'  # 指定表名
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    # 用户名和密码(密文存储),用于登录
    username = db.Column(db.String(64), nullable=False, unique=True)
    password = db.Column(db.String(256), nullable=False)
    # 昵称
    nickname = db.Column(db.String(64), nullable=False)
    # 头像地址
    avatar = db.Column(db.String(64))
    # 用户状态
    status = db.Column(db.SmallInteger,
                       default=constants.UserStatus.USER_ACTIVE.value)
    # 是否为超级管理员
    is_super = db.Column(db.SmallInteger,
                         default=constants.UserRole.COMMON.value)
    # 注册时间
    created_at = db.Column(db.DateTime, default=datetime.now)
    # 更新时间
    """datetime.now：动态的当前时间，也就是数据库添加、修改的时间; datetime.now()：固定的时间，程序部署的时间"""
    updated_at = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)

    @property
    def is_authenticated(self):
        # 只有认证的用户将完成login_required标准
        return True  # 用户已经被认证,也就是说他们已经提供有效的证明

    @property
    def is_active(self):
        """有效的用户才能登陆系统"""
        return self.status == constants.UserStatus.USER_ACTIVE.value  # 这是一个除了作为身份认证的活动的用户,账号已被激活

    @property
    def is_anonymous(self):
        return False  # 实际用户应该返回False/如果这是一个匿名用户,则返回True

    def get_id(self):
        # 是一个方法,必须返回一个唯一标识该用户的unicode以及可能被用来从user_loader回调来加载用户
        return '{}'.format(self.id)

    # 在User上加一个profile属性,关联UserProfile模型
    # profile = db.relationship('UserProfile')

    def __str__(self):
        return self.nickname

    @property
    def answer_count(self):
        """某个用户的回答数"""
        return self.answer_list.filter_by(is_valid=constants.IfValid.VALID.value).count()

    @property
    def get_avatar_url(self):
        if self.avatar:
            return '/assets/home/qa/' + self.avatar
        else:
            return ''


class UserProfile(db.Model):
    """用户的详细信息"""
    __tablename__ = 'accounts_user_profile'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    # 外键,关联User中的id字段
    user_id = db.Column(db.Integer, db.ForeignKey('accounts_user.id'))
    # 冗余字段
    username = db.Column(db.String(64), nullable=False, unique=True)
    # 真实姓名
    real_name = db.Column(db.String(64))
    # 性别
    sex = db.Column(db.String(32))
    # 用户格言
    maxim = db.Column(db.String(256))
    # 地址
    address = db.Column(db.String(128))
    # 他的关注
    follow = db.Column(db.Integer, default=0)
    # 他的粉丝
    fans = db.Column(db.Integer, default=0)
    # 新增时间
    created_at = db.Column(db.DateTime, default=datetime.now)
    # 修改时间
    updated_at = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)
    """
    userprofile = UserProfile.query -> UserProfile对象
    userprofile.user -> User对象
    反之user = User.query -> User对象
    user.profile -> UserProfile对象
    """
    # 在UserProfile上加一个user属性,关联User模型
    # user = db.relationship('User')

    # 建立用户的一对一关系属性user.profile / profile.user  uselist=False:表示他们之间是一对一关系,默认一对多关系
    user = db.relationship('User', backref=db.backref('profile', uselist=False))


class LoginHistory(db.Model):
    """用户的登录历史"""
    __tablename__ = 'accounts_login_history'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    # 外键,关联User中的id字段
    user_id = db.Column(db.Integer, db.ForeignKey('accounts_user.id'))
    # 用户名
    username = db.Column(db.String(64), nullable=False)
    # 账号平台
    login_type = db.Column(db.String(64))
    # IP地址
    ip = db.Column(db.String(128))
    # 登录来源(user-agent)
    login_from = db.Column(db.String(256))
    # 登陆时间
    logined_at = db.Column(db.DateTime, default=datetime.now)
    # 建立与用户的一对多关系属性,user.history_list
    # dynamic:不是直接加载这些数据，SQLAlchemy会返回一个查询对象，在加载数据前您可以过滤（提取）它们,不可用在一对一关系
    user = db.relationship('User', backref=db.backref('history_list', lazy='dynamic'))


class Third(db.Model):
    """第三方登录账户"""
    __tablename__ = 'accounts_third'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    # 外键,关联User中的id字段
    user_id = db.Column(db.Integer, db.ForeignKey('accounts_user.id'))
    # 平台类型
    type = db.Column(db.String(64), nullable=False)
    # 登录名
    login_name = db.Column(db.String(64), nullable=False)
    # 是否有效(逻辑删除)
    is_valid = db.Column(db.SmallInteger, default=constants.IfValid.VALID.value)
    # 登陆时间
    logined_at = db.Column(db.DateTime, default=datetime.now)
    # 更新时间
    updated_at = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)
    # 建立用户的一对一关系属性user.third / third.user
    user = db.relationship('User', backref=db.backref('third', uselist=False))


class Question(db.Model):
    """问题"""
    __tablename__ = 'qa_question'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    # 外键,关联User中的id字段
    user_id = db.Column(db.Integer, db.ForeignKey('accounts_user.id'))
    # 标题
    title = db.Column(db.String(128), nullable=False)
    # 描述
    desc = db.Column(db.String(128))
    # 图片地址
    img = db.Column(db.String(128))
    # 问题内容
    content = db.Column(db.Text, nullable=False)
    # 排序
    reorder = db.Column(db.Integer, default=0)
    # 是否有效
    is_valid = db.Column(db.SmallInteger, default=constants.IfValid.VALID.value)
    # 浏览次数
    view_count = db.Column(db.Integer, default=0)
    # 提问时间
    questioned_at = db.Column(db.DateTime, default=datetime.now)
    # 最后修改时间
    updated_at = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)
    # 建立与用户的一对多属性,user.question_list
    user = db.relationship('User', backref=db.backref('question_list', lazy='dynamic'))

    @property
    def get_img_url(self):
        if self.img:
            return '/medias/' + self.img
        else:
            return ''

    @property
    def comment_count(self):
        """问题下面的评论数"""
        return self.question_comment_list.filter_by(is_valid=constants.IfValid.VALID.value).count()

    @property
    def follow_count(self):
        """问题的关注数"""
        return self.follow_question_list.filter_by(is_valid=constants.IfValid.VALID.value).count()

    @property
    def love_count(self):
        """问题的点赞数"""
        return self.question_love_list.count()

    @property
    def answer_count(self):
        """问题下的回答数"""
        return self.answer_list.filter_by(is_valid=constants.IfValid.VALID.value).count()


class Answer(db.Model):
    """问题的回答"""
    __tablename__ = 'qa_answer'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    # 外键,关联用户
    user_id = db.Column(db.Integer, db.ForeignKey('accounts_user.id'))
    # 外键,关联问题
    q_id = db.Column(db.Integer, db.ForeignKey('qa_question.id'))
    # 回答内容
    content = db.Column(db.Text, nullable=False)
    # 是否有效
    is_valid = db.Column(db.SmallInteger, default=constants.IfValid.VALID.value)
    # 回答的时间
    answered_at = db.Column(db.DateTime, default=datetime.now)
    # 最后修改回答的时间
    updated_at = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)

    # 建立与用户的一对多属性,user.answer_list
    user = db.relationship('User', backref=db.backref('answer_list', lazy='dynamic'))
    # 建立与问题的一对多属性,question.answer_list
    question = db.relationship('Question', backref=db.backref('answer_list', lazy='dynamic'))

    @property
    def love_count(self):
        """回答的点赞数"""
        return self.answer_love_list.count()

    @property
    def dislove_count(self):
        """回答的踩踩数"""
        return self.answer_dislove_list.count()

    @property
    def comment_count(self):
        """回答下的评论数"""
        return self.answer_comment_list.filter_by(is_valid=constants.IfValid.VALID.value,
                                                  is_public=constants.IfPublic.PUBLIC.value).count()

    def comment_list(self, reply_id=None):
        # 默认reply_id=None:评论
        # 传入reply_id:回复一条评论
        """回答下有效的评论列表"""
        return self.answer_comment_list.filter_by(is_valid=constants.IfValid.VALID.value,
                                                  is_public=constants.IfPublic.PUBLIC.value,
                                                  reply_id=reply_id)


class Comment(db.Model):
    """评论"""
    __tablename__ = 'qa_comment'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    # 外键,关联用户
    user_id = db.Column(db.Integer, db.ForeignKey('accounts_user.id'))
    # 外键,关联回答
    answer_id = db.Column(db.Integer, db.ForeignKey('qa_answer.id'))
    # 外键,关联问题(冗余字段)
    question_id = db.Column(db.Integer, db.ForeignKey('qa_question.id'))
    # 关联自己(评论的回复),回复ID
    reply_id = db.Column(db.Integer, db.ForeignKey('qa_comment.id'), nullable=True)
    # 评论内容
    content = db.Column(db.Text, nullable=False)
    # 点赞人数
    love_count = db.Column(db.Integer, default=0)
    # 是否有效
    is_valid = db.Column(db.SmallInteger, default=constants.IfValid.VALID.value)
    # 是否公开
    is_public = db.Column(db.SmallInteger, default=constants.IfPublic.PUBLIC.value)
    # 评论时间
    commented_at = db.Column(db.DateTime, default=datetime.now)
    # 最后修改的时间
    updated_at = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)

    # 建立与用户的一对多属性,user.answer_comment_list
    user = db.relationship('User', backref=db.backref('answer_comment_list', lazy='dynamic'))
    # 建立与回答的一对多属性,answer.answer_comment_list
    answer = db.relationship('Answer', backref=db.backref('answer_comment_list', lazy='dynamic'))
    # 建立与问题的一对多属性,question.question_comment_list -> 回答对应的问题,查询问题被评论了多少次==这个问题下的回答被评论了多少次
    question = db.relationship('Question', backref=db.backref('question_comment_list', lazy='dynamic'))


class AnswerLove(db.Model):
    """点赞回答"""
    __tablename__ = 'qa_answer_love'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    # 外键,关联用户
    user_id = db.Column(db.Integer, db.ForeignKey('accounts_user.id'))
    # 外键,关联回答
    answer_id = db.Column(db.Integer, db.ForeignKey('qa_answer.id'))
    # 外键,关联问题(冗余)
    question_id = db.Column(db.Integer, db.ForeignKey('qa_question.id'))
    # 点赞时间
    loved_at = db.Column(db.DateTime, default=datetime.now)
    # 点赞的删除->：物理删除

    # 建立与用户的一对多属性,user.user_love_list
    user = db.relationship('User', backref=db.backref('answer_love_list', lazy='dynamic'))
    # 建立与回答的一对多属性,answer.answer_love_list
    answer = db.relationship('Answer', backref=db.backref('answer_love_list', lazy='dynamic'))
    # 建立与问题的一对多属性,question.question_love_list
    question = db.relationship('Question', backref=db.backref('question_love_list', lazy='dynamic'))


class AnswerDisLove(db.Model):
    """踩踩回答"""
    __tablename__ = 'qa_answer_dislove'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    # 外键,关联用户
    user_id = db.Column(db.Integer, db.ForeignKey('accounts_user.id'))
    # 外键,关联回答
    answer_id = db.Column(db.Integer, db.ForeignKey('qa_answer.id'))
    # 外键,关联问题(冗余)
    question_id = db.Column(db.Integer, db.ForeignKey('qa_question.id'))
    # 踩踩时间
    dislove_at = db.Column(db.DateTime, default=datetime.now)

    # 建立与用户的一对多属性,user.user_dislove_list
    user = db.relationship('User', backref=db.backref('user_dislove_list', lazy='dynamic'))
    # 建立与回答的一对多属性,answer.answer_dislove_list
    answer = db.relationship('Answer', backref=db.backref('answer_dislove_list', lazy='dynamic'))
    # 建立与问题的一对多属性,question.question_dislove_list
    question = db.relationship('Question', backref=db.backref('question_dislove_list', lazy='dynamic'))


class AnswerCollect(db.Model):
    """我收藏的回答"""
    __tablename__ = 'qa_answer_collect'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    # 外键,关联用户
    user_id = db.Column(db.Integer, db.ForeignKey('accounts_user.id'))
    # 外键,关联回答
    answer_id = db.Column(db.Integer, db.ForeignKey('qa_answer.id'))
    # 外键,关联问题(冗余)
    question_id = db.Column(db.Integer, db.ForeignKey('qa_question.id'))
    # 是否有效
    is_valid = db.Column(db.SmallInteger, default=constants.IfValid.VALID.value)
    # 收藏时间
    collected_at = db.Column(db.DateTime, default=datetime.now)

    # 建立与用户的一对多属性, user.answer_collect_list
    user = db.relationship('User', backref=db.backref('answer_collect_list', lazy='dynamic'))
    # 建立与问题的一对多属性,question.question_collect_list
    question = db.relationship('Question', backref=db.backref('question_collect_list', lazy='dynamic'))
    # 建立与回答的一对多属性,answer.answer_collect_list
    answer = db.relationship('Answer', backref=db.backref('answer_collect_list', lazy='dynamic'))


class QuestionFollow(db.Model):
    """我关注的问题"""
    __tablename__ = 'qa_question_follow'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)  # 主键
    # 外键,关联用户
    user_id = db.Column(db.Integer, db.ForeignKey('accounts_user.id'))
    # 外键,关联问题
    q_id = db.Column(db.Integer, db.ForeignKey('qa_question.id'))
    # 是否有效
    is_valid = db.Column(db.SmallInteger, default=constants.IfValid.VALID.value, comment='逻辑删除')
    # 关注时间
    followed_at = db.Column(db.DateTime)
    # 建立与用户的一对多属性, user.follow_question_list
    user = db.relationship('User', backref=db.backref('follow_question_list', lazy='dynamic'))
    # 建立与问题的一对多属性, question.follow_question_list
    question = db.relationship('Question', backref=db.backref('follow_question_list', lazy='dynamic'))


class QuestionTags(db.Model):
    """问题下的标签"""
    __tablename__ = 'qa_question_tags'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)  # 主键
    # 外键,关联问题
    q_id = db.Column(db.Integer, db.ForeignKey('qa_question.id'))
    # 标签名称
    tag_name = db.Column(db.String(64), nullable=False)
    # 是否有效
    is_valid = db.Column(db.SmallInteger, default=constants.IfValid.VALID.value)
    # 添加标签时间
    added_at = db.Column(db.DateTime, default=datetime.now)
    # 建立与问题的一对多属性, question.tag_list
    question = db.relationship('Question', backref=db.backref('tag_list', lazy='dynamic'))
