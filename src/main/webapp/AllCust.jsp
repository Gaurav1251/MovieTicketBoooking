<%@page import="com.movie.pojo.Customer"%>
<%@page import="java.time.format.FormatStyle"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.List"%>
<%@page import="com.movie.pojo.Movie"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- <script src="https://cdn.lordicon.com/bhenfmcm.js"></script> -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="js/jq.js"></script>
<script type="text/javascript">
function size(a){
	if (a>400) {
		$(".bot").css("position","static");
	}
	

	}



$(document).ready(function () {
	
	size($(".moviecontainer").height());
})
</script>


<style type="text/css">
/* body{
background-image: url("images/cust1.jpeg");
background-repeat: no-repeat;
background-size: 100vw 100vh;
background-position: center center;


} */
.container.bg-white {
	box-shadow: 2px 2px 10px 0px grey;
	border-radius: 20px;
background-image:linear-gradient(to bottom right,wheat,white,wheat,white);
	height: max-content;
	width: max-content;
	
}
.bot{
bottom: 0;
position:absolute;
width: 100%;
}
tr:first-child th{
	top: 0;
	border-right:0.5mm solid white;
	border-left:0.5mm solid  white;
	border-bottom:1px solid white;
	/* position: sticky; */
	background: #e0e0b6;
	color: black;
}

.moviecontainer {

	 /* overflow-y:scroll;  */
	height: auto;
	
	width: max-content;
}
/*  .moviecontainer::-webkit-scrollbar {
    display: none;
} */
th, td, tr {
	border-right-style: ridge;
	border-right-width: 0.4mm;
	border-left-width: 0.4mm;
	border-left-style: ridge;
	
	text-align: center;
	margin: auto;
	width: max-content;
	
}

tr:hover:not(:first-child) td{

	background: #aba6f7;
	font-weight: 500;
	
}
/* table:hover tr{

}
table tr:hover{
filter:blur(0px);
}
 */
tr:nth-child(even) td {
	background: #e4f5e9;
	
}

tr:nth-child(odd) td {
	background: #b0e3e8;
}
#up:hover{
	box-shadow: 1px 1px 6px 0px black;
	
	
}
#del:hover{
	box-shadow: 1px 1px 6px 0px black;
	
}

</style>
</head>
<body>
	<%
	List<Customer> cl = (List<Customer>) session.getAttribute("cl");
	%>
		<%
							String user=(String) session.getAttribute("user");
							String admin=(String) session.getAttribute("Admin");
							
							%>
	<jsp:include page="header.jsp"></jsp:include>
	<section class="py-5">

		<div class="container bg-white">


			<div class="moviecontainer">
				<div class="container">
					<jsp:include page="msg.jsp"></jsp:include>

					<table class="table table-responsive" id="mytable">

						<tr>
							<!-- <th> Movie Id </th> -->
							<th>First  Name</th>
							<th>Last Name</th>
							<th>Email Id</th>


							<th>Contact No</th>
							<th>Address</th>
							
						</tr>

						<%
						if (cl != null) {
							for (Customer c : cl) {
						%>
						<tr id="val">

							<%-- <td><%= m.getMovieId() %></td> --%>
							<td><%=c.getFirstName()%></td>
							<td><%=c.getLastName()%></td>
							<td><%=c.getEmailId()%></td>
							
							<td><%=c.getContact()%></td>
							<td><%=c.getAddress()%></td>
						
							
								
						</tr>

						<%
						}
						}
						%>












					</table>





				</div>

			</div>

		</div>

	</section>
		<div class="bot">
	<jsp:include page="footer.jsp"></jsp:include>
</div>

</body>
</html>