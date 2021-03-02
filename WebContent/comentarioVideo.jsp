<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>    
    
    <br>
    <h3 id="iverComentarios">Comentarios de los usuarios.....</h3><br>
    <c:forEach var="i" items="${requestScope.comentario}">
		
    	<c:set var="comentario" value="${empty i.desC ? 'null' : i.desC}" />
    	<c:set var="fecha" value="${empty i.fechaC ? 'null' : i.fechaC}" />
    	<c:set var="usuario" value="${empty i.nomUsu ? 'null' : i.nomUsu}" />
    	
	
		<div  style="color:white">
			<b>${usuario} - publicado dia ${fecha}</b>
				<div align="left"><i>${comentario}</i></div>
		</div>
			<br>	
	</c:forEach>