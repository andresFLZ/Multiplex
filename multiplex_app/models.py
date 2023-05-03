from datetime import timedelta
from django.db import models
#from reserva.models import Reserva
from cartelera.models import Pelicula
from comidas.models import Snack

class Cine(models.Model):
    nombre = models.CharField(max_length=40)
    salas = models.IntegerField()
    ciudad = models.CharField(max_length=25)
    direccion = models.CharField(max_length=50)
    peliculas = models.ManyToManyField(Pelicula, db_table="Multiplex_pelicula")
    snacks = models.ManyToManyField(Snack, db_table="Multiplex_snack")

    class Meta:
        db_table = 'Multiplex'
        verbose_name = 'multiplex'
        verbose_name_plural = 'multiplex'

    def __str__(self):
        return self.nombre
    

class Empleado(models.Model):
    dni = models.CharField(max_length=25, unique=True, primary_key=True)
    nombre = models.CharField(max_length=30)
    telefono = models.CharField(max_length=12)
    cargo = models.IntegerField() # 1=admin, 2=empleado
    fecha_inicio_cont = models.DateTimeField(auto_now_add=True, verbose_name='fecha de inicio del contrato')
    tiempo_contratado = models.DurationField()
    multiplex_id = models.ForeignKey(Cine, on_delete=models.CASCADE, verbose_name='multiplex')

    class Meta:
        db_table = 'Empleado'
        verbose_name = 'empleado'
        verbose_name_plural = 'empleados'

    def save(self, *args, **kwargs):
        if not self.dni:
            self.tiempo_contratado = timedelta(days=90)
        super().save(*args, **kwargs)
    def __str__(self):
        return self.nombre
    
    
class Punto_agil(models.Model):
    direccion = models.CharField(max_length=12)
    empleado_dni = models.ForeignKey(Empleado, on_delete=models.CASCADE, verbose_name='empleado')

    class Meta:
        db_table = 'Punto_agil'
        verbose_name = 'punto agil'
        verbose_name_plural = 'puntos agiles'

    def __str__(self):
        return self.direccion