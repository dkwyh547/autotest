from django.shortcuts import render
from django.http import HttpResponse,HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from django.contrib import auth
from django.contrib.auth import authenticate,login
from apptest.models import Appcase,Appcasestep
from django.core.paginator import Paginator,EmptyPage,PageNotAnInteger
# Create your views here.

#app 用例管理
@login_required
def appcase_manage(request):
    appcase_list = Appcase.objects.all()
    username = request.session.get('user', '')  #读取浏览器登录Session
    return render(request, "appcase_manage.html", {"user":username, "appcasesteps":appcase_list})

#App 测试用例步骤
@login_required
def appcasestep_manage(request):
    username = request.session.get('user', '')
    appcasestep_list = Appcasestep.objects.all()
    return render(request, "appcasestep_manage.html", {"user":username, "appcasesteps":appcasestep_list})

# App 测试报告
@login_required
def apptest_report(request):
    username = request.session.get('user', '')
    return render(request, "apptest_report.html")

#搜索功能
@login_required
def appsearch(request):
    username = request.session.get('user', '')
    search_appcasename = request.GET.get("appcasename", "")
    appcase_list = Appcase.objects.filter(appcasename__icontains=search_appcasename)
    return render(request, 'appcase_manage.html', {"user": username, "appcases": appcase_list})

#搜索功能
@login_required
def appstepsearch(request):
    username = request.session.get('user', '')
    search_appcasename = request.GET.get("appcasename", "")
    appcasestep_list = Appcasestep.objects.filter(appcasename__icontains=search_appcasename)
    return  render(request, 'appcasestep_manage.html', {"user": username, "appcasesteps": appcasestep_list})