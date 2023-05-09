const asientos_seleccionadas = [];
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
    asientos_seleccionadas.splice(index, 1);
    console.log(asientos_seleccionadas);
  } else {
    asientos_seleccionadas.push(id);
    console.log(asientos_seleccionadas);
  }
}

asientos_disponibles.forEach(asiento => {
  asiento.addEventListener('click', event => {
    let id = event.target.id;
    let index = asientos_seleccionadas.indexOf(id);
    seleccionar(index, id);
    event.target.classList.toggle('selected');
  });
});
