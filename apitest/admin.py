from django.contrib import admin
from apitest.models import Apitest, Apistep

# Register your models here.


class ApistepAdmin(admin.TabularInline):
    list_display = ['apiname', 'apistep', 'apiurl', 'apiparamvalue',
                    'apimethod', 'apiresult', 'apistatus', 'create_time', 'id', 'apitest']
    model = Apistep
    extra = 1


class ApitestAdmin(admin.ModelAdmin):
    list_display = ['apitestname', 'apitestdesc',
                    'apitester', 'apitestresult', 'create_time', 'id']
    inlines = [ApistepAdmin]


admin.site.register(Apitest, ApitestAdmin)
