from typing import Any
from django.urls import reverse_lazy
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from .forms import CarteleraForm
from .models import Pelicula

class CarterleraList(ListView):
    model = Pelicula
    template_name = 'cartelera/cartelera_list.html'
    context_object_name = 'cartelera_list'
    ordering = ['-fecha_estreno']

class CarteleraUpdate(UpdateView):
    model = Pelicula
    template_name = 'cartelera/cartelera_form.html'
    form_class = CarteleraForm
    success_url = reverse_lazy('cartelera:Cartelera')

class CarteleraCreate(CreateView):
    model = Pelicula
    template_name = 'cartelera/cartelera_form.html'
    form_class = CarteleraForm
    success_url = reverse_lazy('cartelera:Cartelera')

class CarteleraDelete(DeleteView):
    model = Pelicula
    template_name = 'cartelera/cartelera_confirm_delete.html'
    success_url = reverse_lazy('cartelera:Cartelera')