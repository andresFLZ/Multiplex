from datetime import timezone
import random
from django.db import models

optionsCC = [
    [1, 'Bogotá D.C.'],
    [2, 'Medellin'],
    [3, 'Cali'],
    [4, 'Baranquilla']
]

optionsEC = [
    [1, 'Administrador'],
    [2, 'Empleado'],
]

optionsS = [
    [1, '1 (50 sillas)'],
    [2, '2 (60 sillas)'],
    [3, '3 (70 sillas)'],
]

class Cine(models.Model):
    nombre = models.CharField(max_length=40)
    salas = models.IntegerField()
    ciudad = models.IntegerField(choices=optionsCC)
    direccion = models.CharField(max_length=50)

    class Meta:
        db_table = 'Multiplex'
        verbose_name = 'multiplex'
        verbose_name_plural = 'multiplex'

    def __str__(self):
        return self.nombre
    
    def save(self, *args, **kwargs):
        if not self.pk:
            super().save(*args, **kwargs)
            for i in range(self.salas):
                Sala.objects.create(
                    numero=i+1, 
                    tipo = random.randint(1, 3),
                    multiplex_id=self
                )
        else:
            super().save(*args, **kwargs)
    

class Sala(models.Model):
    numero = models.IntegerField(unique=False)
    tipo = models.IntegerField(choices=optionsS, verbose_name='tipo de sala', default=1)
    multiplex_id = models.ForeignKey(Cine, on_delete=models.CASCADE, verbose_name='multiplex')

    class Meta:
        db_table = 'Sala'
        verbose_name = 'sala'
        verbose_name_plural = 'salas'

    def __str__(self):
        template = '{0.numero} - {0.multiplex_id} - {0.tipo}'
        return template.format(self)

class Empleado(models.Model):
    dni = models.CharField(max_length=25, unique=True, primary_key=True)
    nombre = models.CharField(max_length=30)
    telefono = models.CharField(max_length=12)
    cargo = models.IntegerField(choices=optionsEC) # 1=admin, 2=empleado
    fecha_inicio_cont = models.DateTimeField(auto_now_add=True, verbose_name='fecha de inicio del contrato')
    tiempo_contratado = models.DurationField()
    multiplex_id = models.ForeignKey(Cine, on_delete=models.CASCADE, verbose_name='multiplex')

    class Meta:
        db_table = 'Empleado'
        verbose_name = 'empleado'
        verbose_name_plural = 'empleados'

    def save(self, *args, **kwargs):
        if not self.dni:
            self.tiempo_contratado = timezone.timedelta()
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