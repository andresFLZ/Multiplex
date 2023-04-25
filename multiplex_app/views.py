from django.shortcuts import render
from django.views.generic.base import TemplateView

class Inicio(TemplateView):
    template_name = 'multiplex_app/inicio.html'
