<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/header.jsp" %>

<h2 class="text-center mb-4">🔊 Escucha y selecciona</h2>

<p class="text-center">
    Escucha la palabra y selecciona la opción correcta.
</p>

<div class="text-center mb-3">
    <button class="btn btn-primary btn-lg" id="btnIniciar">Iniciar</button>
</div>

<div class="text-center mb-3">
    ⏱ Tiempo restante: <span id="tiempo">30</span> segundos
</div>

<div class="text-center mb-4">
    <button class="btn btn-secondary" id="btnReproducir" disabled>
        🔊 Reproducir audio
    </button>
</div>

<div class="text-center mb-4" id="opciones"></div>

<div class="text-center fw-bold" id="retroalimentacion"></div>

<div id="mensajeFinal" class="text-center mt-4"></div>

<script>

document.addEventListener("DOMContentLoaded", function(){

let banco = [
    "bola","dedo","bota","dado","burro",
    "bodega","bandera","doctor","banana",
    "diente","balon","dedal","barco",
    "duda","banco","bebida","dragón",
    "bisonte","delfin","bambu"
];

banco.sort(() => 0.5 - Math.random());
let preguntas = banco.slice(0,15);

let indice = 0;
let puntaje = 0;
let tiempo = 30;
let limite = 15;
let juegoActivo = false;
let contador;

let erroresB = 0;
let erroresD = 0;

const btnIniciar = document.getElementById("btnIniciar");
const btnReproducir = document.getElementById("btnReproducir");
const tiempoHTML = document.getElementById("tiempo");
const opcionesHTML = document.getElementById("opciones");
const retro = document.getElementById("retroalimentacion");
const mensajeFinal = document.getElementById("mensajeFinal");

let palabraActual;

/* audio */
function reproducirAudio(texto){
    let speech = new SpeechSynthesisUtterance(texto);
    speech.lang = "es-ES";
    speech.rate = 0.9;
    speechSynthesis.speak(speech);
}

function generarIncorrecta(palabra){
    if(palabra.startsWith("b")){
        return "d" + palabra.slice(1);
    }else{
        return "b" + palabra.slice(1);
    }
}

function cargarPregunta(){

    opcionesHTML.innerHTML = "";
    retro.textContent = "";

    palabraActual = preguntas[indice];
    let incorrecta = generarIncorrecta(palabraActual);

    let opciones = [palabraActual, incorrecta];
    opciones.sort(() => 0.5 - Math.random());

    opciones.forEach(op => {

        let btn = document.createElement("button");
        btn.classList.add("btn","btn-outline-primary","m-2");
        btn.textContent = op;

        btn.addEventListener("click", function(){

            if(!juegoActivo) return;

            if(op === palabraActual){

                puntaje++;
                retro.textContent = "✅ Correcto";
                retro.style.color = "green";

            }else{

                retro.textContent = "❌ Incorrecto";
                retro.style.color = "red";

                if(op.startsWith("b")){
                    erroresB++;
                }else{
                    erroresD++;
                }
            }

            setTimeout(function(){

                indice++;

                if(indice >= limite){
                    finalizarJuego("✅ Terminó las preguntas");
                    return;
                }

                cargarPregunta();

            },800);
        });

        opcionesHTML.appendChild(btn);
    });
}

function finalizarJuego(motivo){

    clearInterval(contador);
    juegoActivo = false;

    opcionesHTML.innerHTML = "";

    mensajeFinal.innerHTML =
        "<h4>"+motivo+"</h4>" +
        "<p>Respondió "+indice+" de 15</p>" +
        "<p>Aciertos: "+puntaje+"</p>" +
        "<p>Errores B: "+erroresB+"</p>" +
        "<p>Errores D: "+erroresD+"</p>" +
        "<button class='btn btn-primary mt-2' onclick='location.reload()'>Reiniciar</button>";

    let nombre = "<%= session.getAttribute("estudiante") %>";

    fetch("guardar_resultado.jsp?nombre="+nombre+
    "&juego=Escucha y selecciona"+
    "&puntaje="+puntaje+
    "&errores_b="+erroresB+
    "&errores_d="+erroresD);
}

btnIniciar.addEventListener("click", function(){

    btnIniciar.disabled = true;
    btnReproducir.disabled = false;
    juegoActivo = true;

    cargarPregunta();

    contador = setInterval(function(){

        tiempo--;
        tiempoHTML.textContent = tiempo;

        if(tiempo <= 0){
            finalizarJuego("⏰ Tiempo terminado");
        }

    },1000);
});

btnReproducir.addEventListener("click", function(){
    if(!juegoActivo) return;
    reproducirAudio(palabraActual);
});

});
</script>

<%@ include file="/includes/footer.jsp" %>