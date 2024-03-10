from flask import Flask
from flask_mail import Mail
from flask_sqlalchemy import SQLAlchemy
from werkzeug.security import generate_password_hash, check_password_hash
# from flask_login import LoginManager
import os

db = SQLAlchemy()
mail = Mail()
# login_manager = LoginManager()

DB_NAME = 'test'

def create_app():
    app = Flask(__name__)
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:1111@localhost:3306/' + DB_NAME
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['SECRET_KEY'] = 'KEY'
    
    app.config['MAIL_SERVER'] = 'smtp.gmail.com'
    app.config['MAIL_PORT'] = 587
    app.config['MAIL_USE_TLS'] = True
    app.config['MAIL_USERNAME'] = 'george720102@gmail.com'
    app.config['MAIL_PASSWORD'] = 'ivla cnpp cvjr rkkt'
    app.config['MAIL_DEFAULT_SENDER'] = 'george720102@gmail.com'
        
    db.init_app(app)
    mail.init_app(app)
    # login_manager.init_app(app)
    
    from .views import views
    from .auth import auth
    
    app.register_blueprint(views, url_prefix='/')
    app.register_blueprint(auth, url_prefix='/auth/')
    
    from .models import Users
    
    with app.app_context():
        db.create_all()
    
    return app 

def set_password(password):
    return generate_password_hash(password)

def check_password(self, password):
    return check_password_hash(self.password_hashed, password)