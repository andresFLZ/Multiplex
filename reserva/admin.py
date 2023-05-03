from django.contrib import admin
from .models import Usuario, Sala, Funcion, Reserva, Venta

admin.site.register(Usuario)
admin.site.register(Sala)
admin.site.register(Funcion)
admin.site.register(Reserva)
admin.site.register(Venta)