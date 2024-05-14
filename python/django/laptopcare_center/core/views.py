from django.shortcuts import render
from product.models import Category, Product
from django.core.mail import send_mail
from django.conf import settings
from django.http import HttpResponse

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
    if request.method == 'POST':
        send_contact_email(name=request.POST['name'], email=request.POST['email'], message=request.POST['message'])
    return render(request, 'core/contact.html')

def send_contact_email(name, email, message):
    subject = 'New Contact Form Submission'
    message = f'Name: {name}\nEmail: {email}\nMessage: {message}'
    from_email = settings.EMAIL_HOST_USER
    to_email = ['lotaodi46@gmail.com']
    send_mail(subject, message, from_email, to_email)

def send_email(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        message = request.POST.get('message')

        send_mail(
            'Contact Form Submission',
            f'Email: {email}\nMessage: {message}',
            settings.EMAIL_HOST_USER,
            ['lotaodi46@gmail.com'],
            fail_silently=False,
        )
        return HttpResponse('Email sent successfully!')
    else:
        return HttpResponse('Method not allowed')
