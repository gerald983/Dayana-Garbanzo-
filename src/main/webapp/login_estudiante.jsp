<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ include file="includes/DBConnection.jsp" %>

<!DOCTYPE html>
<html lang="es">

<head>

<meta charset="UTF-8">
<title>Ingreso Estudiante</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

body{
font-family:'Poppins',sans-serif;
height:100vh;
display:flex;
align-items:center;
justify-content:center;
background:linear-gradient(135deg,#0d6efd,#4e9fff);
overflow:hidden;
}

/* BURBUJAS */

.burbuja{
position:absolute;
border-radius:50%;
background:rgba(255,255,255,0.1);
animation:flotar 10s infinite linear;
}

.b1{width:120px;height:120px;top:10%;left:10%;}
.b2{width:90px;height:90px;top:70%;left:20%;}
.b3{width:150px;height:150px;top:50%;right:10%;}
.b4{width:70px;height:70px;top:20%;right:30%;}

@keyframes flotar{
0%{transform:translateY(0)}
50%{transform:translateY(-30px)}
100%{transform:translateY(0)}
}

/* TARJETA */

.card{
border-radius:25px;
border:none;
background:rgba(255,255,255,0.95);
backdrop-filter:blur(10px);
animation:entrada 0.8s ease;
}

@keyframes entrada{
from{
opacity:0;
transform:translateY(40px);
}
to{
opacity:1;
transform:translateY(0);
}
}

/* TITULO */

.titulo{
font-weight:700;
color:#0d6efd;
}

/* ICONO */

.icono{
font-size:60px;
}

/* INPUTS */

.form-control{
border-radius:12px;
padding:10px;
}

/* BOTON */

.btn-primary{
border-radius:30px;
padding:10px;
font-weight:500;
background:linear-gradient(135deg,#0d6efd,#4e9fff);
border:none;
transition:0.3s;
}

.btn-primary:hover{
transform:scale(1.05);
}

/* LETRAS FLOTANTES */

.letra{
position:absolute;
font-size:120px;
color:rgba(255,255,255,0.15);
font-weight:bold;
animation:letras 8s infinite alternate;
}

.b{
top:15%;
left:5%;
}

.d{
bottom:10%;
right:5%;
}

@keyframes letras{
from{transform:translateY(0)}
to{transform:translateY(-40px)}
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

<div class="row justify-content-center">

<div class="col-md-5">

<div class="card shadow-lg">

<div class="card-body p-5">

<div class="text-center mb-3">

<div class="icono">🎓</div>

<h3 class="titulo">
Plataforma Educativa
</h3>

<p class="text-muted">
Aprende a diferenciar las letras <b>b</b> y <b>d</b> de forma interactiva
</p>

</div>

<form method="post">

<div class="mb-3">

<label class="form-label">Nombre</label>

<input type="text" name="nombre" class="form-control" required>

</div>

<div class="mb-3">

<label class="form-label">Apellidos</label>

<input type="text" name="apellidos" class="form-control" required>

</div>

<div class="d-grid mt-4">

<button type="submit" class="btn btn-primary">
Ingresar a la plataforma
</button>

</div>

</form>

<%

if(request.getMethod().equals("POST")){

String nombre = request.getParameter("nombre");
String apellidos = request.getParameter("apellidos");

PreparedStatement ps = connection.prepareStatement(
"INSERT INTO estudiantes(nombre,apellidos) VALUES (?,?)"
);

ps.setString(1,nombre);
ps.setString(2,apellidos);

ps.executeUpdate();

session.setAttribute("estudiante", nombre + " " + apellidos);

response.sendRedirect("index.jsp");

}

%>

</div>

</div>

</div>

</div>

</div>

</body>

</html>