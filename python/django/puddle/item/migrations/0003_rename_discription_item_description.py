# Generated by Django 4.2.11 on 2024-05-01 17:20

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('item', '0002_alter_category_options_item'),
    ]

    operations = [
        migrations.RenameField(
            model_name='item',
            old_name='discription',
            new_name='description',
        ),
    ]
