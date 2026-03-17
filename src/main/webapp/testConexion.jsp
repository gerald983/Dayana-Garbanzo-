<%@ page import="java.sql.*" %>
<%@ include file="includes/DBConnection.jsp" %>

<html>
<head>
<title>Prueba de conexión</title>
</head>

<body>

<h2>Prueba de conexión</h2>

<%
if(connection != null){
    out.println("<p style='color:green;'>Conexión exitosa</p>");
}else{
    out.println("<p style='color:red;'>Error en la conexión</p>");
}
%>

</body>
</html>