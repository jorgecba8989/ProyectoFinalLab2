<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
         <%@ page import="java.util.ArrayList, ar.edu.ubp.lab2.beans.UsuarioBean" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Zto-Tube - Login</title>
	<script defer type="text/javascript" src="./bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./bootstrap-4.1.3-dist/css/bootstrap.min.css" />
    <script type="text/javascript" src="./js/jquery.js"></script>  
    <script type="text/javascript" src="./js/index.js"></script>
    <link rel="icon" type="image/png" href="./img/zto.png" />
    <link rel="stylesheet" type="text/css" href="./css/homepage.css" />	
</head>
<body class="container"  id="isesion">
	<div class="login-box">
      <img src="img/zto.png" class="avatar">
	      <h1>Loguearse</h1>
		      <form action="Login.jsp" method="get">
			        <label for="iusuario">Usuario</label>
			        <input type="text" id="ialias" name="alias" placeholder="Ingrese su alias" class="form-control" required >
			        <label for="icontra">Contraseña</label>
			        <input type="password" id="icontra" name="contra" placeholder="Ingrese su clave" class="form-control" required >
		        	<input type="submit"  value="Acceder">
		    		<a href="formRegistro.jsp">No tienes cuenta?</a>  		
		      </form>   
    </div>       
    <div id="footer">
  		 <p>Copyright &copy; 2021 zto.today All rights reserved</p>
	</div> 
</body>
</html>