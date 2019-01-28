from django.shortcuts import render
from product.models import Product
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse,HttpResponseRedirect
from django.contrib import auth
from django.contrib.auth import authenticate,login
from django.core.paginator import Paginator,EmptyPage,PageNotAnInteger

# Create your views here.

#产品管理
def product_manage(request):
    username = request.session.get('user', '')
    product_list = Product.objects.all()
    paginator = Paginator(product_list, 8)
    page = request.GET.get('page', 1)
    currentPage = int(page)
    try:
        product_list = paginator.page(page) #获取当前页码数的记录列表
    except PageNotAnInteger:
        product_list = paginator.page(1)    #如果输入的页数不是整数，则显示第一页内容
    except EmptyPage:
        product_list = paginator.page(paginator.num_pages)  #如果输入的页数不在系统的页数中，则显示最后一页内容
    return render(request, "product_manage.html", {"user": username, "products": product_list})

# 搜索功能
@login_required
def productsearch(request):
    username = request.session.get('user', '')
    search_productname = request.GET.get("productname", "")
    product_list = Product.objects.filter(productname__icontains=search_productname)
    return render(request, 'product_manage.html', {"user": username, "products": product_list})

# 流程接口管理
@login_required
def products_manage(request):
    apitest_list = Apis.objects.all()    #获取所有接口测试用例
    username = request.session.get('user', '')  #读取浏览器登录session
    paginator = Paginator(apitest_list, 8)  #生成paginator对象， 设置每页显示8条记录
    page = request.GET.get('page', 1)   #获取当前的页码数，默认为第1页
    currentPage = int(page) #把获取的当前页码数转换成整数类型
    try:
        apitest_list = paginator.page(page) #获取当前页码数的记录列表
    except PageNotAnInteger:
        apitest_list = paginator.page(1)    #如果输入的页数不是整数，则显示第一页内容
    except EmptyPage:
        apitest_list = paginator.page(paginator.num_pages)  #如果输入的页数不在系统的页数中，则显示最后一页内容
    return render(request, "apitest_manage.html", {"user": username, "apitests": apitest_list})