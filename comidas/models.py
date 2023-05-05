from django.db import models

class Snack(models.Model):
    nombre = models.CharField(max_length=20)
    valor = models.IntegerField()
    imagen = models.URLField()#Url de donde la imagen esta alojada

    class Meta:
        db_table = 'Snack'
        verbose_name = 'snack'
        verbose_name_plural = 'snacks'

    def __str__(self):
        return self.nombre