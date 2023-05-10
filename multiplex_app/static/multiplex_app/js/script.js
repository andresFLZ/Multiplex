const asientos_seleccionados = [];
let boton_confirmacion = document.querySelector('.confirmacion');
const asientos = document.querySelectorAll('.filaS .seat');
const asientos_disponibles_db = document.getElementById("sillas_dispo").textContent.split("-");
const asientos_disponibles = poblar();

console.log(asientos_disponibles_db);

function poblar() {
  for (let i=0; i<asientos.length; i++) {
    let id = asientos[i].getAttribute("id"); 

    if (asientos_disponibles_db.indexOf(id) == -1) {
      asientos[i].classList.add("sold");
    }
  }

  return document.querySelectorAll('.filaS .seat:not(.sold)');
}

function seleccionar(index, id) {
  if (index > -1) {
    asientos_seleccionados.splice(index, 1);
    console.log(asientos_seleccionados);
  } else {
    asientos_seleccionados.push(id);
    console.log(asientos_seleccionados);
  }
}

function SetearUrl() {
  const params = new URLSearchParams();
  let ruta = document.getElementById("ruta").textContent;
  let nuevaURL = new URL('http://127.0.0.1:8000/');
  nuevaURL += ruta;
  nuevaURL = nuevaURL.substring(0, nuevaURL.lastIndexOf('/')) + '?'
  params.append("asientos", asientos_seleccionados.join("-"));
  nuevaURL += params.toString()
  console.log(nuevaURL);
  window.location.href = nuevaURL;
}

asientos_disponibles.forEach(asiento => {
  asiento.addEventListener('click', event => {
    let id = event.target.id;
    let index = asientos_seleccionados.indexOf(id);
    seleccionar(index, id);
    event.target.classList.toggle('selected');
  });
});

boton_confirmacion.addEventListener('click', () => {
  SetearUrl()
});