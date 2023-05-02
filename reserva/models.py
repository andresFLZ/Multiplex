from django.db import models
from multiplex_app.models import Cine, Punto_agil
from cartelera.models import Pelicula
from comidas.models import Snack

class Usuario(models.Model):
    dni = models.CharField(max_length=25, primary_key=True)
    nombre = models.CharField(max_length=30)
    apellido = models.CharField(max_length=30)
    edad = models.IntegerField()
    correo = models.CharField(max_length=40)
    puntos = models.IntegerField()

    class Meta:
        db_table = 'Usuario'
        verbose_name = 'usuario'
        verbose_name_plural = 'usuarios'

    def __str__(self):
        return self.nombre
    

class Sala(models.Model):
    numero = models.IntegerField()
    numero_sillas = models.IntegerField(verbose_name='numero de sillas')
    multiplex_id = models.ForeignKey(Cine, on_delete=models.CASCADE, verbose_name='multiplex')

    class Meta:
        db_table = 'Sala'
        verbose_name = 'sala'
        verbose_name_plural = 'salas'

    def __str__(self):
        return self.numero + 'M:' + self.multiplex_id
    

class Funcion(models.Model):
    horario = models.CharField(max_length=12)
    pelicula_id = models.ForeignKey(Pelicula, on_delete=models.CASCADE, verbose_name='pelicula')
    sala_id = models.ForeignKey(Sala, on_delete=models.CASCADE, verbose_name='sala')

    class Meta:
        db_table = 'Funcion'
        verbose_name = 'funcion'
        verbose_name_plural = 'funciones'

    def __str__(self):
        return self.horario + 'P:' + self.pelicula_id


class Reserva(models.Model):
    sillas = models.CharField(max_length=25)
    estado = models.IntegerField()
    funcion_id = models.ForeignKey(Funcion, on_delete=models.CASCADE, verbose_name='funcion')
    usuario_id = models.ForeignKey(Usuario, on_delete=models.CASCADE, verbose_name='multiplex')

    class Meta:
        db_table = 'Reserva'
        verbose_name = 'reserva'
        verbose_name_plural = 'reservas'

    def __str__(self):
        return self.funcion_id + 'U:' + self.usuario_id
    

class Venta(models.Model):
    fecha = models.DateField()
    valor = models.IntegerField()
    punto_agil_id = models.ForeignKey(Punto_agil, on_delete=models.CASCADE, verbose_name='punto agil')
    reserva_id = models.ForeignKey(Reserva, on_delete=models.CASCADE, verbose_name='reserva')
    snacks = models.ManyToManyField(Snack, db_table="Venta_snack")

    class Meta:
        db_table = 'Venta'
        verbose_name = 'venta'
        verbose_name_plural = 'ventas'

    def __str__(self):
        return self.fecha + 'R:' + self.reserva_id