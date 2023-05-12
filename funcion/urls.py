from django.urls import path
from .views import *

app_name = 'funcion'
urlpatterns = [
    path('asientos/<int:pk>/', Asientos.as_view(), name='Asientos'),
    path('reserva/<int:pk>/', FuncionDetail.as_view(), name='Reserva'),
    path('', FuncionList.as_view(), name='Funciones'),
    path('nuevo/', FuncionCreate.as_view(), name='Create'),
    path('editar/<int:pk>/', FuncionUpdate.as_view(), name='Update'),
    path('eliminar/<int:pk>/', FuncionDelete.as_view(), name='Delete'),
]