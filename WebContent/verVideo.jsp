<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
     <%@ taglib uri="/WEB-INF/tld/custom.tld" prefix="ct" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${param.cantante } - ${param.titulo}</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script defer type="text/javascript" src="./bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./bootstrap-4.1.3-dist/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
    <script type="text/javascript" src="./js/index.js"></script>
    <link rel="icon" type="image/png" href="./img/zto.png" />
    <link rel="stylesheet" type="text/css" href="./css/homepage.css" />	  	
</head>
<body id="iverVideo" >
	<form action="listadoVideos.jsp" method="post">
			<ct:busqueda/> 
	</form>
	
	<!-- los values son los names de los input hidden que vienen del index -->
		<c:set var="link" 		value="${param.link}"></c:set>
		<c:set var="titulo" 	value="${param.titulo}"></c:set>
		<c:set var="cantante"	value="${param.cantante}"></c:set>
		<c:set var="likes"		value="${param.likes}"></c:set>
		<c:set var="vista"		value="${param.visitaV}"></c:set>
		<c:set var="descarga"	value="${param.descargah}"></c:set> 
		
		
		<br><br>
		
		<div class="container"> 			
			<div class="row"> 
				<div class="col-4 col-md-8">
					<p><strong>${titulo}&nbsp;-&nbsp;${cantante}</strong></p>
					<iframe width="750" height="415" src="${link}"> </iframe>
				</div>
				<div class="col-4 col-md-4">		
					<div class="wrapper" >	
				   			<c:choose>
								<c:when test="${!empty nick}">								    
						<!-- 	        <input type="text" id="iagregoVideoLista" name="nombreLista" required >
							        <label for="nombreLista">
							            <span>Nombre de la lista</span>
							        </label>   -->
							    	<select class="custom-select" name="playlist" id="myplaylist" onchange="jUtils.guardarVideo(this)">
							    	<option value="-1">Selecciona tu lista</option>
							    	  	<c:forEach var="li" items="${paramValues.listh }">  										
									  			<option value="${li}">"${li}"</option>									  			
										</c:forEach>		
									</select>  
  				  </div> 		
	
				  <br><br><br><br>
	
									<input type="hidden" id="ilikesh" name="likesh" value="${likes}">
									<input type="hidden" id="ivisitaVh" name="visitaVh" value="${vista}">								
							<!-- 		<a href="#" onclick="jUtils.likePositivo();"><img src="./img/like.png" width="20" height="20"/></a>&nbsp;&nbsp;<span style="color:white;margin-right:40px">${likes}</span> -->
									<img src="./img/visto.png" width="20" height="20"/>&nbsp;&nbsp;<span style="color:white;">${vista}</span>
									<br><br>
									<a href="${descarga}">Descargar MP3</a> 	
								</c:when>
								<c:otherwise>
										<a href="login.jsp">Debes iniciar sesion para agregar el video a tu lista, dar like o comentar</a>	
								</c:otherwise>
						</c:choose>
				</div>
			</div>
		<br>
		<div class="row container">
			<div class="col-sm-12">
						<c:set var="nick" value="${nick}"></c:set>
							<input type="hidden" id="idatoNickh" name="datoNickh" value="${nick}">
							<input type="hidden" id="idatoUrl" name="datoUrl" value="${link}">		
								<c:choose>
									<c:when test="${!empty nick }">
										<h3 id="iagregarComentario">Agregar un comentario</h3><br>
											<div class="row">
												<textarea rows="5" cols="150" id="idescripcion" name="descripcion" placeholder="¿En que estas pensando?"></textarea>
											</div>
											<br>
											<div class="col-sm" align ="right">
												<button class="btn btn-primary"  onclick="jUtils.agregarComentario();">Comentar</button>
											</div>
											<div id="iagregaComentario"></div>
									</c:when>								
								</c:choose>
							<script type="text/javascript"> jUtils.contarVisitas(); </script>
							<script type="text/javascript"> jUtils.mostrarComentario(); </script>							
						<div id="imostrarComentarios"></div>
			</div>
		</div>	
	</div>		
</body>
</html>