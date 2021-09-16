# coding:utf-8

from flask import Flask, session, g
from flask_ckeditor import CKEditor
from flask_migrate import Migrate
from flask_login import LoginManager
from accounts.views import accounts
from modules import db, User
from qa.views import qa
from utils.filters import num_split, time_filter, data_desc_filter

app = Flask(__name__, static_folder='medias')  # 实例化Flask类并配置静态目录
app.config.from_object('conf.Config')  # 从配置文件加载配置
db.init_app(app)  # 数据库初始化
migrate = Migrate(app, db)
# 富文本初始化
ckeditor = CKEditor()
ckeditor.init_app(app)

# 登录验证
login_manager = LoginManager()  # 为应用程序创建一个这个类
login_manager.init_app(app)  # 初始化

"""
默认的，当一个用户视图访问一个login_required视图而不登录时，
Flask-Login将会通过flash工具传出一个信息然后将他们重定向到登录视图
"""
login_manager.login_view = "accounts.login"  # 设置登陆视图
login_manager.login_message = "请登录"  # 设置flash工具发出的信息
login_manager.login_message_category = "danger"  # 自定义消息类型

# 注册蓝图
app.register_blueprint(accounts, url_prefix='/accounts')
app.register_blueprint(qa, url_prefix='/')

# 注册过滤器
app.jinja_env.filters['num_split'] = num_split
app.jinja_env.filters['time_filter'] = time_filter
app.jinja_env.filters['data_desc_filter'] = data_desc_filter

# @app.before_request
# # 在请求(request)之前做出响应
# def before_request():
#     """如果有用户id,则设置到全局对象"""
#     user_id = session.get('user_id', None)  # 从session中取到user_id
#     if user_id:
#         user = User.query.get(user_id)
#         g.current_user = user  # 将该用户存入g对象


# 回调,用来从对话里存储的用户ID中重新加载用户对象
# 如果ID不是有效的，返回None（不引发异常）
@login_manager.user_loader
def load_user(user_id):
    return User.query.get(user_id)
