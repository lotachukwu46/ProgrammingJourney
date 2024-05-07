from django.shortcuts import render
from product.models import Category, Product

def index(request):
    products = Product.objects.filter(is_sold=False)[0:6]
    categories = Category.objects.all()
    return render(request, 'core/index.html', {
        'categories': categories,
        'products': products,
    })

def service(request):
    return render(request, 'core/service.html')

def about(request):
    return render(request, 'core/about.html')

def contact(request):
    return render(request, 'core/contact.html')