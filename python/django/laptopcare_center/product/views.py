from django.shortcuts import render, get_object_or_404
from .models import Product, Category
from django.core.mail import send_mail
from django.conf import settings

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

def order(request, product_id):
    product = Product.objects.get(pk=product_id)
    context = {'product': product}
    return render(request, 'product/order.html', context)

def send_order_email(product_name, delivery_address, quantity, name, phone, email):
    subject = 'New Order Placed'
    message = f'Product: {product_name}\n from: {name}\n phone number: {phone}\n email: {email}\n Quantity: {quantity}\nAddress: {delivery_address}'
    from_email = settings.EMAIL_HOST_USER
    to_email = ['lotaodi46@gmail.com']
    send_mail(subject, message, from_email, to_email)