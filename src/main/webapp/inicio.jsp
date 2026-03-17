<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">

<head>

<meta charset="UTF-8">
<title>Plataforma Educativa</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

body{
font-family:'Poppins',sans-serif;
background:linear-gradient(135deg,#0d6efd,#4e9fff);
height:100vh;
display:flex;
align-items:center;
justify-content:center;
overflow:hidden;
}

/* BURBUJAS */

.burbuja{
position:absolute;
border-radius:50%;
background:rgba(255,255,255,0.08);
animation:flotar 10s infinite ease-in-out;
}

.b1{width:120px;height:120px;top:10%;left:10%;}
.b2{width:80px;height:80px;bottom:15%;left:20%;}
.b3{width:140px;height:140px;top:50%;right:10%;}
.b4{width:60px;height:60px;top:20%;right:25%;}

@keyframes flotar{
0%{transform:translateY(0)}
50%{transform:translateY(-25px)}
100%{transform:translateY(0)}
}

/* LETRAS */

.letra{
position:absolute;
font-size:130px;
color:rgba(255,255,255,0.15);
font-weight:bold;
}

.b{top:15%;left:5%;}
.d{bottom:10%;right:5%;}

/* TARJETAS */

.card-opcion{
padding:45px;
border-radius:25px;
transition:.3s;
border:none;
background:rgba(255,255,255,0.95);
backdrop-filter:blur(10px);
}

.card-opcion:hover{
transform:translateY(-8px);
box-shadow:0 20px 40px rgba(0,0,0,0.2);
}

.btn-lg{
border-radius:30px;
padding:10px 25px;
}

.titulo{
font-weight:700;
}

</style>

</head>

<body>

<div class="burbuja b1"></div>
<div class="burbuja b2"></div>
<div class="burbuja b3"></div>
<div class="burbuja b4"></div>

<div class="letra b">b</div>
<div class="letra d">d</div>

<div class="container">

<div class="text-center text-white mb-5">

<h1 class="titulo">
Plataforma Educativa
</h1>

<p class="lead">
Aprendizaje interactivo de las grafías <b>b</b> y <b>d</b>
</p>

</div>

<div class="row justify-content-center">

<!-- ESTUDIANTE -->

<div class="col-md-4 mb-4">

<div class="card card-opcion shadow text-center">

<div class="card-body">

<h3 class="mb-3">
👨‍🎓 Estudiante
</h3>

<p>
Accede a juegos interactivos y actividades
para aprender las letras <b>b</b> y <b>d</b>.
</p>

<a href="login_estudiante.jsp" class="btn btn-primary btn-lg">
Ingresar
</a>

</div>

</div>

</div>

<!-- DOCENTE -->

<div class="col-md-4 mb-4">

<div class="card card-opcion shadow text-center">

<div class="card-body">

<h3 class="mb-3">
👩‍🏫 Docente
</h3>

<p>
Accede al panel de seguimiento
y al material pedagógico.
</p>

<a href="login_docente.jsp" class="btn btn-success btn-lg">
Ingresar
</a>

</div>

</div>

</div>

</div>

</div>

</body>

</html>