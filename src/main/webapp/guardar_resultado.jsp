<%@ page import="java.sql.*" %>
<%@ include file="includes/DBConnection.jsp" %>

<%

String nombre = request.getParameter("nombre");
String juego = request.getParameter("juego");

int puntaje = Integer.parseInt(request.getParameter("puntaje"));

String eb = request.getParameter("errores_b");
String ed = request.getParameter("errores_d");

int erroresB = (eb != null) ? Integer.parseInt(eb) : 0;
int erroresD = (ed != null) ? Integer.parseInt(ed) : 0;

PreparedStatement ps = connection.prepareStatement(
"INSERT INTO resultados_juegos(nombre,juego,puntaje,errores_b,errores_d) VALUES (?,?,?,?,?)"
);

ps.setString(1,nombre);
ps.setString(2,juego);
ps.setInt(3,puntaje);
ps.setInt(4,erroresB);
ps.setInt(5,erroresD);

ps.executeUpdate();

%>