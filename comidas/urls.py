from django.urls import path
from comidas.views import Comida

app_name = 'Snaks'
urlpatterns = [
    path('', Comida.as_view(), name='Snaks'),
]