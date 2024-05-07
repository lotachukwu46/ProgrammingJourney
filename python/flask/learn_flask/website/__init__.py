from flask import Flask

def create_app():
    app = Flask(__name__)
    app.config['SECRET_KEYs'] = 'apple'

    from .views import views
    from .auth import auth

    app.register_blueprint(views, url_prefix='/')

    return app
