from datetime import date
from django.db import models
from django.dispatch import receiver
from django.db.models.signals import post_save
from cartelera.models import Pelicula
from multiplex_app.models import Sala, Cine

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
    
    def crear_sillas_disponibles(self):
        self.nsd = 0
        self.sd = ""

        if self.sala_id.tipo == 1:
            self.nsd = 50
            self.sd = "1-2-3-4-5-6-7-8-9-10-11-12-13-14-15-16-17-18-19-20-21-22-23-24-25-26-27-28-29-30-31-32-33-34-35-36-37-38-39-40-41-42-43-44-45-46-47-48-49-50"
        elif self.sala_id.tipo == 2:
            self.nsd = 60
            self.sd = "1-2-3-4-5-6-7-8-9-10-11-12-13-14-15-16-17-18-19-20-21-22-23-24-25-26-27-28-29-30-31-32-33-34-35-36-37-38-39-40-41-42-43-44-45-46-47-48-49-50-51-52-53-54-55-56-57-58-59-60"
        else:
            self.nsd = 70
            self.sd = "1-2-3-4-5-6-7-8-9-10-11-12-13-14-15-16-17-18-19-20-21-22-23-24-25-26-27-28-29-30-31-32-33-34-35-36-37-38-39-40-41-42-43-44-45-46-47-48-49-50-51-52-53-54-55-56-57-58-59-60-61-62-63-64-65-66-67-68-69-70"

        sillas_dispo = sillasDisponibles.objects.create(
            num_sillas_dispo=self.nsd,
            sillas_dispo=self.sd,
            funcion_id=self,
        )
        print(self.sala_id.tipo)
        sillas_dispo.save()

    def save(self, *args, **kwargs):
        if not self.pk:
            super(Funcion, self).save(*args, **kwargs)
            self.crear_sillas_disponibles()
        else:
            super(Funcion, self).save(*args, **kwargs)
    
class sillasDisponibles(models.Model):
    num_sillas_dispo = models.IntegerField()
    sillas_dispo = models.CharField(max_length=200)
    funcion_id = models.OneToOneField(Funcion, on_delete=models.CASCADE, verbose_name='función')

    class Meta:
        db_table = 'Sillas_disponibles'
        verbose_name = 'sillas_disponibles'
        verbose_name_plural = 'sillas_disponibles'

    def __str__(self):
        template = '{0.num_sillas_dispo} - {0.funcion_id}'
        return template.format(self)