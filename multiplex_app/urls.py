from django.urls import path
from multiplex_app.views import Inicio, MultiplexList, MultiplexDetail, CineList, CineUpdate, CineCreate, CineDelete, Register

app_name = 'multiplex_app'
urlpatterns = [
    path('', Inicio.as_view(), name='Inicio'),
    path('cines/', MultiplexList.as_view(), name='Multiplex'),
    path('detail/<int:pk>/', MultiplexDetail.as_view(), name='Detail'),
    path('administrador/cines/', CineList.as_view(), name='cines_list'),
    path('administrador/cines/nuevo/', CineCreate.as_view(), name='Create'),
    path('administrador/cines/editar/<int:pk>/', CineUpdate.as_view(), name='Update'),
    path('administrador/cines/eliminar/<int:pk>/', CineDelete.as_view(), name='Delete'),
    path('register/', Register.as_view(), name='Register'),
]