from django.db import models

from multiplex_app.models import Cine

optionsC = [
    [1, 'General'],
    [2, 'Mayores de 12'],
    [3, 'Mayores de 15'],
    [4, 'Mayores de edad']
]

optionsL = [
    [1, 'Español'],
    [2, 'Ingles'],
    [3, 'Japones']
]

optionsP = [
    [1, '1'],
    [2, '2'],
    [3, '3'],
    [4, '4'],
    [5, '5']
]

class Pelicula(models.Model):
    titulo = models.CharField(max_length=30)
    director = models.CharField(max_length=30)
    clasificacion = models.IntegerField(choices=optionsC) #General: 1, Mayores 12: 2, Mayores 15: 3, Mayores de edad: 4
    lenguaje = models.IntegerField(choices=optionsL) #1: Español, 2: Ingles, 3: Japones
    fecha_estreno = models.DateField(verbose_name='fecha de estreno')
    puntuacion = models.IntegerField(choices=optionsP)#Del 1 - 5
    imagen = models.URLField()#Url de donde la imagen esta alojada
    cines = models.ManyToManyField(Cine, db_table="Multiplex_pelicula")

    class Meta:
        db_table = 'Pelicula'
        verbose_name = 'pelicula'
        verbose_name_plural = 'peliculas'

    def __str__(self):
        return self.titulo