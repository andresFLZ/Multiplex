from django.urls import path
from comidas.views import ComidasCreate, ComidasList, ComidasDelete, ComidasUpdate

app_name = 'comidas'
urlpatterns = [
    path('', ComidasList.as_view(), name='List'),
    path('nuevo/', ComidasCreate.as_view(), name='Create'),
    path('editar/<int:pk>/', ComidasUpdate.as_view(), name='Update'),
    path('eliminar/<int:pk>/', ComidasDelete.as_view(), name='Delete'),
]