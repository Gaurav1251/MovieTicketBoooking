<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="data:,">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
td {
	text-align: center;
}
</style>
<link rel="icon" href="images/logo.png">
<link rel="icon" href="data:,">
<script src="js/jq.js"></script>
<script type="text/javascript">
	
	
	$(document).ready(function () {

		setTimeout(() => {
			window.onload = function() {
			    //considering there aren't any hashes in the urls already
			    if(!window.location.hash) {
			        //setting window location
			        window.location = window.location;
			        //using reload() method to reload web page
			        window.location.reload();
			    }
			}
		}, 1100);
	});
</script>
</head>
<body>
	<%
	Cookie[] ck = request.getCookies();
	session = request.getSession(false);
	if (ck != null && request.isRequestedSessionIdValid() && session != null) {
		for (Cookie c : ck) {
			if (c.getName().equals("user") && request.isRequestedSessionIdValid() && session != null) {

		response.sendRedirect("dash.jsp");

			}

		}

	}
	%>
	<form action="log_sign" method="post">

		<table>
			<tr>

				<td>UserName:</td>
				<td><input type="text" name="user" required></td>
			</tr>
			<tr>

				<td>Password:</td>
				<td><input type="text" name="pass" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button>Submit</button>
				</td>
			</tr>
		</table>

	</form>
</body>
</html>