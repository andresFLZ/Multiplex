from django.shortcuts import render
from django.views.generic.base import TemplateView

class Reserva(TemplateView):
    template_name = 'reserva/reserva_list.html'
