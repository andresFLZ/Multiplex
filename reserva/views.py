from django.views.generic import DetailView
from .models import Funcion

class Asientos(DetailView):
    model = Funcion
    template_name = 'reserva/asientos.html'

