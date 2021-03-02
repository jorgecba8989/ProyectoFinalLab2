<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

	<c:forEach var="li" items="${requestScope.playList }">
	  		<c:set var="lista" value="${li.nomLista}" /> 
	  		<input type="hidden" id="ilisth" name="listh" value="${lista}">
	           <ul type="square" class="listadoT">
	                <li style="color:green;"><a href="#"  onclick="jUtils.mostrarPlaylist()"><span class="t">${lista}</span></a></li>                      	
	           </ul>        		
	</c:forEach>
	
