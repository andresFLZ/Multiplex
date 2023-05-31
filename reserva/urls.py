from django.urls import path
from reserva.views import ReservaRedirect, ReservaConfirm, ReservaList

app_name = 'reserva'
urlpatterns = [
    path('reservas/', ReservaList.as_view(), name='List'),
    path('confirmacion/', ReservaConfirm.as_view(), name='Confirm'),
    path('', ReservaRedirect.as_view(), name='Reserva'),
]