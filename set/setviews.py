from django.shortcuts import render
from set.models import Set
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse,HttpResponseRedirect
from django.contrib import auth
from django.contrib.auth import authenticate,login
# Create your views here.

#设置管理
def set_manage(request):
    username = request.session.get('user', '')
    set_list = Set.objects.all()
    return render(request, "set_manage.html", {"user": username, "sets": set_list})

#用户管理
def set_user(request):
    user_list = User.objects.all()
    username = request.session.get('user', '')
    return render(request, "set_user.html", {"user":username, "users":user_list})

@login_required
def setsearch(request):
    username = request.session.get('user', '')
    search_setname = request.GET.get("setname", "")
    set_list = Set.objects.filter(setname__icontains=search_setname)
    return render(request, 'set_manage.html', {"user": username, "sets": set_list})

#搜索功能
@login_required
def usersearch(request):
    username = request.session.get('user', '')
    search_username = request.GET.get("username", "")
    user_list = User.objects.filter(username__icontains=search_username)
    return render(request, 'set_user.html', {"user": username, "users": user_list})