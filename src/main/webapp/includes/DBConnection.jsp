<%@ page import="java.sql.*" %>

<%
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/plataforma_educativa?serverTimezone=America/Costa_Rica&useSSL=false";
String dbUser = "root";
String dbPassword = "";

Connection connection = null;

try {

    Class.forName(driver);
    connection = DriverManager.getConnection(connectionUrl, dbUser, dbPassword);

} catch (ClassNotFoundException e) {

    out.println("Error: Driver de MySQL no encontrado.");
    e.printStackTrace();

} catch (SQLException e) {

    out.println("Error de conexión a la base de datos.");
    e.printStackTrace();

}
%>