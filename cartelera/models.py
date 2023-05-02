from django.db import models

class Pelicula(models.Model):
    titulo = models.CharField(max_length=30)
    director = models.CharField(max_length=30)
    clasificacion = models.IntegerField()
    lenguaje = models.IntegerField()
    fecha_estreno = models.DateField(verbose_name='fecha de estreno')
    puntuacion = models.IntegerField()
    imagen = models.CharField(max_length=250)

    class Meta:
        db_table = 'Pelicula'
        verbose_name = 'pelicula'
        verbose_name_plural = 'peliculas'

    def __str__(self):
        return self.titulo