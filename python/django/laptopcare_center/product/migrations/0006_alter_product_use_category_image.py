# Generated by Django 4.2.11 on 2024-05-10 17:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0005_product_web_link'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='use_category_image',
            field=models.BooleanField(default=True),
        ),
    ]
