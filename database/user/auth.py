from flask import Blueprint, render_template, request, redirect, url_for, flash, session
from . import db
from .models import Users

auth = Blueprint('auth', __name__,)

@auth.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        login_username = request.form['username']
        login_password = request.form['password']
        
        user = Users.query.filter_by(username = login_username, password = login_password).first()
        
        if user:
            session['username'] = login_username
            flash('Login Success', 'success')
            return redirect(url_for('index', username = login_username))
        else:
            flash('Login Failed, Please Check.', 'danger')
    return render_template('login.html')

@auth.route('logout')
def logout():
    return '<p>Logout</p>'

@auth.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        gender = request.form['gender']
        email = request.form['email']
        password = request.form['password']
        
        new_user = Users(username=username, 
                        gender=gender,
                        email=email,
                        password=password)
        
        db.session.add(new_user)
        db.session.commit()
        
        flash('Signup Success! Please Login.', 'success')
        
        return redirect(url_for('auth.login'))
    
    return render_template('register.html')

@auth.route('/manage', methods=['GET', 'POST'])
def manage():
    query = Users.query.all()
        
    return render_template('manage.html', query=query)