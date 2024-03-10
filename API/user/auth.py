from flask import Blueprint, render_template, request, redirect, url_for, flash, session, make_response, json, jsonify
from . import db
from .models import Users
from .__init__ import set_password, check_password
from .email import send_email
from user.token import generate_token, confirm_token
from datetime import datetime

auth = Blueprint('auth', __name__)

# 登入函式
@auth.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        
        if request.values.get("login_submit") == 'login':
            login_username = request.form['username']
            login_password = request.form['password']
            
            user = Users.query.filter_by(username = login_username).first()
            
            if check_password(user, login_password):
                session['username'] = login_username
                flash('Login Success', 'success')
                return redirect(url_for('auth.index', username=login_username))
            else:
                flash('Login Failed, Please Check.', 'danger')
    return render_template('login.html')

# 註冊函式，註冊完成將會發送驗證信至註冊信箱中
@auth.route('/register', methods=['GET', 'POST'])
def register():
    
    if request.method == 'POST':
        
        if request.values.get("register_submit") == 'register':
        
            username = request.form['username']
            gender = request.form['gender']
            email = request.form['email']
            password = request.form['password']
            check_password = request.form['check_password']
            
            user = Users.query.filter_by(email=email).first()
            
            if user is None:
                
                if check_password == password:
                    
                    new_user = Users(username=username, 
                                    gender=gender,
                                    email=email,
                                    password_hashed=set_password(password)
                                    )
                
                    db.session.add(new_user)
                    db.session.commit()
                    
                
                    subject = "Verify your account"
                    token = generate_token(new_user.email)
                    confirm_url = url_for("auth.confirm_email", token=token, _external=True)
                    html = render_template("confirm_email.html", confirm_url=confirm_url)
                    
                    send_email(new_user.email, subject, html)
                
                else:
                    flash('Two password are not the same, please check!')
        
                    return redirect(url_for('auth.register'))                

# 後臺管理系統table展示頁面
@auth.route('/manage', methods=['GET', 'POST'])
def manage():
    query = Users.query.all()
        
    return render_template('manage.html', query=query)

# 後臺管理系統table的資料刪除函式
@auth.route('/delete_datas', methods=['GET', 'POST'])
def delete_datas():
    if request.method == 'POST':
        users = request.form.getlist("row_check")
        for i in users:
            user_id = int(i)
            delete_user = Users.query.filter_by(id=user_id).first()
            db.session.delete(delete_user)
            db.session.commit()
        
        if request.values.get("select_all") == "select_all":
            delete_users = Users.query.all()
          
    return redirect(url_for('auth.manage'))

# 驗證信箱連結啟動
@auth.route('/confirm/<token>')
def confirm_email(token):
    
    email = confirm_token(token)
    user = Users.query.filter_by(email=email).first_or_404()
    
    if user.is_confirmed:
        flash("Account already confirmed.", "success")
        return redirect(url_for("auth.login"))
    
    elif email == user.email:
        user.is_confirmed = True
        user.confirmed_on = datetime.now()
        db.session.add(user)
        db.session.commit()
        response = make_response("You have confirmed your account. Thanks!", "success")
        return response
    
    else:
        flash("The confirmation link is invalid or has expired.", "danger")
    
    return redirect(url_for("auth.login"))