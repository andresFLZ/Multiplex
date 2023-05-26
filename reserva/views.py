import json
from django.views.generic.base import RedirectView
from django.views.generic.base import TemplateView
from funcion.models import sillasDisponibles
from comidas.models import Snack
from multiplex_app.models import Punto_agil
from funcion.models import Funcion
from .models import Reserva, Usuario, Venta, Venta_snack

class reservaConfirm(TemplateView):
    template_name = 'reserva/reserva_confirmacion.html'

class ReservaRedirect(RedirectView):
    pattern_name = 'reserva:Confirm'

    def existeComida(self, comida):
        if comida == 'false':
                return False
        elif comida == 'true':
                return True

    def actualizarSillasDisp(self, asientos, funcion):
        sillas_dispo = sillasDisponibles.objects.get(funcion_id=funcion)
        sillasD = [elemento for elemento in sillas_dispo.sillas_dispo.split("-") if elemento not in asientos.split("-")]
        numS = sillas_dispo.num_sillas_dispo-len(asientos.split("-"))

        sillas_dispo.num_sillas_dispo = numS
        sillas_dispo.sillas_dispo = "-".join(sillasD)
        sillas_dispo.save()


    def crearReserva(self, asientos, estado, comida, valor, funcion, usuario):
        reserva = Reserva()
        reserva.sillas = asientos
        reserva.estado = estado
        reserva.comida = comida
        reserva.valor = valor
        reserva.funcion_id = Funcion.objects.get(pk=funcion)  
        reserva.usuario_id = Usuario.objects.get(pk=usuario)  
        reserva.save()

        self.actualizarSillasDisp(asientos, funcion)

        return reserva

    def crearVenta(self, reserva: Reserva, snacks=None):
        venta = Venta()
        venta.valor = reserva.valor
        venta.punto_agil_id = Punto_agil.objects.get(pk=1)
        venta.reserva_id = reserva
        venta.save()

        if reserva.comida == True and snacks is not None:
            for snack, cantidad in snacks.items():
                ventaS = Venta_snack()
                ventaS.snack_id = Snack.objects.get(nombre=snack)
                ventaS.venta_id = venta
                ventaS.cantidad = cantidad
                ventaS.save()

    def dispatch(self, request, *args, **kwargs):

        if 'asientos' in request.POST and 'estado' in request.POST and 'comida' in request.POST and 'valor' in request.POST and 'funcion' in request.POST and 'usuario' in request.POST:

            if int(request.POST['estado']) == 1:

                if 'snacks' in request.POST:
                    self.crearVenta(self.crearReserva(request.POST['asientos'], int(request.POST['estado']), self.existeComida(request.POST['comida']), int(request.POST['valor']), int(request.POST['funcion']), int(request.POST['usuario'])), json.loads(request.POST['snacks']))
                else:
                    self.crearVenta(self.crearReserva(request.POST['asientos'], int(request.POST['estado']), self.existeComida(request.POST['comida']), int(request.POST['valor']), int(request.POST['funcion']), int(request.POST['usuario'])))

            elif int(request.POST['estado']) == 2:
                self.crearReserva(request.POST['asientos'], int(request.POST['estado']), self.existeComida(request.POST['comida']), int(request.POST['valor']), int(request.POST['funcion']), int(request.POST['usuario'])) 
        else:
            print("Error")

        return super().dispatch(request, *args, **kwargs)