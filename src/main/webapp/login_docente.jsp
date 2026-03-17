<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ include file="includes/DBConnection.jsp" %>

<!DOCTYPE html>
<html lang="es">

<head>

<meta charset="UTF-8">
<title>Acceso Docente</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

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
background:rgba(255,255,255,0.08);
animation:flotar 10s infinite ease-in-out;
}

.b1{width:120px;height:120px;top:10%;left:15%;}
.b2{width:90px;height:90px;bottom:20%;left:10%;}
.b3{width:140px;height:140px;top:50%;right:10%;}
.b4{width:70px;height:70px;top:25%;right:30%;}

@keyframes flotar{
0%{transform:translateY(0)}
50%{transform:translateY(-25px)}
100%{transform:translateY(0)}
}

/* TARJETA */

.card{
border-radius:25px;
border:none;
background:rgba(255,255,255,0.95);
backdrop-filter:blur(10px);
animation:entrada .8s ease;
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

/* ICONO */

.icono{
font-size:55px;
}

/* TITULO */

.titulo{
font-weight:600;
color:#0d6efd;
}

/* INPUTS */

.form-control{
border-radius:12px;
padding:10px;
}

/* BOTON */

.btn-dark{
border-radius:30px;
padding:10px;
font-weight:500;
transition:.3s;
}

.btn-dark:hover{
transform:scale(1.05);
}

/* LETRAS DECORATIVAS */

.letra{
position:absolute;
font-size:110px;
color:rgba(255,255,255,0.15);
font-weight:bold;
}

.b{
top:10%;
left:5%;
}

.d{
bottom:10%;
right:5%;
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

<div class="col-md-4">

<div class="card shadow-lg">

<div class="card-body p-5">

<div class="text-center mb-3">

<div class="icono">👩‍🏫</div>

<h3 class="titulo">
Acceso Docente
</h3>

<p class="text-muted">
Panel de seguimiento académico
</p>

</div>

<form method="post">

<div class="mb-3">

<label class="form-label">Usuario</label>

<input type="text" name="usuario" class="form-control" required>

</div>

<div class="mb-3">

<label class="form-label">Contraseña</label>

<input type="password" name="password" class="form-control" required>

</div>

<div class="d-grid mt-4">

<button type="submit" class="btn btn-dark">
Ingresar al panel
</button>

</div>

</form>

<%

if(request.getMethod().equals("POST")){

String usuario = request.getParameter("usuario");
String password = request.getParameter("password");

PreparedStatement ps = connection.prepareStatement(
"SELECT * FROM docentes WHERE usuario=? AND password=?"
);

ps.setString(1,usuario);
ps.setString(2,password);

ResultSet rs = ps.executeQuery();

if(rs.next()){

session.setAttribute("docente",usuario);
response.sendRedirect("docente_inicio.jsp");

}else{

out.println("<p class='text-danger text-center mt-3'>Usuario o contraseña incorrectos</p>");

}

}

%>

</div>

</div>

</div>

</div>

</div>

</body>

</html>