from django.views.generic import DetailView
from .models import Funcion, sillasDisponibles

class Asientos(DetailView):
    model = Funcion
    template_name = 'reserva/asientos.html'

    def get_context_data(self, **kwargs):
        context = super(Asientos, self).get_context_data(**kwargs)
        funcion = self.kwargs.get('pk')
        context['sillas_disponibles'] = sillasDisponibles.objects.get(funcion_id=funcion)
        
        return context

