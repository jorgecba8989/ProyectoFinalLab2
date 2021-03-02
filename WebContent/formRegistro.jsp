<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Zto-Tube - Registrarse</title>
	<script defer type="text/javascript" src="./bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
    <script defer type="text/javascript" src="./bootstrap-4.1.3-dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./bootstrap-4.1.3-dist/css/bootstrap.min.css" />
	<script type="text/javascript" src="./js/jquery.js"></script>
	<script type="text/javascript" src="./js/index.js"></script>
	<link rel="icon" type="image/png" href="./img/zto.png" />
	<link rel="stylesheet" type="text/css" href="./css/homepage.css" />
</head>
<body class="container" id="iformRegistro">
	<h3 id="itituloformRegistro">Formulario de carga de datos</h3>
	<form  id="iformR" action="#" method="post">
	<div id="message"></div>
		<div class="row">
			<div class="col-12 text-center text-md-left"><b>Datos Personales</b></div>
		</div>
		<div class="row">
			<div class="col-12 col-md-6 mb-3">
				<label for="iapellido">Apellido</label>
				<input type="text" id="iapellido" name="apellido" class="form-control" required placeholder="Ingresa tu apellido" value="" maxlength="100">
			</div>
			<div class="col-12 col-md-6 mb-3">
				<label for="inombre">Nombre</label>
				<input type="text" id="inombre" name="nombre" class="form-control" required placeholder="Ingresa tu nombre" value="" maxlength="255">
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-md-6 mb-3">
				<label for="iemail">E-mail</label>
				<input type="email" id="iemail" name="email" class="form-control" required placeholder="Ingresa tu e-mail" value="" maxlength="255">
			</div>
			<div class="col-12 col-md-3 mb-3">
				<label for="iclave">Ingrese Clave</label>
				<input type="password" id="iclave" name="clave" class="form-control" required placeholder="Ingresa una clave" value="" maxlength="32">
			</div>
			<div class="col-12 col-md-3 mb-3">
				<label for="iconfirmar_clave">Repetir Clave</label>
				<input type="password" id="iconfirmar_clave" class="form-control" name="confirmar_clave" required placeholder="Repite la clave" value="" maxlength="32">
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-md-12 mb-3">
				<label for="iapellido">Alias</label>
				<input type="text" id="ialias" name="alias" class="form-control" required placeholder="Ingresa tu alias" value="" maxlength="100">
			</div>		
		</div>
		<div class="row">
			<div class="col-12">
					<input type="button" name="registrar" onclick="jUtils.registrarUsuario()" class="btn btn-primary mb-2" value="Registrarme">
					<button type="reset" class="btn btn-danger mb-2">Limpiar formulario</button>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<a href="./login.jsp">Volver a la pagina Login</a>
			</div>
		</div>
	</form>
</body>
</html>