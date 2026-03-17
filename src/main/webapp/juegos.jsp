<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/header.jsp" %>

<h2 class="text-center mb-5 fw-bold">🎮 Juegos Interactivos</h2>

<p class="text-center mb-5">
    Selecciona una actividad para reforzar el reconocimiento y uso correcto
    de las grafías <strong>b</strong> y <strong>d</strong>.
</p>

<div class="row g-4">

    <!-- Juego 1 -->
    <div class="col-md-4">
        <div class="card h-100 text-center p-4">
            <h4>🔤 Arrastra la letra</h4>
            <p>Completa palabras eligiendo correctamente entre b y d.</p>
            <a href="juego_arrastrar.jsp" class="btn btn-primary mt-3">
                Ingresar
            </a>
        </div>
    </div>

    <!-- Juego 2 -->
    <div class="col-md-4">
        <div class="card h-100 text-center p-4">
            <h4>🎧 Escucha y selecciona</h4>
            <p>Identifica auditivamente la grafía correcta.</p>
            <a href="juego_audio.jsp" class="btn btn-primary mt-3">
                Ingresar
            </a>
        </div>
    </div>

    <!-- Juego 3 -->
    <div class="col-md-4">
        <div class="card h-100 text-center p-4">
            <h4>🧠 Memoria Visual</h4>
            <p>Encuentra las parejas correctas de palabras con b y d.</p>
            <a href="juego_memoria.jsp" class="btn btn-primary mt-3">
                Ingresar
            </a>
        </div>
    </div>

    <!-- Juego 4 -->
    <div class="col-md-4">
        <div class="card h-100 text-center p-4">
            <h4>✏️ ¿Está correcta la palabra?</h4>
            <p>Detecta y corrige errores en frases.</p>
            <a href="juego_corregir.jsp" class="btn btn-primary mt-3">
                Ingresar
            </a>
        </div>
    </div>

    <!-- Juego 5 -->
    <div class="col-md-4">
        <div class="card h-100 text-center p-4">
            <h4>⚡ Velocidad Mental</h4>
            <p>Selecciona las palabras correctas antes que termine el tiempo.</p>
            <a href="juego_velocidad.jsp" class="btn btn-primary mt-3">
                Ingresar
            </a>
        </div>
    </div>

    <!-- CORRIGE EL TEXTO -->

    <div class="col-md-4 mb-4">

        <div class="card shadow text-center p-4">

            <h5>📝 Encuentra los errores</h5>
            <p>Lee el texto y selecciona las palabras que están mal escritas con las letras b y d.</p>
            <a href="corregir_texto.jsp" class="btn btn-primary">
                Jugar
            </a>
        </div>
    </div>

</div>

<%@ include file="/includes/footer.jsp" %>