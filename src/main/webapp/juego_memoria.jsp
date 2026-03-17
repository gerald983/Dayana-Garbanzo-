<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/header.jsp" %>

<h2 class="text-center mb-2">🧠 Memoria Visual Premium – b vs d</h2>

<p class="text-center mb-3">
    Encuentra todas las parejas correctas.
</p>

<div style="width:100vw; margin-left:calc(-50vw + 50%);">
    <div id="tablero"></div>
</div>

<div class="text-center mt-2">
    <h5>Movimientos: <span id="movimientos">0</span></h5>
</div>

<div id="mensajeFinal" class="text-center mt-3"></div>

<style>

#tablero {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(110px, 1fr));
    gap: 10px;
    padding: 10px 40px;
}

.carta-container {
    perspective: 1000px;
}

.carta {
    width: 100%;
    height: 105px;
    position: relative;
    transform-style: preserve-3d;
    transition: transform 0.5s;
    cursor: pointer;
}

.carta.volteada {
    transform: rotateY(180deg);
}

.cara {
    position: absolute;
    width: 100%;
    height: 100%;
    border-radius: 15px;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size: 16px;
    font-weight: bold;
    backface-visibility: hidden;
}

.frontal {
    background: linear-gradient(135deg,#0d6efd,#4e9fff);
    color:white;
}

.trasera {
    background:white;
    color:#0d6efd;
    transform: rotateY(180deg);
    box-shadow:0 8px 15px rgba(0,0,0,0.15);
}

.victoria {
    animation: brillar 0.8s infinite alternate;
}

@keyframes brillar {
    from { transform: scale(1); }
    to { transform: scale(1.05); }
}

</style>

<script>

document.addEventListener("DOMContentLoaded", function(){

let basePalabras = [
    "bo","da","bola","dedo","burro","dado",
    "bota","diente","bebe","duda",
    "barco","delfin",
    "bandera","doctor","bodega"
];

let palabras = [];

basePalabras.forEach(p => {
    palabras.push(p);
    palabras.push(p);
});

palabras.sort(() => 0.5 - Math.random());

let tablero = document.getElementById("tablero");

let primera = null;
let segunda = null;
let bloqueado = false;

let movimientos = 0;
let movimientosHTML = document.getElementById("movimientos");

let mensajeFinal = document.getElementById("mensajeFinal");

let parejasEncontradas = 0;
let totalParejas = palabras.length / 2;

let erroresB = 0;
let erroresD = 0;

/* CREAR CARTAS */

palabras.forEach((palabra) => {

    let cont = document.createElement("div");
    cont.classList.add("carta-container");

    let carta = document.createElement("div");
    carta.classList.add("carta");
    carta.dataset.valor = palabra;

    let frontal = document.createElement("div");
    frontal.classList.add("cara","frontal");
    frontal.textContent = "?";

    let trasera = document.createElement("div");
    trasera.classList.add("cara","trasera");
    trasera.textContent = palabra;

    carta.appendChild(frontal);
    carta.appendChild(trasera);
    cont.appendChild(carta);
    tablero.appendChild(cont);

});

/* JUEGO */

tablero.addEventListener("click", function(e){

    let carta = e.target.closest(".carta");

    if(!carta || bloqueado || carta.classList.contains("volteada")) return;

    carta.classList.add("volteada");

    if(!primera){

        primera = carta;

    }else{

        segunda = carta;
        bloqueado = true;

        movimientos++;
        movimientosHTML.textContent = movimientos;

        if(primera.dataset.valor === segunda.dataset.valor){

            parejasEncontradas++;

            primera = null;
            segunda = null;
            bloqueado = false;

            if(parejasEncontradas === totalParejas){
                mostrarVictoria();
            }

        }else{

            if(primera.dataset.valor.startsWith("b")){
                erroresB++;
            }

            if(primera.dataset.valor.startsWith("d")){
                erroresD++;
            }

            setTimeout(function(){

                primera.classList.remove("volteada");
                segunda.classList.remove("volteada");

                primera = null;
                segunda = null;
                bloqueado = false;

            },700);

        }

    }

});

function mostrarVictoria(){

    document.querySelectorAll(".carta").forEach(c => {
        c.classList.add("victoria");
    });

    let puntaje = totalParejas - movimientos;

    mensajeFinal.innerHTML =
        "<h4 class='mt-3'>🎉 ¡Excelente!</h4>" +
        "<p>Movimientos: " + movimientos + "</p>" +
        "<p>Errores B: " + erroresB + "</p>" +
        "<p>Errores D: " + erroresD + "</p>" +
        "<button class='btn btn-primary mt-2' onclick='location.reload()'>Jugar de nuevo</button>";

    let nombre = "<%= session.getAttribute("estudiante") %>";

    fetch("guardar_resultado.jsp?nombre="+nombre+
    "&juego=Memoria Visual"+
    "&puntaje="+puntaje+
    "&errores_b="+erroresB+
    "&errores_d="+erroresD);

}

});
</script>

<%@ include file="/includes/footer.jsp" %>