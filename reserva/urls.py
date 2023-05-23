from django.urls import path
from reserva.views import ReservaRedirect, reservaConfirm

app_name = 'reserva'
urlpatterns = [
    path('confirmacion/', reservaConfirm.as_view(), name='Confirm'),
    path('', ReservaRedirect.as_view(), name='Reserva'),
]