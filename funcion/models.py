from datetime import date
from django.db import models
from cartelera.models import Pelicula
from multiplex_app.models import Cine

optionsS = [
    [1, '1 (50 sillas)'],
    [2, '2 (60 sillas)'],
    [3, '3 (70 sillas)'],
]

class Sala(models.Model):
    numero = models.IntegerField(unique=False)
    tipo = models.IntegerField(choices=optionsS, verbose_name='tipo de sala', default=1)
    multiplex_id = models.ForeignKey(Cine, on_delete=models.CASCADE, verbose_name='multiplex')

    class Meta:
        db_table = 'Sala'
        verbose_name = 'sala'
        verbose_name_plural = 'salas'

    def __str__(self):
        template = '{0.numero} - {0.multiplex_id}'
        return template.format(self)

class Funcion(models.Model):
    horario = models.CharField(max_length=12)#Formato 24hs
    fecha = models.DateField(default=date.today)
    pelicula_id = models.ForeignKey(Pelicula, on_delete=models.CASCADE, verbose_name='pelicula')
    sala_id = models.ForeignKey(Sala, on_delete=models.CASCADE, verbose_name='sala')
    multiplex_id = models.ForeignKey(Cine, on_delete=models.CASCADE, verbose_name='multiplex', default=1)

    class Meta:
        db_table = 'Funcion'
        verbose_name = 'funcion'
        verbose_name_plural = 'funciones'

    def __str__(self):
        template = '{0.horario} - {0.pelicula_id} - {0.sala_id}'
        return template.format(self)
    
class sillasDisponibles(models.Model):
    num_sillas_dispo = models.IntegerField()
    sillas_dispo = models.CharField(max_length=200)
    funcion_id = models.ForeignKey(Funcion, on_delete=models.CASCADE, verbose_name='función')

    class Meta:
        db_table = 'Sillas_disponibles'
        verbose_name = 'sillas_disponibles'
        verbose_name_plural = 'sillas_disponibles'

    def __str__(self):
        template = '{0.num_sillas_dispo} - {0.funcion_id}'
        return template.format(self)