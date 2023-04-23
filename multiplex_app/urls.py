from django.urls import path
from multiplex_app.views import Inicio

app_name = 'multiplex_app'
urlpatterns = [
    path('', Inicio.as_view(), name='Inicio'),
]