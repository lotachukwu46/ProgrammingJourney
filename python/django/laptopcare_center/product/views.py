from django.shortcuts import render, get_object_or_404
from .models import Product, Category

def product(request):
    products = Product.objects.filter(is_sold=False)
    categories = Category.objects.all()
    return render(request, 'product/product.html', {
        'categories': categories,
        'products': products,
    })

def detail(request, pk):
    product =  get_object_or_404(Product, pk=pk)
    related_product = Product.objects.filter(is_sold=False, category=product.category).exclude(pk=pk)

    return render(request, 'product/detail.html', {
        'product': product,
        'related_product': related_product
    })