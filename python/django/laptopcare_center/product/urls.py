from django.urls import path
from . import views

app_name = 'product'

urlpatterns = [
    path('product/', views.product, name='product'),
    path('<int:pk>/', views.detail, name='detail'),
   path('order/<int:product_id>/', views.order, name='order'),
]