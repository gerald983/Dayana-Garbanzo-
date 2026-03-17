<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/header.jsp" %>

<style>

.video-extra{
display:none;
}

</style>

<h2 class="text-center text-primary mb-4">
🎥 Videos educativos – Grafías b y d
</h2>

<p class="text-center mb-5">
Observa los siguientes videos que te ayudarán a reconocer y diferenciar las grafías <b>b</b> y <b>d</b>.
</p>

<div class="container">

<div class="row">

<!-- VIDEO 1 -->
<div class="col-md-4 mb-4">
<div class="card shadow-sm">

<div class="ratio ratio-16x9">
<iframe src="https://www.youtube.com/embed/uGkNU0ZFtM8" allowfullscreen></iframe>
</div>

<div class="card-body">
<h6 class="card-title">Fonemas B y D</h6>
<p class="card-text">Discriminación auditiva de las letras.</p>
</div>

</div>
</div>

<!-- VIDEO 2 -->
<div class="col-md-4 mb-4">
<div class="card shadow-sm">

<div class="ratio ratio-16x9">
<iframe src="https://www.youtube.com/embed/XEVWk9o4m7Q" allowfullscreen></iframe>
</div>

<div class="card-body">
<h6 class="card-title">Uso de la letra B</h6>
<p class="card-text">Diferencias entre B y D.</p>
</div>

</div>
</div>

<!-- VIDEO 3 -->
<div class="col-md-4 mb-4">
<div class="card shadow-sm">

<div class="ratio ratio-16x9">
<iframe src="https://www.youtube.com/embed/5FSsZt1PNOo" allowfullscreen></iframe>
</div>

<div class="card-body">
<h6 class="card-title">Aprender B y D</h6>
<p class="card-text">Lectura y escritura.</p>
</div>

</div>
</div>

<!-- VIDEO 4 -->
<div class="col-md-4 mb-4">
<div class="card shadow-sm">

<div class="ratio ratio-16x9">
<iframe src="https://www.youtube.com/embed/ctRiq873vVk?si" allowfullscreen></iframe>
</div>

<div class="card-body">
<h6 class="card-title">Diferenciar B y D</h6>
<p class="card-text">Ejercicios visuales.</p>
</div>

</div>
</div>

<!-- VIDEO 5 -->
<div class="col-md-4 mb-4">
<div class="card shadow-sm">

<div class="ratio ratio-16x9">
<iframe src="https://www.youtube.com/embed/181qLjqhUWw" allowfullscreen></iframe>
</div>

<div class="card-body">
<h6 class="card-title">Ejercicios B y D</h6>
<p class="card-text">Práctica de discriminación.</p>
</div>

</div>
</div>

<!-- VIDEO 6 -->
<div class="col-md-4 mb-4">
<div class="card shadow-sm">

<div class="ratio ratio-16x9">
<iframe src="https://www.youtube.com/embed/v7dpsHFkPlw" allowfullscreen></iframe>
</div>

<div class="card-body">
<h6 class="card-title">Palabras con B</h6>
<p class="card-text">Ejemplos sencillos.</p>
</div>

</div>
</div>

<!-- VIDEO 7 -->
<div class="col-md-4 mb-4 video-extra">
<div class="card shadow-sm">

<div class="ratio ratio-16x9">
<iframe src="https://www.youtube.com/embed/SWJnRqJ2LFc" allowfullscreen></iframe>
</div>

<div class="card-body">
<h6 class="card-title">Palabras con D</h6>
<p class="card-text">Ejercicios de lectura.</p>
</div>

</div>
</div>

<!-- VIDEO 8 -->
<div class="col-md-4 mb-4 video-extra">
<div class="card shadow-sm">

<div class="ratio ratio-16x9">
<iframe src="https://www.youtube.com/embed/y9s3runl_8M" allowfullscreen></iframe>
</div>

<div class="card-body">
<h6 class="card-title">Lectura con B y D</h6>
<p class="card-text">Ejercicios educativos.</p>
</div>

</div>
</div>

<!-- VIDEO 9 -->
<div class="col-md-4 mb-4 video-extra">
<div class="card shadow-sm">

<div class="ratio ratio-16x9">
<iframe src="https://www.youtube.com/embed/WorxC7rJdYQ" allowfullscreen></iframe>
</div>

<div class="card-body">
<h6 class="card-title">Discriminación visual</h6>
<p class="card-text">Identificar B y D.</p>
</div>

</div>
</div>

<!-- VIDEO 10 -->
<div class="col-md-4 mb-4 video-extra">
<div class="card shadow-sm">

<div class="ratio ratio-16x9">
<iframe src="https://www.youtube.com/embed/t5Z1cq1poOA" allowfullscreen></iframe>
</div>

<div class="card-body">
<h6 class="card-title">B y D para niños</h6>
<p class="card-text">Explicación sencilla.</p>
</div>

</div>
</div>

<!-- VIDEO 11 -->
<div class="col-md-4 mb-4 video-extra">
<div class="card shadow-sm">

<div class="ratio ratio-16x9">
<iframe src="https://www.youtube.com/embed/dq7q9mWjmms" allowfullscreen></iframe>
</div>

<div class="card-body">
<h6 class="card-title">Ortografía B y D</h6>
<p class="card-text">Uso correcto.</p>
</div>

</div>
</div>

<!-- VIDEO 12 -->
<div class="col-md-4 mb-4 video-extra">
<div class="card shadow-sm">

<div class="ratio ratio-16x9">
<iframe src="https://www.youtube.com/embed/vQBSBty5hIs" allowfullscreen></iframe>
</div>

<div class="card-body">
<h6 class="card-title">B y D para niños</h6>
<p class="card-text">Explicación sencilla.</p>
</div>

</div>
</div>

</div>

<!-- BOTON -->
<div class="text-center mt-4">

<button class="btn btn-primary" onclick="mostrarVideos(this)">
Cargar más videos
</button>

</div>

</div>

<script>

function mostrarVideos(btn){

let videos=document.querySelectorAll(".video-extra");

videos.forEach(v=>{
v.style.display="block";
});

btn.style.display="none";

}

</script>

<%@ include file="/includes/footer.jsp" %>