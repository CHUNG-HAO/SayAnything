from flask_mail import Message
from .__init__ import mail

def send_email(recipient, subject, template):
    msg = Message(subject=subject, recipients=[recipient])
    msg.html = template
    mail.send(msg)