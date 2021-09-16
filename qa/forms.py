# coding:utf-8
import os
from datetime import datetime

from flask import current_app
from flask_login import current_user
from flask_wtf import FlaskForm
from flask_wtf.file import FileAllowed
from werkzeug.utils import secure_filename
from wtforms import StringField, TextAreaField, FileField
from wtforms.validators import DataRequired, Length
from flask_ckeditor import CKEditorField
from modules import Question, db, Answer, User, QuestionTags, QuestionFollow


class WriteQuestionForm(FlaskForm):
    """写文章\写问题"""
    img = FileField(label='上传图片', render_kw={
        'accept': '.jpeg, .jpg, .png'
    }, validators=[FileAllowed(['png', 'jpg', 'jpeg'], '请选择合适的图片类型')])

    """当用户单击文件选择按钮后，打开的文件选择窗口会默认将accept属性之外的文件过滤掉（其实没有过滤掉）。
    尽管如此，用户还是可以选择设定之外的文件，所以仍然需要在服务器端验证。"""

    title = StringField(label='标题', render_kw={
        'class': 'form-control',
        'placeholder': '请输入标题（最多50个字）'
    }, validators=[DataRequired(),
                   Length(min=5, max=50, message='标题长度为5~50字')])  # message:触发异常的提示

    tags = StringField(label='标签', render_kw={
        'class': 'form-control',
        'placeholder': '输入标签，用,分隔'
    })

    desc = TextAreaField(label='描述', render_kw={
        'class': 'form-control',
        'placeholder': '简述',
        'rows': "5"
    }, validators=[DataRequired(),
                   Length(max=150, message='描述最长为150字')])

    content = CKEditorField(label='正文', render_kw={
        'class': 'form-control',
        'placeholder': '请输入正文',
        'rows': "10"
    }, validators=[DataRequired(),
                   Length(min=5, message='正文不能少于5个字')])

    def save(self):
        """发布问题"""
        # 1.获取图片
        img = self.img.data
        img_name = ''
        if img:
            # 上传图片
            now = datetime.now()  # 返回当前当地时间和日期(datetime对象)
            now = now.strftime('%Y-%m-%d %H:%M')  # 转成字符串
            img_name = secure_filename(img.filename)  # 获取文件名时安全
            img_name = '{}_{}'.format(now, img_name)
            img_path = os.path.join(current_app.config['MEDIA_ROOT'], img_name)  # current_app:全局对象
            img.save(img_path)
        # 2.保存问题
        title = self.title.data
        desc = self.desc.data
        content = self.content.data
        question_obj = Question(title=title, desc=desc,
                                content=content, img=img_name, user=current_user)  # 将图片名称保存到数据库
        db.session.add(question_obj)
        # 3.保存标签
        tags = self.tags.data
        if tags:
            for tag in tags.split('，'):
                tag_obj = QuestionTags(tag_name=tag, question=question_obj)
                db.session.add(tag_obj)
        db.session.commit()
        return question_obj


class WriteAnswerForm(FlaskForm):
    """写回答"""
    content = CKEditorField(label='回答正文', render_kw={
        'class': 'form-control',
        'placeholder': '请输入正文',
        'rows': "10"
    }, validators=[
        DataRequired('回答内容不能为空'),
        Length(min=5, message='回答内容至少五个字')
    ])

    def save(self, question):
        """保存表单数据(回答)"""
        content = self.content.data
        user = current_user  # 当前用户对象
        answer_obj = Answer(content=content, user=user, question=question)
        db.session.add(answer_obj)
        db.session.commit()
        return answer_obj
