from django.contrib import admin
from .models import Cine, Empleado, Punto_agil, Sala

admin.site.register(Cine)
admin.site.register(Sala)
admin.site.register(Empleado)
admin.site.register(Punto_agil)