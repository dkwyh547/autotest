from django.contrib import admin
from product.models import Product
from apitest.models import Apitest, Apis

# Register your models here.

class ProductAdmin(admin.ModelAdmin):
    list_display = ['productname', 'productdesc', 'producter', 'creare_time', 'id']

admin.site.register(Product)    #把产品模块注册到Django admin 后台并能显示

class ApisAdmin(admin.TabularInline):
    list_dispaly = ['apiname', 'apiurl', 'apiparamvalue', 'apimethon', 'apiresult', 'apistatus', 'create_time', 'id', 'product']
    model = Apis
    extra = 1

class ProductAdmin(admin.ModelAdmin):
    list_display = ['productname', 'productdesc', 'create_time', 'id']
    inlines = [ApisAdmin]

