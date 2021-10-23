# coding:utf-8

from flask import render_template, Blueprint, request, abort, flash, redirect, url_for, jsonify, session
from flask_login import login_required, current_user

from modules import Question, User, Answer, Comment, db, QuestionFollow, AnswerLove, AnswerCollect, AnswerDisLove
from qa.forms import WriteQuestionForm, WriteAnswerForm
from utils import constants

# 实例化蓝图对象
qa = Blueprint('qa', __name__,
               static_folder='../assets',
               template_folder='templates')


@qa.route('/')
def index():
    """首页 回答列表"""
    per_page = 3  # 每页10条数据
    page = request.args.get('page', 1, type=int)  # 获取当前页码,若没有则为第一页
    page_data = Question.query.filter_by(is_valid=constants.IfValid.VALID.value).paginate(page=page,
                                                                                          per_page=per_page)
    return render_template('index.html', page_data=page_data)


@qa.route('/follow')
def follow():
    """当前用户关注的问题列表"""
    # 先验证用户是否登录
    if not current_user.is_authenticated:
        flash('请先登录', 'danger')
        return redirect(url_for('accounts.login'))
    return render_template('follow.html')


# 后端视图层编写数据接口
@qa.route('/qa/list')
def question_list():
    """异步查询问题数据列表"""
    """json {
        'code':0,
        'data': '数据'
    }"""
    try:
        per_page = 2
        page = request.args.get('page', 1, type=int)
        lst = []  # 用来保存当前用户关注的问题id
        # 只查询当前用户关注的问题
        question_follow = QuestionFollow.query.filter_by(user_id=current_user.id).all()
        for item in question_follow:
            lst.append(item.q_id)
        page_data = Question.query.filter(Question.id.in_(lst)).paginate(page=page, per_page=per_page)
        data = render_template('qa_list.html', page_data=page_data)
        return {'code': 0, 'data': data}
    except Exception as e:
        print(e)
        data = ''
    return {'code': 1, 'data': data}


@qa.route('/detail/<int:q_id>', methods=['GET', 'POST'])
# GET:展示详情页;POST:提交回答数据
def detail(q_id):
    """问题详情"""
    # 查询指定的问题信息
    question = Question.query.get(q_id)  # 查询Question模型中主键==q_id的对象
    if not question.is_valid:
        abort(404)
    # 查询所有的问题信息
    questions = Question.query.filter_by(is_valid=constants.IfValid.VALID.value).all()
    # 只展示第一条回答信息
    # answer = Answer.query.filter_by(is_valid=constants.IfValid.VALID.value, q_id=q_id).first()
    answer = question.answer_list.filter_by(is_valid=constants.IfValid.VALID.value).first()
    # 指定问题的标签
    question_tags = question.tag_list.filter_by(is_valid=constants.IfValid.VALID.value).all()
    # 添加回答
    form = WriteAnswerForm()
    if form.validate_on_submit():
        try:
            if not current_user.is_authenticated:
                # 返回False->用户是未登录状态
                flash('请先登录', 'danger')
                return redirect(url_for('accounts.login'))
            answer_obj = form.save(question=question)
            if answer_obj:
                flash('发布回答成功', 'success')
                return redirect(url_for('qa.detail', q_id=question.id))
            else:
                flash('发布回答失败', 'danger')
        except Exception as e:
            print(e)
        flash('发布回答失败', 'danger')
    return render_template('detail.html', question=question, answer=answer,
                           question_tags=question_tags, questions=questions, form=form)


@qa.route('/write', methods=['GET', 'POST'])
@login_required  # 判断用户是否登录。如果没有登录则重定向到登录页面,登录成功则跳回此页面
def write():
    """写文章,提问"""
    form = WriteQuestionForm()
    if form.validate_on_submit():
        # 将表单中传过来的内容保存到数据库
        try:
            question_obj = form.save()
            if question_obj:
                flash('发布问题成功', 'success')
                return redirect(url_for('qa.index'))
            else:
                flash('发布失败,请稍后重试', 'danger')
        except Exception as e:
            print(e)
        flash('发布失败,请稍后重试', 'danger')
    return render_template('write.html', form=form)


