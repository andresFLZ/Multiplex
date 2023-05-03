from datetime import timedelta
from django.db import IntegrityError
from django.test import TestCase
from multiplex_app.models import *


class EmpleadoTest(TestCase):
    def test_unique_dni_pass(self):
        cine = Cine.objects.create(nombre = 'ejemplo1', salas=3, ciudad='bogota', direccion='direccion1')
        emp1 = Empleado.objects.create(dni='12345', nombre='carlos', telefono='3124', cargo=2, tiempo_contratado=timedelta(days=90), multiplex_id=cine)
        emp2 = Empleado.objects.create(dni='12346', nombre='santiago', telefono='3123', cargo=2, tiempo_contratado=timedelta(days=90), multiplex_id=cine)
        emp3 = Empleado.objects.create(dni='12347', nombre='andres', telefono='3143', cargo=2, tiempo_contratado=timedelta(days=90), multiplex_id=cine)
        emp1.save()
        emp2.save()
        emp3.save()
        emp4 = Empleado.objects.create(dni='12348', nombre='alfredo', telefono='3124', cargo=2, tiempo_contratado=timedelta(days=90), multiplex_id=cine)
        emp4.save()

    def test_unique_dni_fail(self):
        cine = Cine.objects.create(nombre = 'ejemplo1', salas=3, ciudad='bogota', direccion='direccion1')
        emp1 = Empleado.objects.create(dni='12345', nombre='carlos', telefono='3124', cargo=2, tiempo_contratado=timedelta(days=90), multiplex_id=cine)
        emp2 = Empleado.objects.create(dni='12346', nombre='santiago', telefono='3123', cargo=2, tiempo_contratado=timedelta(days=90), multiplex_id=cine)
        emp3 = Empleado.objects.create(dni='12347', nombre='andres', telefono='3143', cargo=2, tiempo_contratado=timedelta(days=90), multiplex_id=cine)
        emp1.save()
        emp2.save()
        emp3.save()
        with self.assertRaises(IntegrityError):
            emp4 = Empleado.objects.create(dni='12348', nombre='alfredo', telefono='3124', cargo=2, tiempo_contratado=timedelta(days=90), multiplex_id=cine)
            emp4.save()
        self.assertTrue(True)
        """
        Para los dos test anteriores si el test pasa es porque se a lanzado el error esperado, que en este caso seria uno de integridad ya que el valor del dni debe de ser unico, al repetirse se lanza el error en el caso del que el test falle es porque no se lanzo ningun error por ende en este caso ningun dato unico se esta repitiendo.
        """

    def test_integrity_multiplex_id_pass(self):
        cine = Cine.objects.create(nombre = 'ejemplo1', salas=3, ciudad='bogota', direccion='direccion1')
        emp1 = Empleado.objects.create(dni='12345', nombre='carlos', telefono='3124', cargo=2, tiempo_contratado=timedelta(days=90), multiplex_id=cine)
        emp1.save()
        
    def test_integrity_multiplex_id_fail(self):
        with self.assertRaises(IntegrityError):
            emp1 = Empleado.objects.create(dni='12345', nombre='carlos', telefono='3124', cargo=2, tiempo_contratado=timedelta(days=90), multiplex_id=cine)
            emp1.save()
        self.assertTrue(True)
        """
        En el caso de los test de integridad en los cuales evaluamos que las claves foraneas esten ingresadas correctamente tenemos dos escenarios, el primero es donde el test pasa ya que se esta insertando la clave foranea de manera correcta pero en el segundo nos presenta un error/fallo por lo que estamos intentando crear el objeto con un cine que no existe 
        """