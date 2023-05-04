from django.urls import path
from reserva.views import Reserva

app_name = 'reserva'
urlpatterns = [
    path('', Reserva.as_view(), name='Reserva'),
]