from django.views.generic import ListView
from django.views.generic.base import TemplateView
from .models import Cine

class Inicio(TemplateView):
    template_name = 'multiplex_app/inicio.html'

class MultiplexList(ListView):
    model = Cine
    template_name = 'multiplex_app/multiplex_app_list.html'
    context_object_name = 'cines_list'