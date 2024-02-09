from flask import Flask
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()
DB_NAME = 'test'

def create_app():
    app = Flask(__name__)
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:1111@localhost:3306/' + DB_NAME
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['SECRET_KEY'] = 'KEY'
    
    db.init_app(app)
    
    from .views import views
    from .auth import auth
    
    app.register_blueprint(views, url_prefix='/')
    app.register_blueprint(auth, url_prefix='/auth/')
    
    from .models import Users
    
    with app.app_context():
        db.create_all()
    
    return app