from django.urls import path
from reserva.views import *

app_name = 'reserva'
urlpatterns = [
    path('asientos/<int:pk>/', Asientos.as_view(), name='Asientos'),
]