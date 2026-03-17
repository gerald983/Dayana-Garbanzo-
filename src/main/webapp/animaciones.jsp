<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/header.jsp" %>
<style>

svg path{
    stroke-dasharray: 500;
    stroke-dashoffset: 500;
    animation: trazo 3s ease forwards;
}

@keyframes trazo{
    to{
        stroke-dashoffset:0;
    }
}

</style>

<h2 class="text-primary text-center mb-4">
    ✏️ Animaciones del Trazo – Grafías b y d
</h2>

<p class="text-center mb-5">
    Observa el trazo correcto y luego practica.
</p>

<div class="row text-center">

    <!-- B mayúscula -->
    <div class="col-md-3 mb-5">
        <h5>B Mayúscula</h5>
        <svg width="160" height="200">
            <path d="M60 60 L60 160
                     M60 60
                     C120 60, 120 110, 60 110
                     M60 110
                     C120 110, 120 160, 60 160"
                  stroke="#198754"
                  stroke-width="5"
                  fill="none"
                  stroke-linecap="round"/>
        </svg>
    </div>

    <!-- D mayúscula -->
    <div class="col-md-3 mb-5">
        <h5>D Mayúscula</h5>
        <svg width="160" height="200">
            <path d="M60 60 L60 160
                     M60 60
                     C140 60, 140 160, 60 160"
                  stroke="#6f42c1"
                  stroke-width="5"
                  fill="none"
                  stroke-linecap="round"/>
        </svg>
    </div>

    <!-- b minúscula -->
    <div class="col-md-3 mb-5">
        <h5>b minúscula</h5>
        <svg width="160" height="200">
            <path d="M70 60 L70 160
                     M70 100
                     C120 80, 120 160, 70 160"
                  stroke="#0d6efd"
                  stroke-width="5"
                  fill="none"
                  stroke-linecap="round"/>
        </svg>
    </div>

    <!-- d minúscula -->
    <div class="col-md-3 mb-5">
        <h5>d minúscula</h5>
        <svg width="160" height="200">
            <path d="M100 60 L100 160
                     M100 160
                     C50 160, 50 100, 100 90"
                  stroke="#dc3545"
                  stroke-width="5"
                  fill="none"
                  stroke-linecap="round"/>
        </svg>
    </div>

</div>

<div class="text-center mb-4">
    <button class="btn btn-warning" onclick="letraAleatoria()">
        Practicar letra aleatoria
    </button>
</div>

<hr class="my-5">

<h4 class="text-center mb-3">📝 Practica guiada</h4>

<div class="row align-items-center">

    <!-- LETRA GUIA -->
    <div class="col-md-4 text-center d-flex flex-column align-items-center justify-content-start">

        <h5 id="letraSeleccionada" class="fw-bold text-primary mb-3"></h5>

        <svg id="letraGuiaSVG"
             width="220"
             height="260"
             viewBox="0 40 260 220">
        </svg>

    </div>

    <!-- CANVAS -->
    <div class="col-md-8 text-center">

        <canvas id="canvasLibre"
                width="500"
                height="300"
                style="border:2px solid black; border-radius:10px; cursor:crosshair;">
        </canvas>

        <br><br>

        <button class="btn btn-secondary me-2" onclick="limpiarCanvas()">
            Limpiar
        </button>

        <button class="btn btn-warning" onclick="letraAleatoria()">
            Cambiar letra
        </button>

    </div>

</div>

<script>

// =============================
// LETRAS DISPONIBLES
// =============================
const letras = [
    {
        nombre:"B Mayúscula",
        d:"M80 60 L80 190 M80 60 C160 60, 160 125, 80 125 M80 125 C160 125, 160 190, 80 190",
        color:"#198754"
    },
    {
        nombre:"D Mayúscula",
        d:"M80 60 L80 190 M80 60 C180 60, 180 190, 80 190",
        color:"#6f42c1"
    },
    {
        nombre:"b minúscula",
        d:"M90 60 L90 190 M90 120 C160 100, 160 190, 90 190",
        color:"#0d6efd"
    },
    {
        nombre:"d minúscula",
        d:"M130 60 L130 190 M130 190 C60 190, 60 120, 130 120",
        color:"#dc3545"
    }
];

// =============================
// ANIMACIÓN
// =============================
function animarPath(path) {
    const length = path.getTotalLength();
    path.style.transition = "none";
    path.style.strokeDasharray = length;
    path.style.strokeDashoffset = length;

    setTimeout(() => {
        path.style.transition = "stroke-dashoffset 2s ease";
        path.style.strokeDashoffset = "0";
    }, 100);
}

// =============================
// CAMBIAR LETRA
// =============================
function letraAleatoria(){

    let seleccion = letras[Math.floor(Math.random()*letras.length)];

    document.getElementById("letraSeleccionada").textContent =
        "Practique: " + seleccion.nombre;

    let svg = document.getElementById("letraGuiaSVG");
    svg.innerHTML = "";

    let path = document.createElementNS("http://www.w3.org/2000/svg","path");
    path.setAttribute("d", seleccion.d);
    path.setAttribute("stroke", seleccion.color);
    path.setAttribute("stroke-width", "6");
    path.setAttribute("fill", "none");
    path.setAttribute("stroke-linecap", "round");

    svg.appendChild(path);

    animarPath(path);

    document.getElementById("canvasLibre")
        .scrollIntoView({behavior:"smooth"});
}

// =============================
// CANVAS
// =============================
const canvas = document.getElementById("canvasLibre");
const ctx = canvas.getContext("2d");

let dibujando = false;

ctx.lineWidth = 4;
ctx.lineCap = "round";
ctx.strokeStyle = "black";

canvas.addEventListener("mousedown", (e) => {
    dibujando = true;
    ctx.beginPath();
    ctx.moveTo(e.offsetX, e.offsetY);
});

canvas.addEventListener("mouseup", () => {
    dibujando = false;
    ctx.beginPath();
});

canvas.addEventListener("mousemove", (e) => {
    if (!dibujando) return;
    ctx.lineTo(e.offsetX, e.offsetY);
    ctx.stroke();
});

function limpiarCanvas() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
}
</script>

<%@ include file="/includes/footer.jsp" %>

</script>

<%@ include file="/includes/footer.jsp" %>