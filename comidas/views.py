from django.views.generic import ListView
from .models import Snack

class Comida(ListView):
    model = Snack
    template_name = 'comidas/comida.html'