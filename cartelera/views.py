from django.views.generic import ListView
from .models import Pelicula

class CarterleraList(ListView):
    model = Pelicula
    template_name = 'cartelera/cartelera_list.html'