from django.urls import reverse_lazy
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from .forms import ComidasForm
from .models import Snack

class ComidasList(ListView):
    model = Snack
    template_name = 'comidas/comidas_list.html'
    context_object_name = 'comidas_list'

class ComidasUpdate(UpdateView):
    model = Snack
    template_name = 'comidas/comidas_form.html'
    form_class = ComidasForm
    success_url = reverse_lazy('comidas:Comidas')

class ComidasCreate(CreateView):
    model = Snack
    template_name = 'comidas/comidas_form.html'
    form_class = ComidasForm
    success_url = reverse_lazy('comidas:Comidas')

class ComidasDelete(DeleteView):
    model = Snack
    template_name = 'comidas/comidas_confirm_delete.html'
    success_url = reverse_lazy('comidas:Comidas')