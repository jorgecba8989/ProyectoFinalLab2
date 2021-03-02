<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
       
	<c:forEach var="li" items="${requestScope.listadoP }" >
	 
		 <input type="hidden" id="ilinkvideoh" name="linkvideoh" value="">
		 <input type="hidden" id="inomListah" name="nomListah" value="">
	 
	  		<c:set var="cantante" value="${li.nomCantante}" /> 
	  		<c:set var="titulo" value="${li.tituloCancion}" /> 
	  		<c:set var="url" value="${li.urlCancion}" /> 
	  		<c:set var="like" value="${li.like}" /> 
	  		<c:set var="visita" value="${li.nro_visita}" />
	  		<c:set var="link_descarga" value="${li.link_descarga}" />  
	  		<c:set var="nro_lista" value="${li.nro_lista}" /> 
	  		<c:set var="nro_video" value="${li.nro_video}" /> 
	  		<c:set var="nomLista" value="${li.nomLista}" /> 
	  		
           <ul type="square">
                <li style="color:red;"  ><a href="#" onclick="jUtils.repVideo('${url}','${titulo}','${cantante}','${like}','${visita}','${link_descarga}')">${cantante} - ${titulo}</a>
                <a href="#" onclick="jUtils.eliminarVideo('${nro_video}','${nro_lista}')">[Eliminar]</a></li>               
            </ul>  
	</c:forEach>
	
	