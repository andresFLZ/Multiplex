from django.urls import path
from reserva.views import *

app_name = 'reserva'
urlpatterns = [
    path('funciones/', FuncionList.as_view(), name='Funcion'),
]