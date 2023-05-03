from django.urls import path
from cartelera.views import CarterleraList

app_name = 'cartelera'
urlpatterns = [
    path('', CarterleraList.as_view(), name='Cartelera'),
]