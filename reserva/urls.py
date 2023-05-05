from django.urls import path
from reserva.views import *

app_name = 'reserva'
urlpatterns = [
    path('', Reserva.as_view(), name='Reserva'),
    path('', SalaFuncion.as_view(), name='Sala'),
]