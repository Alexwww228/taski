from django.contrib import admin
from django.urls import include, path
from rest_framework import routers
from django.http import HttpResponse

from api import views

router = routers.DefaultRouter()
router.register('tasks', views.TaskView, 'task')

def home(request):
    return HttpResponse("OK", status=200)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('api.urls')),
    path('', home, name='home'),
]