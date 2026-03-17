<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String currentPage = request.getRequestURI();
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Plataforma Educativa – Grafías b y d</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Fuente -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Iconos -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<style>

body{
font-family:'Poppins',sans-serif;
background:linear-gradient(135deg,#f5f7fb,#e9f1ff);
margin:0;
overflow-x:hidden;
}

/* NAVBAR MODERNO */

.navbar{
backdrop-filter:blur(15px);
background:rgba(13,110,253,0.75);
box-shadow:0 10px 30px rgba(0,0,0,0.15);
transition:all .3s ease;
padding:10px 0;
}

.navbar.scrolled{
background:rgba(13,110,253,0.95);
box-shadow:0 6px 20px rgba(0,0,0,0.2);
}

.navbar-brand{
font-weight:700;
font-size:1.3rem;
letter-spacing:1px;
}

.nav-link{
color:white !important;
font-weight:500;
border-radius:25px;
padding:6px 16px;
transition:all .3s ease;
}

.nav-link:hover{
background:rgba(255,255,255,0.25);
transform:translateY(-2px);
}

.nav-link.active{
background:white;
color:#0d6efd !important;
font-weight:600;
}

/* HERO */

.hero{
position:relative;
background:linear-gradient(135deg,#0d6efd,#4e9fff);
color:white;
padding:150px 0 180px 0;
text-align:center;
overflow:hidden;
}

.hero h1{
font-size:2.8rem;
font-weight:700;
animation:fadeUp 1s ease forwards;
}

.hero p{
font-size:1.2rem;
font-weight:300;
margin-top:15px;
animation:fadeUp 1.3s ease forwards;
}

/* Onda */

.wave{
position:absolute;
bottom:-40px;
left:0;
width:100%;
z-index:1;
}

/* CONTENIDO */

.contenido{
padding:80px 0;
animation:fadeIn 1s ease;
}

/* TARJETAS */

.card{
border:none;
border-radius:25px;
background:rgba(255,255,255,0.85);
backdrop-filter:blur(10px);
transition:.4s;
}

.card:hover{
transform:translateY(-10px);
box-shadow:0 20px 40px rgba(0,0,0,0.15);
}

/* BOTONES */

.btn{
border-radius:30px;
padding:8px 22px;
font-weight:500;
transition:.3s;
}

.btn-primary{
background:linear-gradient(135deg,#0d6efd,#4e9fff);
border:none;
}

.btn-primary:hover{
transform:scale(1.05);
}

/* ANIMACIONES */

@keyframes fadeUp{
from{
opacity:0;
transform:translateY(40px);
}
to{
opacity:1;
transform:translateY(0);
}
}

@keyframes fadeIn{
from{opacity:0;}
to{opacity:1;}
}

</style>

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
<div class="container">

<a class="navbar-brand" href="index.jsp">
<i class="bi bi-mortarboard-fill"></i>
Plataforma Educativa
</a>

<button class="navbar-toggler" type="button"
data-bs-toggle="collapse"
data-bs-target="#navbarNav">
<span class="navbar-toggler-icon"></span>
</button>

<div class="collapse navbar-collapse justify-content-end" id="navbarNav">

<ul class="navbar-nav gap-2">

<%
String docente = (String) session.getAttribute("docente");
String estudiante = (String) session.getAttribute("estudiante");

/* =========================
   MENU PARA ESTUDIANTES
   ========================= */
if(estudiante != null){
%>

<li class="nav-item">
<a class="nav-link <%= currentPage.contains("index.jsp") ? "active" : "" %>" href="index.jsp">Inicio</a>
</li>

<li class="nav-item">
<a class="nav-link <%= currentPage.contains("videos.jsp") ? "active" : "" %>" href="videos.jsp">Videos</a>
</li>

<li class="nav-item">
<a class="nav-link <%= currentPage.contains("juegos.jsp") ? "active" : "" %>" href="juegos.jsp">Juegos</a>
</li>

<li class="nav-item">
<a class="nav-link <%= currentPage.contains("animaciones.jsp") ? "active" : "" %>" href="animaciones.jsp">Animaciones</a>
</li>

<li class="nav-item">
<a class="nav-link" href="logout.jsp">Cerrar sesión</a>
</li>

<%
}

/* =========================
   MENU PARA DOCENTES
   ========================= */
if(docente != null){
%>

<li class="nav-item">
<a class="nav-link <%= currentPage.contains("docente_inicio.jsp") ? "active" : "" %>" href="docente_inicio.jsp">Área Docente</a>
</li>

<li class="nav-item">
<a class="nav-link <%= currentPage.contains("panel_docente.jsp") ? "active" : "" %>" href="panel_docente.jsp">Panel</a>
</li>

<li class="nav-item">
<a class="nav-link <%= currentPage.contains("material_docente.jsp") ? "active" : "" %>" href="material_docente.jsp">Material</a>
</li>

<li class="nav-item">
<a class="nav-link" href="logout.jsp">Cerrar sesión</a>
</li>

<%
}
%>

</ul>

</div>
</div>
</nav>



<div class="container contenido">

<script>

window.addEventListener("scroll",function(){
let nav=document.querySelector(".navbar");

if(window.scrollY>30){
nav.classList.add("scrolled");
}else{
nav.classList.remove("scrolled");
}

});

</script>