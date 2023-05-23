import json
from django.views.generic.base import RedirectView
from django.views.generic.base import TemplateView
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

    def actualizarSillasDisp(self, asientos):
         pass

    def crearReserva(self, asientos, estado, comida, valor, funcion, usuario):
        print(type(asientos), type(estado), type(comida), type(valor), type(funcion), type(usuario))
        print(asientos, estado, comida, valor, funcion, usuario)

        reserva = Reserva()
        reserva.sillas = asientos
        reserva.estado = estado
        reserva.comida = comida
        reserva.valor = valor
        reserva.funcion_id = Funcion.objects.get(pk=funcion)  
        reserva.usuario_id = Usuario.objects.get(pk=usuario)  
        reserva.save()

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
                    print("Caso: paga ya con snacks", json.loads(request.POST['snacks']))
                else:
                    self.crearVenta(self.crearReserva(request.POST['asientos'], int(request.POST['estado']), self.existeComida(request.POST['comida']), int(request.POST['valor']), int(request.POST['funcion']), int(request.POST['usuario'])))
                    print("Caso: paga ya sin snacks")

            elif int(request.POST['estado']) == 2:
                self.crearReserva(request.POST['asientos'], int(request.POST['estado']), self.existeComida(request.POST['comida']), int(request.POST['valor']), int(request.POST['funcion']), int(request.POST['usuario']))     
                print("Caso: paga despues")
        else:
            print("Error")

        return super().dispatch(request, *args, **kwargs)