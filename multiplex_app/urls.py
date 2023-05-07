from django.urls import path
from multiplex_app.views import Inicio, MultiplexList, MultiplexDetail

app_name = 'multiplex_app'
urlpatterns = [
    path('', Inicio.as_view(), name='Inicio'),
    path('multiplex/', MultiplexList.as_view(), name='Multiplex'),
    path('detail/<int:pk>/', MultiplexDetail.as_view(), name='Detail'),
]