from django.db import models
from funcion.models import Funcion
from multiplex_app.models import Punto_agil
from comidas.models import Snack
from django.contrib.auth.models import User


class Usuario(models.Model):
    dni = models.CharField(max_length=25, primary_key=True)
    nombre = models.CharField(max_length=30)
    apellido = models.CharField(max_length=30)
    edad = models.IntegerField()
    correo = models.EmailField()
    puntos = models.IntegerField(default=0)
    dj_user = models.OneToOneField(User, on_delete=models.CASCADE, verbose_name='Usuario de Django')

    class Meta:
        db_table = 'Usuario'
        verbose_name = 'usuario'
        verbose_name_plural = 'usuarios'

    def __str__(self):
        return self.nombre

class Reserva(models.Model):
    sillas = models.CharField(max_length=25) #ejm: 25-30 (son las sillas que escogio la persona)
    estado = models.IntegerField() #1: Ya pagó, 2: No ha pagado
    comida = models.BooleanField(default=False)
    valor = models.IntegerField()
    funcion_id = models.ForeignKey(Funcion, on_delete=models.CASCADE, verbose_name='funcion')
    usuario_id = models.ForeignKey(Usuario, on_delete=models.CASCADE, verbose_name='usuario')

    class Meta:
        db_table = 'Reserva'
        verbose_name = 'reserva'
        verbose_name_plural = 'reservas'

    def __str__(self):
        template = '{0.funcion_id} - {0.usuario_id}'
        return template.format(self)
            
class Venta(models.Model):
    fecha = models.DateField(auto_now_add=True, blank=True)
    valor = models.IntegerField()
    punto_agil_id = models.ForeignKey(Punto_agil, on_delete=models.CASCADE, verbose_name='punto agil')
    reserva_id = models.ForeignKey(Reserva, on_delete=models.CASCADE, verbose_name='reserva')
    snacks = models.ManyToManyField(Snack, through="Venta_snack", blank=True)

    class Meta:
        db_table = 'Venta'
        verbose_name = 'venta'
        verbose_name_plural = 'ventas'

    def __str__(self):
        template = '{0.reserva_id} - {0.reserva_id}'
        return template.format(self)    
    
class Venta_snack(models.Model):
    snack_id = models.ForeignKey(Snack, on_delete=models.CASCADE, verbose_name='snack')
    venta_id = models.ForeignKey(Venta, on_delete=models.CASCADE, verbose_name='venta')
    cantidad = models.IntegerField()