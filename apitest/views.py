from django.shortcuts import render
from django.http import HttpResponse,HttpResponseRedirect      #加入引用
from django.contrib.auth.decorators import login_required
from django.contrib import auth
from apitest.models import Apitest,Apistep,Apis
import pymysql
from django.core.paginator import Paginator,EmptyPage,PageNotAnInteger
#import HTMLTestRunner

# Create your views here.

def test(request):
    return HttpResponse("hello test")    #返回HttpResponse响应函数

def welcome(request):
    return render(request, 'welcome.html')

def login(request):
    if request.POST:
        username = password = ''
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = auth.authenticate(username=username, password=password)
        if user is not None and user.is_active:
            auth.login(request, user)
            request.session['user'] = username
            response = HttpResponseRedirect('/home/')
            return response
        else:
            return render(request, 'login.html', {'error', 'username or password error'})
    #else:
     #   context = {}
      #  return render(request, 'login.html', context)

    return render(request, 'login.html')

def home(request):
    return render(request, "home.html")

def logout(request):
    auth.logout(request)
    return render(request, 'login.html')

# 流程接口管理
@login_required
def apitest_manage(request):
    apitest_list = Apis.objects.all()    #获取所有接口测试用例
    apitest_count = Apitest.objects.all().count()   #统计产品数量
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
    return render(request, "apitest_manage.html", {"user": username, "apitests": apitest_list, "apitestcounts": apitest_count}) #定义流程接口数据的变量并返回到前端

# 流程接口测试步骤
@login_required
def apistep_manage(request):
    apistep_list = Apis.objects.all()    #获取所有接口测试用例
    apistep_count = Apistep.objects.all().count()
    username = request.session.get('user', '')  #读取浏览器登录session
    paginator = Paginator(apistep_list, 8)  #生成paginator对象， 设置每页显示8条记录
    page = request.GET.get('page', 1)   #获取当前的页码数，默认为第1页
    currentPage = int(page) #把获取的当前页码数转换成整数类型
    try:
        apistep_list = paginator.page(page) #获取当前页码数的记录列表
    except PageNotAnInteger:
        apistep_list = paginator.page(1)    #如果输入的页数不是整数，则显示第一页内容
    except EmptyPage:
        apistep_list = paginator.page(paginator.num_pages)  #如果输入的页数不在系统的页数中，则显示最后一页内容
    return render(request, "apistep_manage.html", {"user": username, "apisteps": apistep_list, "apistepcounts": apistep_count})

# 单一接口测试
@login_required
def apis_manage(request):
    apis_list = Apis.objects.all()    #获取所有接口测试用例
    apis_count = Apis.objects.all().count() #统计产品数
    username = request.session.get('user', '')  #读取浏览器登录session
    paginator = Paginator(apis_list, 8)  #生成paginator对象， 设置每页显示8条记录
    page = request.GET.get('page', 1)   #获取当前的页码数，默认为第1页
    currentPage = int(page) #把获取的当前页码数转换成整数类型
    try:
        apis_list = paginator.page(page) #获取当前页码数的记录列表
    except PageNotAnInteger:
        apis_list = paginator.page(1)    #如果输入的页数不是整数，则显示第一页内容
    except EmptyPage:
        apis_list = paginator.page(paginator.num_pages)  #如果输入的页数不在系统的页数中，则显示最后一页内容
    return render(request, "apis_manage.html", {"user": username, "apiss": apis_list, "apiscounts": apis_count})    #把值赋给apiscounts变量

# 测试报告
@login_required
def test_report(request):
    username = request.session.get('user', '')
    apis_list = Apis.objects.all()
    apis_count = Apis.objects.all().count() #统计接口数
    db = pymysql.connect(user='root', db='autotest', passwd='123456', host='127.0.0.1')
    cursor = db.cursor()
    sql1 = 'SELECT count(id) FROM apitest_apis WHERE apitest_apis.apistatus=1'
    aa = cursor.execute(sql1)
    apis_pass_count = [row[0] for row in cursor.fetchmany(aa)][0]
    sql2 = 'SELECT count(id) FROM apitest_apis WHERE apitest_apis.apistatus=0'
    bb = cursor.execute(sql2)
    apis_fail_count = [row[0] for row in cursor.fetchmany(bb)][0]
    db.close()
    return render(request, "report.html", {"user": username, "apiss":apis_list, "apiscounts":apis_count, "apis_pass_counts": apis_pass_count, "apis_fail_counts": apis_fail_count}) #把值赋给apiscounts变量

def left(request):
    return render(request, "left.html")

#搜索功能
@login_required
def apisearch(request):
    username =request.session.get('user', '')   #读取浏览器登录session
    search_apitestname = request.GET.get("apitestname", "")
    apitest_list = Apitest.objects.filter(apitestname__icontains=search_apitestname)
    return render(request, 'apitest_manage.html', {"user": username, "apitests": apitest_list})
@login_required
def apissearch(request):
    username = request.session.get('user', '')
    search_apiname = request.GET.get("apiname", "")
    apis_list = Apis.objects.filter(apiname__icontains=search_apiname)
    return render(request, 'apis_manage.html', {"user": username, "apiss": apis_list})




