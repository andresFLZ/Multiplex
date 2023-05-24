const reserva_d = document.getElementById("btn-reserva-desp");
const boton_ry = document.getElementById("btn-reserva-ya");
const form = boton_ry.closest('form');

function existeComida() {
    let total_sancks = document.getElementById("totalS").textContent;

    if (total_sancks == "0") {
        return false;
    } else {
        return true;
    }
}

function aniadirSnacks(sn) {
    let snacks = document.createElement('input');

    snacks.type = 'hidden';
    snacks.name = 'snacks';
    snacks.value = JSON.stringify(sn);

    form.appendChild(snacks);
}

function generarForm(as, es, co, va, fu, us) {
    let asientos = document.createElement('input');
    let estado = document.createElement('input');
    let comida = document.createElement('input');
    let valor = document.createElement('input');
    let funcion = document.createElement('input');
    let usuario = document.createElement('input');

    asientos.type = 'hidden';
    asientos.name = 'asientos';
    asientos.value = as;
    estado.type = 'hidden';
    estado.name = 'estado';
    estado.value = es;
    comida.type = 'hidden';
    comida.name = 'comida';
    comida.value = co;
    valor.type = 'hidden';
    valor.name = 'valor';
    valor.value = va;
    funcion.type = 'hidden';
    funcion.name = 'funcion';
    funcion.value = fu;
    usuario.type = 'hidden';
    usuario.name = 'usuario';
    usuario.value = us;

    form.appendChild(asientos);
    form.appendChild(estado);
    form.appendChild(comida);
    form.appendChild(valor);
    form.appendChild(funcion);
    form.appendChild(usuario);
}

function listarSnacks() {
    const spans_cantidad = document.querySelectorAll('.cantidad-snacks-r');
    let snacks = {}

    spans_cantidad.forEach(span => {
        if (span.innerHTML !== '0') {
            snacks[document.getElementById("nombreS" + span.id.slice(-1)).textContent] = span.textContent;
        }
    });

    return snacks;
}

boton_ry.addEventListener('click', e => {
    e.preventDefault();
    let asientos = document.getElementById("asientos-r").textContent.split(": ")[1];
    let estado = 1;
    let comida = existeComida();
    let valor = document.getElementById("precio-r").textContent.split(": ")[1];
    let funcion = document.getElementById("id-funcion").textContent;
    let usuario = document.getElementById("dni-usuario").textContent;

    generarForm(asientos, estado, comida, valor, funcion, usuario);

    if (comida == true) {
        let snacks = listarSnacks()
        aniadirSnacks(snacks)
    }

    form.submit();
});

reserva_d.addEventListener('click', e => {
    e.preventDefault();
    let asientos = document.getElementById("asientos-r").textContent.split(": ")[1];
    let estado = 2;
    let comida = false;
    let valor = document.getElementById("precio-r").textContent.split(": ")[1];
    let funcion = document.getElementById("id-funcion").textContent;
    let usuario = document.getElementById("dni-usuario").textContent;

    generarForm(asientos, estado, comida, valor, funcion, usuario);
    form.submit();
});