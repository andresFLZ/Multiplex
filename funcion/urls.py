from django.urls import path
from .views import *

app_name = 'funcion'
urlpatterns = [
    path('asientos/<int:pk>/', Asientos.as_view(), name='Asientos'),
    path('reserva/<int:pk>/', FuncionDetail.as_view(), name='Reserva'),
    path('funciones/', FuncionList.as_view(), name='Funciones'),
    path('funciones/<int:pk>/', FuncionDetailAdmin.as_view(), name='DetailAdmin'),
]