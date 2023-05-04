from django.db import models

class Pelicula(models.Model):
    titulo = models.CharField(max_length=30)
    director = models.CharField(max_length=30)
    clasificacion = models.IntegerField() #General: 1, Mayores 12: 2, Mayores 15: 3, Mayores de edad: 4
    lenguaje = models.IntegerField() #1: Español, 2: Ingles, 3: Japones
    fecha_estreno = models.DateField(verbose_name='fecha de estreno')
    puntuacion = models.IntegerField()#Del 1 - 5
    imagen = models.CharField(max_length=250)#Url de donde la imagen esta alojada

    class Meta:
        db_table = 'Pelicula'
        verbose_name = 'pelicula'
        verbose_name_plural = 'peliculas'

    def __str__(self):
        return self.titulo