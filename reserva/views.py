from django.views.generic import ListView
from .models import Funcion

class FuncionList(ListView):
    model = Funcion
    template_name = 'reserva/funcion_list.html'
    context_object_name = 'funcion_list'

