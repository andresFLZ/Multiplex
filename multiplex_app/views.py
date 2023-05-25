from django.shortcuts import redirect
from django.urls import reverse_lazy
from django.contrib.auth import logout, authenticate, login
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, DetailView
from django.views.generic.edit import FormView
from django.views.generic.base import TemplateView, RedirectView
from django.contrib.auth.mixins import LoginRequiredMixin
from .forms import CineForm, CustomUserCreationForm
from cartelera.models import Pelicula
from reserva.models import Funcion
from .models import Cine

class Inicio(TemplateView):
    template_name = 'multiplex_app/inicio.html'

    def get_context_data(self, **kwargs):
        context = super(Inicio, self).get_context_data(**kwargs)
        context['peliculas'] = Pelicula.objects.order_by('-fecha_estreno')[:3]

        return context

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
    
class CineList(ListView):
    model = Cine
    template_name = 'multiplex_app/multiplex_app_list_admin.html'
    context_object_name = 'cines_list'

class CineUpdate(LoginRequiredMixin, UpdateView):
    model = Cine
    template_name = 'multiplex_app/multiplex_app_form.html'
    form_class = CineForm
    success_url = reverse_lazy('multiplex_app:cines_list')

class CineCreate(LoginRequiredMixin, CreateView):
    model = Cine
    template_name = 'multiplex_app/multiplex_app_form.html'
    form_class = CineForm
    success_url = reverse_lazy('multiplex_app:cines_list')

class CineDelete(LoginRequiredMixin, DeleteView):
    model = Cine
    template_name = 'multiplex_app/multiplex_app_confirm_delete.html'
    success_url = reverse_lazy('multiplex_app:cines_list')

"""class RegisterForm(TemplateView):
    template_name = 'registration/register.html'

    def get_context_data(self, **kwargs):
        context = super(RegisterForm, self).get_context_data(**kwargs)
        context['form'] = CustomUserCreationForm()        

        return context
    
class Register(RedirectView):
    pattern_name = 'multiplex_app:Inicio'
    
    def dispatch(self, request, *args, **kwargs):
        
        if request.POST:
            user_creation_form = CustomUserCreationForm(data=request.POST)
            print(user_creation_form.is_valid())

            if user_creation_form.is_valid():
                print("validF")
                user_creation_form.save()

                user = authenticate(username=user_creation_form.cleaned_data['username'], password=user_creation_form.cleaned_data['password1'])
                login(request, user)

        return super().dispatch(request, *args, **kwargs)"""

class Register(FormView):
    template_name = 'registration/register.html'
    form_class = CustomUserCreationForm
    success_url = reverse_lazy('multiplex_app:Inicio')

    def form_valid(self, form):
        user = form.save()
        username = form.cleaned_data.get('username')
        password = form.cleaned_data.get('password1')
        user = authenticate(username=username, password=password)
        login(self.request, user)
        return super().form_valid(form)