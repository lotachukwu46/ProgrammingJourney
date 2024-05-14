from django.db import models


class Category(models.Model):
    name = models.CharField(max_length=255)
    image = models.ImageField(upload_to='category_images/', blank=True)

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
    use_category_image = models.BooleanField(default=True)  # Set default to True

    def get_image(self):
        """
        This function returns the product image or the category image if the use_category_image flag is set.
        """
        if self.image:
            return self.image.url
        elif self.use_category_image and self.category.image:
            return self.category.image.url
        else:
            return None  # Optional: You can return a placeholder image URL here

    def __str__(self):
        return self.name
