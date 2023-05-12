from django.urls import path
from cartelera.views import CarterleraList, CarteleraCreate, CarteleraUpdate, CarteleraDelete

app_name = 'cartelera'
urlpatterns = [
    path('', CarterleraList.as_view(), name='Cartelera'),
    path('nuevo/', CarteleraCreate.as_view(), name='Create'),
    path('editar/<int:pk>/', CarteleraUpdate.as_view(), name='Update'),
    path('eliminar/<int:pk>/', CarteleraDelete.as_view(), name='Delete'),
]