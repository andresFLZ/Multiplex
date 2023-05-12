from django.views.generic import ListView, DetailView
from django.views.generic.base import TemplateView
from cartelera.models import Pelicula
from reserva.models import Funcion
from .models import Cine

class Inicio(TemplateView):
    template_name = 'multiplex_app/inicio.html'

class MultiplexList(ListView):
    model = Cine
    template_name = 'multiplex_app/multiplex_app_list.html'
    context_object_name = 'cines_list'

class MultiplexDetail(DetailView):
    model = Cine
    template_name = 'multiplex_app/multiplex_app_detail.html'

    def get_context_data(self, **kwargs):
        context = super(MultiplexDetail, self).get_context_data(**kwargs)
        multiplex = self.kwargs.get('pk')
        context['funciones'] = Funcion.objects.filter(multiplex_id=multiplex)
        context['peliculas'] = Pelicula.objects.filter(cines__id=multiplex)        

        return context