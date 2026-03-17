<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/header.jsp" %>

<h2 class="text-center mb-4">🔤 Arrastra la letra correcta</h2>

<p class="text-center">
    Tendrás 60 segundos para completar 15 palabras.<br>
    El tiempo inicia cuando presiones <strong>Iniciar</strong>.
</p>

<div class="text-center mb-3">
    <button class="btn btn-primary btn-lg" id="btnIniciar">Iniciar</button>
</div>

<div class="text-center mb-3">
    ⏱ Tiempo restante: <span id="tiempo">60</span> segundos
</div>

<div class="text-center mb-4">
    <h3 id="palabra" class="fw-bold display-6"></h3>
</div>

<div class="text-center mb-4">
    <div class="letra" draggable="true" id="letraB">b</div>
    <div class="letra" draggable="true" id="letraD">d</div>
</div>

<div class="text-center mb-4">
    <div id="zonaDrop" class="zona">Suelta aquí</div>
</div>

<div id="resultadoFinal" class="text-center mt-5"></div>

<style>
.letra {
    display:inline-block;
    padding:15px 25px;
    margin:10px;
    font-size:28px;
    font-weight:bold;
    border-radius:15px;
    background:white;
    cursor:grab;
    box-shadow:0 8px 15px rgba(0,0,0,0.1);
    transition:0.3s;
    opacity:0.5;
}

.letra.activa {
    opacity:1;
}

.letra:hover {
    transform:scale(1.1);
}

.zona {
    min-height:80px;
    padding:20px;
    border:3px dashed #0d6efd;
    border-radius:20px;
    background:white;
    transition:0.3s;
}
</style>

<script>

document.addEventListener("DOMContentLoaded", function(){

let banco = [
    {texto:"_ola", correcta:"b"},
    {texto:"_edo", correcta:"d"},
    {texto:"_urro", correcta:"b"},
    {texto:"_ado", correcta:"d"},
    {texto:"_anco", correcta:"b"},
    {texto:"_alón", correcta:"b"},
    {texto:"_iente", correcta:"d"},
    {texto:"_anana", correcta:"b"},
    {texto:"_arco", correcta:"b"},
    {texto:"_elfín", correcta:"d"},
    {texto:"_odega", correcta:"b"},
    {texto:"_ota", correcta:"b"},
    {texto:"_orde", correcta:"b"},
    {texto:"_anda", correcta:"b"},
    {texto:"_edo", correcta:"d"},
    {texto:"_urro", correcta:"b"},
    {texto:"_ado", correcta:"d"},
    {texto:"_anco", correcta:"b"},
    {texto:"_alón", correcta:"b"},
    {texto:"_iente", correcta:"d"}
];

banco.sort(() => 0.5 - Math.random());
let palabras = banco.slice(0, 15);

let indice = 0;
let puntaje = 0;
let tiempo = 60;
let limite = 15;
let juegoActivo = false;
let contador;

let erroresB = 0;
let erroresD = 0;

const palabraHTML = document.getElementById("palabra");
const zonaDrop = document.getElementById("zonaDrop");
const tiempoHTML = document.getElementById("tiempo");
const resultadoFinal = document.getElementById("resultadoFinal");
const btnIniciar = document.getElementById("btnIniciar");
const letraB = document.getElementById("letraB");
const letraD = document.getElementById("letraD");

function activarLetras(){
    letraB.classList.add("activa");
    letraD.classList.add("activa");
}

function cargarPalabra(){
    palabraHTML.textContent = palabras[indice].texto;
    zonaDrop.textContent = "Suelta aquí";
    zonaDrop.style.backgroundColor = "white";
}

function finalizarJuego(motivo){

    clearInterval(contador);
    juegoActivo = false;

    palabraHTML.textContent = motivo;
    zonaDrop.textContent = "";

    resultadoFinal.innerHTML =
        "<h3 class='mt-4'>Resultado final</h3>" +
        "<p>Respondió " + indice + " de 15</p>" +
        "<p>Aciertos: " + puntaje + "</p>" +
        "<p>Errores con letra B: " + erroresB + "</p>" +
        "<p>Errores con letra D: " + erroresD + "</p>" +
        "<button class='btn btn-primary mt-3' onclick='location.reload()'>Jugar de nuevo</button>";

    let nombre = "<%= session.getAttribute("estudiante") %>";

    fetch("guardar_resultado.jsp?nombre="+nombre+
    "&juego=Arrastrar Letras"+
    "&puntaje="+puntaje+
    "&errores_b="+erroresB+
    "&errores_d="+erroresD);

}

btnIniciar.addEventListener("click", function(){

    btnIniciar.disabled = true;
    juegoActivo = true;
    activarLetras();
    cargarPalabra();

    contador = setInterval(function(){
        tiempo--;
        tiempoHTML.textContent = tiempo;

        if(tiempo <= 0){
            finalizarJuego("⏰ Tiempo terminado");
        }
    },1000);
});

letraB.addEventListener("dragstart", function(e){
    if(!juegoActivo) return;
    e.dataTransfer.setData("letra","b");
});

letraD.addEventListener("dragstart", function(e){
    if(!juegoActivo) return;
    e.dataTransfer.setData("letra","d");
});

zonaDrop.addEventListener("dragover", function(e){
    e.preventDefault();
});

zonaDrop.addEventListener("drop", function(e){

    if(!juegoActivo) return;

    e.preventDefault();

    if(indice >= limite) return;

    let letra = e.dataTransfer.getData("letra");

    if(letra === palabras[indice].correcta){

        puntaje++;

        zonaDrop.style.backgroundColor = "#d4edda";
        zonaDrop.innerHTML = "✔";

    }else{

        if(letra === "b"){
            erroresB++;
        }else{
            erroresD++;
        }

        zonaDrop.style.backgroundColor = "#f8d7da";
        zonaDrop.innerHTML = "✖";
    }

    setTimeout(function(){

        indice++;

        if(indice >= limite){
            finalizarJuego("✅ Terminó las preguntas");
            return;
        }

        cargarPalabra();

    }, 600);

});

});
</script>

<%@ include file="/includes/footer.jsp" %>