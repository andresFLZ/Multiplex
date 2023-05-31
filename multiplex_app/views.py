from typing import Any, Dict
from django.http import HttpResponseRedirect
from django.urls import reverse_lazy
from django.contrib.auth import authenticate, login
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, DetailView
from django.views.generic.edit import FormView
from django.views.generic.base import TemplateView
from django.contrib.auth.mixins import LoginRequiredMixin
from comidas.models import Snack
from reserva.forms import UsuarioForm
from reserva.models import Usuario
from .forms import CineForm, CustomUserCreationForm
from cartelera.models import Pelicula
from reserva.models import Funcion
from .models import Cine

class Inicio(TemplateView):
    template_name = 'multiplex_app/inicio.html'

    def get_context_data(self, **kwargs):
        context = super(Inicio, self).get_context_data(**kwargs)
        context['peliculas'] = Pelicula.objects.order_by('-fecha_estreno')[:3]
        context['snacks'] = Snack.objects.order_by('-nombre')[:3]

        return context

class MultiplexList(LoginRequiredMixin, ListView):
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
    
class CineList(LoginRequiredMixin, ListView):
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

class Register(FormView):
    template_name = 'registration/register.html'
    form_class = CustomUserCreationForm
    second_form_class = UsuarioForm
    success_url = reverse_lazy('multiplex_app:Inicio')

    def get_context_data(self, **kwargs):
        context = super(Register, self).get_context_data(**kwargs)
        
        if 'form' not in context:
            context['form'] = self.form_class(self.request.GET)
        if 'form2' not in context:
            context['form2'] = self.second_form_class(self.request.GET)
        
        return context

    def post(self, request, *args, **kwargs):
        form = self.form_class(request.POST)
        form2 = self.second_form_class(request.POST)

        if form.is_valid() and form2.is_valid():
            userDj = form.save()

            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=password)
            login(self.request, user)

            usuario = Usuario.objects.create(
            dni=form2.cleaned_data.get('dni'),
            nombre=userDj.first_name,
            apellido=userDj.last_name,
            edad=form2.cleaned_data.get('edad'),
            correo=userDj.email,
            dj_user=userDj,
            )

            usuario.save()

            return HttpResponseRedirect(self.get_success_url())
        
        else:
            return self.render_to_response(self.get_context_data(form=form, form2=form2))