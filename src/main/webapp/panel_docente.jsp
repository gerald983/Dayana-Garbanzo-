<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="includes/DBConnection.jsp" %>

<div class="container mt-5">

<div class="text-center mb-5">

<h2 class="fw-bold text-primary">
📊 Panel de Resultados del Docente
</h2>

<p class="text-muted">
Análisis del desempeño de los estudiantes en los juegos educativos
</p>

</div>

<div class="card shadow p-4">

<h4 class="mb-4">
Resultados de los juegos
</h4>

<div class="table-responsive">

<table class="table table-hover align-middle">

<thead class="table-primary">

<tr>
<th>ID</th>
<th>Estudiante</th>
<th>Juego</th>
<th>Puntaje</th>
<th>Error B</th>
<th>Error D</th>
<th>Fecha</th>
</tr>

</thead>

<tbody>

<%

Statement st = connection.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM resultados_juegos ORDER BY id DESC");

while(rs.next()){

%>

<tr>

<td><%= rs.getInt("id") %></td>

<td>
👨‍🎓 <%= rs.getString("nombre") %>
</td>

<td>
<span class="badge bg-primary">
<%= rs.getString("juego") %>
</span>
</td>

<td>
<span class="badge bg-success">
<%= rs.getInt("puntaje") %>
</span>
</td>

<td class="text-danger fw-bold">
<%= rs.getInt("errores_b") %>
</td>

<td class="text-danger fw-bold">
<%= rs.getInt("errores_d") %>
</td>

<td>
<%= new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm").format(rs.getTimestamp("fecha")) %>
</td>

</tr>

<%

}

%>

</tbody>

</table>

</div>

</div>

</div>

<%@ include file="/includes/footer.jsp" %>