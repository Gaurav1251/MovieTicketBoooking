<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="icon" href="data:,">
<link rel="icon" href="images/logo.png">
</head>
<body>
<%
session=request.getSession(false);
if(request.isRequestedSessionIdValid() && session != null){
	String msg = (String) session.getAttribute("user");
	
	Cookie [] ck=request.getCookies();
	if(ck!=null){
	for(Cookie c:ck){
		if(c.getName().equals("user")){
			session.setAttribute("msg", c.getValue());
		}
	}}
	}%>

<%
if(session.getAttribute("msg")!=null)
{%>

<h1>welcome ${msg }</h1>
	<a href="log_sign?p=log">Logout</a>

<%
}
else{
	response.sendRedirect("home.jsp");
}
%>





</body>
</html>