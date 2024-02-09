from . import db

class Users(db.Model):
    __tablename__ = 'users'
    _id = db.Column('id', db.Integer, primary_key=True)
    username = db.Column('username', db.String(50), nullable=False, unique=True)
    gender = db.Column('gender', db.String(1), nullable=False)
    email = db.Column('email', db.String(50), nullable=False)
    password = db.Column('password', db.String(50), nullable=False)
    
    def __init__(self, username, gender, email, password):
        self.username = username
        self.gender = gender
        self.email = email
        self.password = password
        
    def __repe__(self):
        return f'<User {self.username}>'