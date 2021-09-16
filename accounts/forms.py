# coding:utf-8

import hashlib

from flask import session, request
from flask_login import login_user, current_user
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, TextAreaField
from wtforms.validators import DataRequired, Length, EqualTo, ValidationError
from modules import User, db, UserProfile, LoginHistory
from utils import constants
from utils.validators import phone_required, validate_nickname, validate_sex, validate_realname


class RegisterForm(FlaskForm):
    """用户注册"""
    # label参数设置的是输入框前的文字描述
    username = StringField(label='用户名', render_kw={
        'class': 'form-control input-lg',
        'placeholder': '用户名'
    }, validators=[DataRequired(), phone_required])
    # 默认情况下，wtforms输出的字段HTML代码只会包含id和name属性。使用render_kw添加额外属性

    nickname = StringField(label='用户昵称', render_kw={
        'class': 'form-control input-lg',
        'placeholder': '用户昵称'
    }, validators=[DataRequired(), Length(min=2, max=20, message='昵称长度到2~20之间'),
                   validate_nickname])

    password = PasswordField(label='密码', render_kw={
        'class': 'form-control input-lg',
        'placeholder': '请输入密码'
    }, validators=[DataRequired()])

    confirm_password = PasswordField(label='确认密码', render_kw={
        'class': 'form-control input-lg',
        'placeholder': '请确认密码'
    }, validators=[DataRequired(), EqualTo(fieldname='password', message='两次密码输入不一致')])

    # 验证函数的名称由validate_fieldname组成,这种形式命名的自定义验证函数就可以得到验证
    def validate_username(self, field):
        """检测用户名是否已经存在"""
        user = User.query.filter_by(username=field.data).first()
        if user:
            # 如果user存在->验证不通过
            raise ValidationError('该用户名已存在')  # ValidationError:用来向用户显示错误信息
        return field

    def register(self):
        """自定义用户注册函数"""
        # 1.获取表单信息
        username = self.username.data
        nickname = self.nickname.data
        password = self.password.data
        # 2.添加到db.session
        try:
            # 将密码转成密文存储
            _token = '%s%s' % (password, 'python123')
            password = hashlib.sha256(_token.encode('utf-8')).hexdigest()  # 传入参数，并将参数_token转化成byte类型
            user_obj = User(username=username, nickname=nickname, password=password)
            db.session.add(user_obj)
            userprofile_obj = UserProfile(username=username, user=user_obj)  # 注意要传入user对象(外键关联)
            db.session.add(userprofile_obj)
            db.session.commit()  # 提交
            return user_obj  # 如果成功，则返回这个用户对象
        except Exception as e:
            print(e)
        return None  # 如果失败，则返回None


class LoginForm(FlaskForm):
    """用户登录"""
    username = StringField(label='用户名', render_kw={
        'class': 'form-control input-lg',
        'placeholder': '用户名'
    }, validators=[DataRequired(), phone_required])
    password = PasswordField(label='密码', render_kw={
        'class': 'form-control input-lg',
        'placeholder': '请输入密码'
    }, validators=[DataRequired()])

    def validate(self):
        result = super().validate()  # 调用父类validate()验证->调用每个字段的validate,如果验证通过则返回True
        # 拿到登录表单中的数据(用户名和密码)
        username = self.username.data
        password = self.password.data
        _token = '%s%s' % (password, 'python123')
        # 将密码加密
        password = hashlib.sha256(_token.encode('utf-8')).hexdigest()
        # 如果前面的验证都通过(DataRequired,phone_required)
        if result:
            # 验证加密后的密码是否正确
            user_obj = User.query.filter_by(username=username, password=password).first()
            if user_obj is None:
                # 验证不通过，数据库中没有这个用户
                result = False  # 表示验证失败
                self.username.errors = ['用户名或者密码错误']
            else:
                # 用户名和密码验证通过，接下来需要验证用户状态
                if user_obj.status == constants.UserStatus.USER_IN_ACTIVE.value:
                    # 用户被禁用
                    result = False  # 验证失败
                    self.username.errors = ['用户已被禁用']
        return result

    def login(self):
        """自定义用户登录函数"""
        username = self.username.data
        password = self.password.data
        try:
            _token = '%s%s' % (password, 'python123')
            password = hashlib.sha256(_token.encode('utf-8')).hexdigest()  # 将密码加密
            # 1.查找对应用户
            user_obj = User.query.filter_by(username=username, password=password).first()
            # 2.登录用户
            # session['user_id'] = user_obj.id  # 将用户id存入session->通过g对象实现登录
            login_user(user_obj)  # 可以记录/保存当前成功登陆的用户
            # 3.记录日志(记录用户登录历史)
            ip = request.remote_addr
            user_agent = request.headers.get('user-agent', None)  # 如果没查到则返回None
            login_history_obj = LoginHistory(ip=ip, login_from=user_agent,
                                             username=username, user=user_obj)
            db.session.add(login_history_obj)
            db.session.commit()  # 提交
            return user_obj
        except Exception as e:
            print(e)
        return None


class UpdateMineForm(FlaskForm):
    """用户修改个人信息"""
    nickname = StringField(label='昵称', render_kw={
        'id': 'nickname',
        'class': 'form-control'
    }, validators=[Length(min=0, max=20, message='昵称长度在0~20之间')])
    sex = StringField(label='性别', render_kw={
        'id': 'sex',
        'class': 'form-control'
    })
    real_name = StringField(label='真实姓名', render_kw={
        'id': 'real_name',
        'class': 'form-control'
    })
    maxim = TextAreaField(label='个性签名', render_kw={
        'id': 'maxim',
        'class': 'form-control',
        'rows': 5
    }, validators=[Length(min=0, max=35, message='个性签名长度在0~35之间')])

    def save_update(self):
        """保存修改的个人信息"""
        nickname = self.nickname.data
        sex = self.sex.data
        real_name = self.real_name.data
        maxim = self.maxim.data
        try:
            # user_info = [nickname, sex, real_name, maxim]
            userprofile_obj = UserProfile.query.filter_by(user_id=current_user.id).first()
            user_obj = User.query.get(current_user.id)
            if nickname == '':
                nickname = user_obj.nickname
            user_obj.nickname = nickname
            if sex == '':
                sex = userprofile_obj.sex
            userprofile_obj.sex = sex
            if real_name == '':
                real_name = userprofile_obj.real_name
            userprofile_obj.real_name = real_name
            if maxim == '':
                userprofile_obj.maxim = maxim
            userprofile_obj.maxim = maxim
            db.session.commit()
            return userprofile_obj
        except Exception as e:
            print(e)
        return None
