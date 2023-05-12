from django.db import models
from multiplex_app.models import Cine

class Snack(models.Model):
    nombre = models.CharField(max_length=20)
    valor = models.IntegerField()
    imagen = models.URLField()#Url de donde la imagen esta alojada
    cines = models.ManyToManyField(Cine, db_table="Multiplex_snack")

    class Meta:
        db_table = 'Snack'
        verbose_name = 'snack'
        verbose_name_plural = 'snacks'

    def __str__(self):
        return self.nombre