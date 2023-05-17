from django.urls import path
from comidas.views import Comida

app_name = 'comida'
urlpatterns = [
    path('', Comida.as_view(), name='comida'),
]