from django.contrib import admin
from .models import Product, Service, Order

admin.site.register(Product)
admin.site.register(Service)
admin.site.register(Order)
