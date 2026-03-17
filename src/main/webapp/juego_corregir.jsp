<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/header.jsp" %>

<h2 class="text-center mb-4">✏️ ¿Está correcta la palabra?</h2>

<p class="text-center mb-3">
    Tendrás 30 segundos para responder 15 preguntas.
</p>

<div class="text-center mb-3">
    <button class="btn btn-primary btn-lg" id="btnIniciar">Iniciar</button>
</div>

<div class="text-center mb-3">
    ⏱ Tiempo restante: <span id="tiempo">30</span> segundos
</div>

<div class="container text-center">

    <div id="oracion" class="fs-4 mb-4 fw-bold"></div>

    <div id="opciones" class="mb-4"></div>

    <div id="mensajeFinal" class="mt-4"></div>

</div>

<style>
.palabra {
    font-weight: bold;
    text-decoration: underline;
}

.opcion-btn {
    margin: 10px;
    min-width: 140px;
}
</style>

<script>

document.addEventListener("DOMContentLoaded", function(){

let banco = [

{ base:"El niño juega con la PALABRA.", correcta:"bola", incorrecta:"dola" },
{ base:"El perro tiene un PALABRA herido.", correcta:"dedo", incorrecta:"deo" },
{ base:"Mi mamá guarda pan en la PALABRA.", correcta:"bodega", incorrecta:"dodega" },
{ base:"El niño lanza la PALABRA al aire.", correcta:"bota", incorrecta:"dota" },
{ base:"El médico revisa el PALABRA.", correcta:"dedo", incorrecta:"bedo" },
{ base:"El bebé toma su PALABRA.", correcta:"biberon", incorrecta:"diberon" },
{ base:"El PALABRA está lleno.", correcta:"balde", incorrecta:"dalde" },
{ base:"La PALABRA está abierta.", correcta:"boca", incorrecta:"doca" },
{ base:"El niño dibuja un PALABRA.", correcta:"barco", incorrecta:"darco" },
{ base:"La PALABRA es azul.", correcta:"bandera", incorrecta:"dandera" },
{ base:"El PALABRA es rápido.", correcta:"burro", incorrecta:"durro" },
{ base:"Mi abuelo usa PALABRA.", correcta:"baston", incorrecta:"daston" },
{ base:"La PALABRA es dulce.", correcta:"bebida", incorrecta:"debida" },
{ base:"El PALABRA está sucio.", correcta:"dedo", incorrecta:"bedo" },
{ base:"El niño juega con el PALABRA.", correcta:"dado", incorrecta:"bado" },
{ base:"La PALABRA está rota.", correcta:"bota", incorrecta:"dota" },
{ base:"El PALABRA es de madera.", correcta:"banco", incorrecta:"danco" },
{ base:"La PALABRA es pequeña.", correcta:"bolita", incorrecta:"dolita" },
{ base:"El PALABRA es fuerte.", correcta:"bisonte", incorrecta:"dison te" },
{ base:"El PALABRA es verde.", correcta:"bambu", incorrecta:"dambu" }

];

banco.sort(() => 0.5 - Math.random());

let preguntas = banco.slice(0, 15);

let indice = 0;
let puntaje = 0;
let tiempo = 30;
let limite = 15;
let juegoActivo = false;
let contador;

let erroresB = 0;
let erroresD = 0;

const oracionHTML = document.getElementById("oracion");
const opcionesHTML = document.getElementById("opciones");
const mensajeFinal = document.getElementById("mensajeFinal");
const tiempoHTML = document.getElementById("tiempo");
const btnIniciar = document.getElementById("btnIniciar");

function cargarPregunta(){

    opcionesHTML.innerHTML = "";

    let pregunta = preguntas[indice];

    let mostrarCorrecta = Math.random() < 0.5;

    let palabraMostrada = mostrarCorrecta ? pregunta.correcta : pregunta.incorrecta;

    let textoFinal = pregunta.base.replace(
        "PALABRA",
        "<span class='palabra'>" + palabraMostrada + "</span>"
    );

    oracionHTML.innerHTML = textoFinal;

    let opciones = [pregunta.correcta, pregunta.incorrecta];
    opciones.sort(() => 0.5 - Math.random());

    opciones.forEach(op => {

        let btn = document.createElement("button");
        btn.classList.add("btn","btn-outline-primary","opcion-btn");
        btn.textContent = op;

        btn.addEventListener("click", function(){

            if(!juegoActivo) return;

            if(op === pregunta.correcta){

                puntaje++;

            }else{

                if(op.startsWith("b")){
                    erroresB++;
                }else{
                    erroresD++;
                }

            }

            indice++;

            if(indice >= limite){
                finalizarJuego("✅ Terminó las preguntas");
                return;
            }

            cargarPregunta();
        });

        opcionesHTML.appendChild(btn);
    });
}

function finalizarJuego(motivo){

    clearInterval(contador);
    juegoActivo = false;

    oracionHTML.innerHTML = motivo;
    opcionesHTML.innerHTML = "";

    mensajeFinal.innerHTML =
        "<h4>Resultado final</h4>" +
        "<p>Respondió " + indice + " de 15</p>" +
        "<p>Aciertos: " + puntaje + "</p>" +
        "<p>Errores B: " + erroresB + "</p>" +
        "<p>Errores D: " + erroresD + "</p>" +
        "<button class='btn btn-primary mt-2' onclick='location.reload()'>Reiniciar</button>";

    let nombre = "<%= session.getAttribute("estudiante") %>";

    fetch("guardar_resultado.jsp?nombre="+nombre+
    "&juego=Corrección de palabra"+
    "&puntaje="+puntaje+
    "&errores_b="+erroresB+
    "&errores_d="+erroresD);

}

btnIniciar.addEventListener("click", function(){

    btnIniciar.disabled = true;
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

});
</script>

<%@ include file="/includes/footer.jsp" %>