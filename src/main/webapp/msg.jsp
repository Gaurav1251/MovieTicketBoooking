<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">


</style>
</head>

<body>

 <%

	  String msg = (String)request.getAttribute("msg");
	
		
	%>	
	<%
	if(msg!=null){
		
		
	
	%>

	<p class="h4"><%=msg %></p>
	
	
<%}%>
</body>
</html>