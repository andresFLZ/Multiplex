const botones_snack = document.querySelectorAll('.btn-snack-r');
const spans_cantidad = document.querySelectorAll('.cantidad-snacks-r');
const spans_precios = document.querySelectorAll('.precio-snacks-r');
const total_sancks = document.getElementById("totalS");
const contenedor_total = document.getElementById("contenedor-total-s");
const total_reserva = document.getElementById("precio-total-reserva");
let precio_boletas = document.getElementById("precio-total-reserva").textContent;
const boton_rd = document.getElementById("btn-reserva-desp");

function sumar(num) {
  let cuenta = document.getElementById("cantidadS" + num).textContent;
  let cantidad = document.getElementById("cantidadS" + num);
  let total = document.getElementById("precioS" + num);
  let precio = document.getElementById("precioP" + num).textContent;
  
  cuenta++;
  cantidad.innerHTML = cuenta;
  total.innerHTML = precio * cuenta;
}

function restar(num) {
  let cuenta = document.getElementById("cantidadS" + num).textContent;
  let cantidad = document.getElementById("cantidadS" + num);
  let total = document.getElementById("precioS" + num);
  let precio = document.getElementById("precioP" + num).textContent;

  cuenta--;
  if (cuenta < 0) {
    cuenta = 0;
  }
  cantidad.innerHTML = cuenta;
  total.innerHTML = precio * cuenta;
}

function setearTotal() {
  let spans_ocupados = 0;

  spans_cantidad.forEach(span => {
    if (span.innerHTML !== '0') {
      spans_ocupados++;
      let suma = 0
      spans_precios.forEach(span => {
        let precio = parseFloat(span.innerHTML);
        suma += precio;
      });
      total_sancks.innerHTML = suma;
    }
  });

  if (spans_ocupados == 0 && total_sancks.innerHTML !== '0') {
    total_sancks.innerHTML = '0';
  }

  total_reserva.innerHTML = parseInt(precio_boletas) + parseInt(total_sancks.innerHTML);
}

function alternarEstado() {
  if (total_sancks.innerHTML == '0') {
    contenedor_total.classList.add('oculto');
  }
  else {
    contenedor_total.classList.remove('oculto');
  }

  if (contenedor_total.classList.contains('oculto')) {
    boton_rd.disabled = false;
  } else {
    boton_rd.disabled = true;
  }
}

botones_snack.forEach(botonS => {
    botonS.addEventListener('click', event => {
      if (event.target.classList.contains('sumar-precio')) {
        sumar(event.target.id.slice(-1));
      } else {
        restar(event.target.id.slice(-1));
      }
      setearTotal();
      alternarEstado()
    });
  });