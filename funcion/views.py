from django.views.generic import DetailView, ListView, CreateView, UpdateView, DeleteView
from .models import Funcion, sillasDisponibles

class Asientos(DetailView):
    model = Funcion
    template_name = 'funcion/asientos.html'

    def get_context_data(self, **kwargs):
        context = super(Asientos, self).get_context_data(**kwargs)
        funcion = self.kwargs.get('pk')
        context['sillas_disponibles'] = sillasDisponibles.objects.get(funcion_id=funcion)
        
        return context

class FuncionDetail(DetailView):
    model = Funcion
    template_name = 'funcion/funcion_detail.html'

    def get(self, request, *args, **kwargs):
        self.asientos = request.GET.get('asientos')
        return super().get(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['asientos'] = self.asientos
        return context

class FuncionList(ListView):
    model = Funcion
    template_name = 'funcion/funcion_list.html'
    context_object_name = 'funcion_list'

class FuncionDetailAdmin(DetailView):
    model = Funcion
    template_name = 'funcion/funcion_detail_admin.html'