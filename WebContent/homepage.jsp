<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
     <%@ taglib uri="/WEB-INF/tld/custom.tld" prefix="ct" %>
     <%@ page import="java.util.ArrayList, ar.edu.ubp.lab2.beans.ListadoVideo, ar.edu.ubp.lab2.beans.*" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Zto-Tube</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script defer type="text/javascript" src="./bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./bootstrap-4.1.3-dist/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
    <script type="text/javascript" src="./js/index.js"></script>
    <link rel="icon" type="image/png" href="./img/zto.png" />
    <link rel="stylesheet" type="text/css" href="./css/homepage.css" />	  
</head>
<body id="ihomepage">
	<div class="carousel slide" data-ride="carousel">  
		<div class="carousel-inner">  
	    	<div class="carousel-item active"> <img src="./img/fondo_Carusel_1.jpg"/> </div>  
	        <div class="carousel-item"> <img src="./img/fondo_Carusel_2.jpg"  /> </div>  
	        <div class="carousel-item"> <img src="./img/fondo_Carusel_3.jpg"  /> </div> 
	        <div class="carousel-item"> <img src="./img/fondo_Carusel_4.jpg"  /> </div>  
	        <div class="carousel-item"> <img src="./img/fondo_Carusel_5.jpg"  /> </div> 
	    </div>  
	</div>
	
	<form action="listadoVideos.jsp" method="post">
			<ct:busqueda/> 
	</form>
	
	<form action="verVideo.jsp" method="post" id="iform">
			<div class="row">
				<div class="col-md-2" >
					<c:set var="datoNick" value="${nick}"></c:set>
					<input type="hidden" id="idatoNickh" name="datoNickh" value="${datoNick}">
						<c:choose>
							<c:when test="${!empty datoNick }">
							<a href="#" onclick="jUtils.mostrarDatosUsu()" style="text-transform: uppercase">${datoNick}</a><a href="Logout.jsp" > (Desconectar)</a>
									<h3 id="iPlaylist">Playlist</h3>
										<div id="message"></div>
										<script type="text/javascript"> jUtils.mostrarLista(); </script> <!-- apenas ingrese una nueva lista, se refresque el listado completo -->
										<div id="iplaylistUsuario"></div> 
										<a href="#" id="iagregoL" onclick="jUtils.agregarLista()">Agregar nueva lista</a>
										
										<div class="d-none">			
											<input type="text" id="iagregoL2" name="agregoL2" class="form-control" > 
											<a href="#" id="iregistrarL" onclick="jUtils.registrarLista()">Agregar</a>&nbsp;&nbsp;
											<a href="#" id="icancelarL" onclick="jUtils.cancelarLista()">Cancelar</a>	
										</div>		
							</c:when>
							<c:otherwise>
								<a href="login.jsp">Iniciar Sesion</a>				
							</c:otherwise>
						</c:choose>
				</div>
				<div class="col-md-10" >
					<div class="container" >
						<div id="iverPlaylist"></div> 			
					</div>
					
					<div id="ioculResultados"> 
						<!-- 				Muestra los datos    -->
						<input type="hidden" id="icantante" name="cantante" value="">
					 	<input type="hidden" id="ititulo" name="titulo" value="">
					 	<input type="hidden" id="ilinkvideo" name="link" value="">
					 	<input type="hidden" id="ilikes" name="likes" value="">
					 	<input type="hidden" id="ivisitaV" name="visitaV" value="">
					 	<input type="hidden" id="idescargah" name="descargah" value="">
					 	
							 <c:forEach var="i" items="${requestScope.listado}" >
							 	<c:set var="titulo" value="${empty i.titulo ? 'null' : i.titulo}" />
					    		<c:set var="cantante" value="${empty i.cantante ? 'null' : i.cantante}" />
					    		<c:set var="url" value="${empty i.link ? 'null' : i.link}"></c:set>
					    		<c:set var="imagen" value="${empty i.img ? 'null' : i.img}"></c:set>
					    		<c:set var="like" value="${empty i.like ? 'null' : i.like}"></c:set>
					    		<c:set var="visita" value="${empty i.visto ? 'null' : i.visto}"></c:set>
					    		<c:set var="link_descarga" value="${empty i.link_descarga ? 'null' : i.link_descarga}"></c:set> 
									<div class="myvideo" id="imyvideo">
									        <ul>
									            <li> 					            
													<div class="card-deck" style="width: 16rem; height: 21rem;">
  														<div class="card border-light  mb-3">
												    		<a href="#" onclick="jUtils.repVideo('${url}','${titulo}','${cantante}','${like}','${visita}','${link_descarga}')">	 
												    		<img  class="card-img-top" src="${imagen}"  width="200" height="200" style="object-fit: cover;">  
												    			<div class="card-body"><div class="card-text text-info">${titulo} - ${cantante}</div></div></a>
										    			</div>
										    		 </div>	
										    		<br><br>					    			 
												 </li>
									        </ul>
									</div>
							 </c:forEach>
					</div>		
				</div>		
			</div>
	</form>
</body>
</html>