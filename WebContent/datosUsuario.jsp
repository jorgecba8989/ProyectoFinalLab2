<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Zto-Tube Datos del Usuario</title>
	<script defer type="text/javascript" src="./bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./bootstrap-4.1.3-dist/css/bootstrap.min.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
    <script type="text/javascript" src="./js/index.js"></script>
    <link rel="icon" type="image/png" href="./img/zto.png" />
    <link rel="stylesheet" type="text/css" href="./css/homepage.css" />	  
</head>
<body class="container" id="iDatosUsuario">
	<c:forEach var="i" items="${requestScope.usuario}">
			<c:set var="nomUsu" value="${empty i.nomUsuario ? 'null' : i.nomUsuario}" />
			<c:set var="apellidoUsu" value="${empty i.apellidoUsuario ? 'null' : i.apellidoUsuario}"></c:set>
			<c:set var="claveUsu" value="${empty i.claveUsuario ? 'null' : i.claveUsuario}" />
			<c:set var="veriClaveUsu" value="${empty i.veriClaveUsuario ? 'null' : i.veriClaveUsuario}"></c:set>
			<c:set var="emailUsu" value="${empty i.emailUsuario ? 'null' : i.emailUsuario}" />
			<c:set var="aliasUsu" value="${empty i.aliasUsuario ? 'null' : i.aliasUsuario}"></c:set>
			
			
	<h3 id="inomUsuario">Usuario ${aliasUsu}</h3>
	<form  id="iformR" action="#" method="post">
		<div class="row">
			<div class="col-12 col-md-6 mb-3">
				<label for="iapellido">Apellido</label>
				<input type="text" id="iapellido" name="apellido" class="form-control" required placeholder="Ingresa tu apellido" value="${apellidoUsu }" maxlength="100">
			</div>
			<div class="col-12 col-md-6 mb-3">
				<label for="inombre">Nombre</label>
				<input type="text" id="inombre" name="nombre" class="form-control" required placeholder="Ingresa tu nombre" value="${nomUsu }" maxlength="255">
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-md-6 mb-3">
				<label for="iemail">E-mail</label>
				<input type="email" id="iemail" name="email" class="form-control" required placeholder="Ingresa tu e-mail" value="${emailUsu }" maxlength="255">
			</div>
			<div class="col-12 col-md-3 mb-3">
				<label for="iclave">Ingrese Clave</label>
				<input type="password" id="iclave" name="clave" class="form-control" required placeholder="Ingresa una clave" value="${claveUsu }" maxlength="32">
			</div>
			<div class="col-12 col-md-3 mb-3">
				<label for="iconfirmar_clave">Repetir Clave</label>
				<input type="password" id="iconfirmar_clave" class="form-control" name="confirmar_clave" required placeholder="Repite la clave" value="${veriClaveUsu }" maxlength="32">
			</div>
		</div>

		<div class="row">
			<div class="col-12">
					<input type="button" name="actualizar" onclick="jUtils.actualizarDatos()" class="btn btn-primary mb-2" value="Actualizar datos">
					<button type="button" name="cancelar" onclick="jUtils.cancelar()" class="btn btn-danger mb-2">Cancelar</button>
			</div>
		</div>
		
	</form>
	</c:forEach>
</body>
</html>