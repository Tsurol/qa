# coding:utf-8

import hashlib
from flask import render_template, Blueprint, flash, request, redirect, url_for, session, g, jsonify

# 实例化蓝图对象
from flask_login import logout_user, current_user, login_required

from accounts.forms import RegisterForm, LoginForm, UpdateMineForm
from modules import User, db, UserProfile, LoginHistory, QuestionFollow
from utils import constants

accounts = Blueprint('accounts', __name__,
                     template_folder='templates',
                     static_folder='../assets')


@accounts.route('/login', methods=['GET', 'POST'])
def login():
    """登录"""
    form = LoginForm()
    # 当登录视图被重定向，它将会有一个查询字符串中的next变量，是用户试图访问的页面。
    next_url = request.values.get('next', url_for('qa.index'))  # 如果没有则跳转到首页
    if form.validate_on_submit():
        try:
            user_obj = form.login()
            if user_obj:
                # 4.跳转到首页
                flash('{},欢迎回来'.format(user_obj.nickname), 'success')
                return redirect(next_url)
            else:
                flash('登录失败,请稍后重试', 'danger')
        except Exception as e:
            print(e)
        flash('登录失败,请稍后重试', 'danger')
    return render_template('login.html', form=form, next_url=next_url)


@accounts.route('/register', methods=['GET', 'POST'])
# GET请求将表单在浏览器中渲染出来,POST提交相关数据进行处理。get是从服务器上获取数据，post是向服务器传送数据
def register():
    """注册"""
    form = RegisterForm()  # 传入写好的表单并去模板中渲染
    # 只有数据验证通过才会执行
    if form.validate_on_submit():
        try:
            user_obj = form.register()
            if user_obj:
                # 3.成功则跳转到登录页面
                flash('注册成功,请登录', 'success')  # 闪现系统使得在一个请求结束的时候记录一个信息，然后在且仅仅在下一个请求中访问这个数据
                return redirect(url_for('accounts.login'))
            else:
                flash('注册失败,请稍后再试', 'danger')
        except Exception as e:
            print(e)
        flash('注册失败,请稍后再试', 'danger')
    return render_template('register.html', form=form)


@accounts.route('/mine', methods=['GET', 'POST'])
def mine():
    """个人中心"""
    user = current_user
    if not current_user.is_authenticated:
        flash('请先登录', 'danger')
        return redirect(url_for('accounts.login'))
    form = UpdateMineForm()
    if form.validate_on_submit():
        try:
            userprofile_obj = form.save_update()
            if userprofile_obj:
                flash('修改成功', 'success')
                return redirect(url_for('accounts.mine'))
            else:
                flash('修改失败', 'danger')
                return redirect(url_for('accounts.mine'))
        except Exception as e:
            print(e)
        flash('修改失败', 'danger')
        return redirect(url_for('accounts.mine'))
    # 查询当前用户关注的问题
    per_page = 5
    page = request.args.get('page', 1, type=int)
    follow_question = QuestionFollow.query.filter_by(user_id=current_user.id)
    page_data = follow_question.paginate(page=page, per_page=per_page)
    return render_template('mine.html', user=user, page_data=page_data, form=form)


@accounts.route('/logout')
def logout():
    """退出登录"""
    # 通过g对象实现登出
    # session['user_id'] = ''
    # g.current_user = None
    logout_user()  # 用户将会被登出，以及所有他会话的cookies会被清除
    flash('欢迎下次再来', 'success')
    return redirect(url_for('accounts.login'))
