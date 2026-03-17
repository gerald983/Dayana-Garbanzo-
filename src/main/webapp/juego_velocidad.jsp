<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/header.jsp" %>

<h2 class="text-center mb-3">⚡ Velocidad Mental – b vs d</h2>

<p class="text-center">
    Tendrás 30 segundos para responder 15 palabras.
</p>

<div class="text-center mt-3">
    <button class="btn btn-primary btn-lg" id="btnIniciar">Iniciar</button>
</div>

<div class="text-center mt-3">
    ⏱ Tiempo: <span id="tiempo">30</span> segundos
</div>

<div class="text-center">
    📌 Respondidas: <span id="respondidas">0</span> / 15
</div>

<div class="text-center mt-4">
    <h1 id="palabra" class="fw-bold"></h1>
</div>

<div class="text-center mt-4">
    <button class="btn btn-success m-2" id="btnCorrecta" disabled>Correcta</button>
    <button class="btn btn-danger m-2" id="btnIncorrecta" disabled>Incorrecta</button>
</div>

<div id="mensajeFinal" class="text-center mt-4"></div>

<script>

document.addEventListener("DOMContentLoaded", function(){

let banco = [
    { palabra:"bola", correcta:true },
    { palabra:"dola", correcta:false },
    { palabra:"dedo", correcta:true },
    { palabra:"bedo", correcta:false },
    { palabra:"bodega", correcta:true },
    { palabra:"dodega", correcta:false },
    { palabra:"bota", correcta:true },
    { palabra:"dota", correcta:false },
    { palabra:"burro", correcta:true },
    { palabra:"durro", correcta:false },
    { palabra:"dado", correcta:true },
    { palabra:"bado", correcta:false },
    { palabra:"balon", correcta:true },
    { palabra:"dalon", correcta:false },
    { palabra:"banana", correcta:true },
    { palabra:"danana", correcta:false },
    { palabra:"barco", correcta:true },
    { palabra:"darco", correcta:false }
];

let tiempo = 30;
let puntaje = 0;
let respondidas = 0;
let limite = 15;
let actual = null;
let contador = null;

let erroresB = 0;
let erroresD = 0;

const tiempoHTML = document.getElementById("tiempo");
const palabraHTML = document.getElementById("palabra");

const respondidasHTML = document.getElementById("respondidas");
const mensajeFinal = document.getElementById("mensajeFinal");

const btnCorrecta = document.getElementById("btnCorrecta");
const btnIncorrecta = document.getElementById("btnIncorrecta");
const btnIniciar = document.getElementById("btnIniciar");

function nuevaPalabra(){

    let random = Math.floor(Math.random() * banco.length);
    actual = banco[random];
    palabraHTML.textContent = actual.palabra;

}

function finalizarJuego(){

    clearInterval(contador);

    palabraHTML.textContent = "";

    btnCorrecta.disabled = true;
    btnIncorrecta.disabled = true;

    mensajeFinal.innerHTML =
        "<h3>⏹ Juego terminado</h3>" +
        "<p>Respondió " + respondidas + " de 15</p>" +
        "<p>Aciertos: " + puntaje + "</p>" +
        "<p>Errores B: " + erroresB + "</p>" +
        "<p>Errores D: " + erroresD + "</p>" +
        "<button class='btn btn-primary mt-2' onclick='location.reload()'>Reiniciar</button>";

    let nombre = "<%= session.getAttribute("estudiante") %>";

    fetch("guardar_resultado.jsp?nombre="+nombre+
    "&juego=Velocidad Mental"+
    "&puntaje="+puntaje+
    "&errores_b="+erroresB+
    "&errores_d="+erroresD);

}

function evaluar(respuesta){

    if(respondidas >= limite) return;

    respondidas++;
    respondidasHTML.textContent = respondidas;

    let correcta = actual.correcta;

    if((respuesta === true && correcta) ||
       (respuesta === false && !correcta)){

        puntaje++;

    }else{

        if(actual.palabra.startsWith("b")){
            erroresB++;
        }else{
            erroresD++;
        }

    }

    if(respondidas >= limite){
        finalizarJuego();
        return;
    }

    nuevaPalabra();

}

btnCorrecta.addEventListener("click", function(){
    evaluar(true);
});

btnIncorrecta.addEventListener("click", function(){
    evaluar(false);
});

btnIniciar.addEventListener("click", function(){

    btnIniciar.disabled = true;

    btnCorrecta.disabled = false;
    btnIncorrecta.disabled = false;

    nuevaPalabra();

    contador = setInterval(function(){

        tiempo--;
        tiempoHTML.textContent = tiempo;

        if(tiempo <= 0){
            finalizarJuego();
        }

    },1000);

});

});
</script>

<%@ include file="/includes/footer.jsp" %>