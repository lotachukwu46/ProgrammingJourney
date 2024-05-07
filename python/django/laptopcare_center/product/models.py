from django.db import models
from django.db.models.signals import pre_save

class Category(models.Model):
    name = models.CharField(max_length=255)
    image = models.ImageField(upload_to='category_images/')

    class Meta:
        ordering = ('name',)
        verbose_name_plural = 'Categories'

    def __str__(self):
        return self.name


class Product(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    web_link = models.URLField(blank=True, null=True)
    name = models.CharField(max_length=100)
    description = models.TextField(blank=True, null=True)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    is_sold = models.BooleanField(default=False)
    image = models.ImageField(upload_to='products/', null=True, blank=True)
    use_category_image = models.BooleanField(default=False)

    def __str__(self):
        return self.name

def set_use_category_image_flag(sender, instance, **kwargs):
  """
  This function checks if a product image is uploaded and sets the use_category_image flag.
  """
  if not instance.image:
      instance.use_category_image = True

pre_save.connect(set_use_category_image_flag, sender=Product)
