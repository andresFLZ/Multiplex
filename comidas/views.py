from django.urls import reverse_lazy
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from .forms import SnackForm
from .models import Snack

class ComidasList(ListView):
    model = Snack
    template_name = 'comidas/comidas_list.html'
    context_object_name = 'comidas_list'

class ComidasUpdate(UpdateView):
    model = Snack
    template_name = 'comidas/comidas_form.html'
    form_class = SnackForm
    success_url = reverse_lazy('comidas:List')

class ComidasCreate(CreateView):
    model = Snack
    template_name = 'comidas/comidas_form.html'
    form_class = SnackForm
    success_url = reverse_lazy('comidas:List')

class ComidasDelete(DeleteView):
    model = Snack
    template_name = 'comidas/comidas_confirm_delete.html'
    success_url = reverse_lazy('comidas:List')