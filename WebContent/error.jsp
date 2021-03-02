<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
boolean fromAjax = request.getHeader("X-Requested-With") != null;
if(!fromAjax) {
%>    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" />
	<meta charset=ISO-8859-1 />
    <title>Reporte de Error</title>            
    <link type="text/css" rel="stylesheet" href="./css/style.css" />
</head>
<body>
	<div id="error">
<%
}
out.println(request.getAttribute("error"));
if(!fromAjax) { 
%>	
	</div>
</body>
</html>
<%
}
%>