@qa.route('/comments/<int:answer_id>', methods=['GET', 'POST'])
def comments(answer_id):
    """评论"""
    answer = Answer.query.get(answer_id)
    question = answer.question
    if request.method == 'POST':
        # 添加一条评论
        try:
            # 判断用户是否登录
            if not current_user.is_authenticated:
                result = {'code': 1, 'message': '请登录'}
                return jsonify(result), 400
            # 1.获取前端传递的参数
            content = request.form.get('content', '')
            reply_id = request.form.get('reply_id', None)
            # 2.保存到数据库
            comment_obj = Comment(content=content, user=current_user,
                                  answer=answer, question=question, reply_id=reply_id)
            db.session.add(comment_obj)
            db.session.commit()
            # 如果添加成功，则返回result和201状态码
            result = {'code': 0, 'message': '评论成功'}
            return jsonify(result), 201
        except Exception as e:
            print(e)
            result = {'code': 1, 'message': '服务器正忙,请稍后重试'}
            # jsonify将字典转成json字符串
            return jsonify(result), 400
    else:
        # GET获取坪论列表
        try:
            page = int(request.args.get('page', 1))
            page_data = answer.comment_list().paginate(page=page, per_page=3)
            data = render_template('comments.html', page_data=page_data, answer=answer)  # 获取html内容
            return jsonify({'code': 0, 'data': data, 'meta': {'page': page}}), 200
        except Exception as e:
            print(e)
            return jsonify({'code': 1, 'data': '', 'message': '服务器正忙'}), 500


@qa.route('/comment/love/<int:comment_id>', methods=['POST'])
def comment_love(comment_id):
    """为评论点赞"""
    try:
        if not current_user.is_authenticated:
            return '请登录', 401
        comment = Comment.query.get(comment_id)
        comment.love_count += 1
        db.session.add(comment)
        db.session.commit()
    except Exception as e:
        print(e)
        abort(500)
    return '点赞成功', 201


@qa.route('/question/follow/<int:q_id>', methods=['POST'])
def question_follow(q_id):
    """关注问题"""
    try:
        if not current_user.is_authenticated:
            return '请登录', 401
        question_follow_obj = QuestionFollow(q_id=q_id, user_id=current_user.id)
        db.session.add(question_follow_obj)
        db.session.commit()
    except Exception as e:
        print(e)
        abort(500)
    return '关注成功', 201


@qa.route('/question/unfollow/<int:q_id>', methods=['POST'])
def question_unfollow(q_id):
    """取消关注问题"""
    try:
        # if not current_user.is_authenticated:
        #     return '请登录', 401
        question_follow_obj = QuestionFollow.query.filter_by(q_id=q_id, user_id=current_user.id).first()
        db.session.delete(question_follow_obj)
        db.session.commit()
    except Exception as e:
        print(e)
        abort(500)
    return '取消关注成功', 201


@qa.route('/answer/love/<int:q_id>/<int:a_id>', methods=['POST'])
def answer_love(q_id, a_id):
    """点赞回答"""
    try:
        if not current_user.is_authenticated:
            return jsonify({'code': 2, 'message': '请登录'}), 401
        answer_love_obj = AnswerLove(user_id=current_user.id, question_id=q_id, answer_id=a_id)
        db.session.add(answer_love_obj)
        db.session.commit()
        result = {'code': 0, 'message': '点赞成功'}
        return jsonify(result), 201
    except Exception as e:
        print(e)
        abort(500)


@qa.route('/answer/dislove/<int:q_id>/<int:a_id>', methods=['POST'])
def answer_dislove(q_id, a_id):
    """踩踩回答"""
    try:
        if not current_user.is_authenticated:
            return jsonify({'code': 2, 'message': '请登录'}), 401
        answer_dislove_obj = AnswerDisLove(user_id=current_user.id, question_id=q_id, answer_id=a_id)
        db.session.add(answer_dislove_obj)
        db.session.commit()
        result = {'code': 0, 'message': '踩踩成功'}
        return jsonify(result), 201
    except Exception as e:
        print(e)
        abort(500)


@qa.route('/answer/collect/<int:q_id>/<int:a_id>', methods=['POST'])
def answer_collect(q_id, a_id):
    """收藏回答"""
    try:
        if not current_user.is_authenticated:
            return jsonify({'code': 2, 'message': '请登录'}), 401
        answer_collect_obj = AnswerCollect(user_id=current_user.id, question_id=q_id, answer_id=a_id)
        db.session.add(answer_collect_obj)
        db.session.commit()
        result = {'code': 0, 'message': '收藏成功'}
        return jsonify(result), 201
    except Exception as e:
        print(e)
        abort(500)
