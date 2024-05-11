from django.urls import path
from . import views

urlpatterns = [
    path('info/nodes/', views.display_nodes),
    path('info/pods/', views.display_pods)
]