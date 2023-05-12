from django.contrib import admin
from .models import Funcion, Sala, sillasDisponibles

admin.site.register(Funcion)
admin.site.register(Sala)
admin.site.register(sillasDisponibles)