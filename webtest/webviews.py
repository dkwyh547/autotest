from django.shortcuts import render
from django.http import HttpResponse,HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from django.contrib import auth
from django.contrib.auth import authenticate,login
from webtest.models import Webcase,Webcasestep
from django.core.paginator import Paginator,EmptyPage,PageNotAnInteger
# Create your views here.

#web 用例管理
@login_required
def webcase_manage(request):
    webcase_list = Webcase.objects.all()    #获取所有接口测试用例
    webcase_count = Webcase.objects.all().count()
    username = request.session.get('user', '')  #读取浏览器登录session
    paginator = Paginator(webcase_list, 8)  #生成paginator对象， 设置每页显示8条记录
    page = request.GET.get('page', 1)   #获取当前的页码数，默认为第1页
    currentPage = int(page) #把获取的当前页码数转换成整数类型
    try:
        webcase_list = paginator.page(page) #获取当前页码数的记录列表
    except PageNotAnInteger:
        webcase_list = paginator.page(1)    #如果输入的页数不是整数，则显示第一页内容
    except EmptyPage:
        webcase_list = paginator.page(paginator.num_pages)  #如果输入的页数不在系统的页数中，则显示最后一页内容
    return render(request, "webcase_manage.html", {"user": username, "webcases": webcase_list, "webcasecounts": webcase_count})

#web 测试用例步骤
@login_required
def webcasestep_manage(request):
    webcasestep_list = Webcasestep.objects.all()    #获取所有接口测试用例
    webcasestep_count = Webcasestep.objects.all().count()
    username = request.session.get('user', '')  #读取浏览器登录session
    paginator = Paginator(webcasestep_list, 8)  #生成paginator对象， 设置每页显示8条记录
    page = request.GET.get('page', 1)   #获取当前的页码数，默认为第1页
    currentPage = int(page) #把获取的当前页码数转换成整数类型
    try:
        webcasestep_list = paginator.page(page) #获取当前页码数的记录列表
    except PageNotAnInteger:
        webcasestep_list = paginator.page(1)    #如果输入的页数不是整数，则显示第一页内容
    except EmptyPage:
        webcasestep_list = paginator.page(paginator.num_pages)  #如果输入的页数不在系统的页数中，则显示最后一页内容
    return render(request, "webcasestep_manage.html", {"user": username, "webcasesteps": webcasestep_list, "webcasestepcounts": webcasestep_count})

#搜索功能
@login_required
def websearch(request):
    username = request.session.get('user', '')
    search_webcasename = request.GET.get("webcasename", "")
    webcase_list = Webcase.objects.filter(webcasename__icontains=search_webcasename)
    return render(request, 'webcase_manage.html', {"user": username, "webcases": webcase_list})

#搜索功能
@login_required
def webstepsearch(request):
    username = request.session.get('user', '')
    search_webcasename = request.GET.get("webcasename", "")
    webcasestep_list = Webcasestep.objects.filter(webcasename__icontains=search_webcasename)
    return render(request, 'webcasestep_manage.html', {"user": username, "webcasesteps": webcasestep_list})



