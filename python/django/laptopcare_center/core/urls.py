from django.urls import path
from . import views

app_name = 'core'

urlpatterns = [
    path('', views.index, name='home'),
    path('send_email/', views.send_email, name='send_email'),
    path('about/', views.about, name='about'),
    path('services/', views.service, name='service'),
    path('contact/', views.contact, name='contact'),
]