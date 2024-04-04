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
	background-image: linear-gradient(to bottom right, wheat, white, wheat, white);
	height: max-content;
	width: max-content;
}

tr:first-child th {
	top: 0;
	border-right: 0.5mm solid white;
	border-left: 0.5mm solid white;
	border-bottom: 1px solid white;
	/* position: sticky; */
	background: #e0e0b6;
	color: black;
}
.moviecontainer::-webkit-scrollbar {
    display: none;
}
.moviecontainer {
	height: auto;
	overflow-y:scroll; 
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

tr:hover:not(:first-child) td {
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

.bot{
	bottom: 0;
	position: absolute;
	width: 100%;
}

tr:nth-child(odd) td {
	background: #b0e3e8;
}

#up:hover {
	box-shadow: 1px 1px 6px 0px black;
}

#del:hover {
	box-shadow: 1px 1px 6px 0px black;
}
</style>
</head>
<body>
	<%
	List<Movie> al = (List<Movie>) session.getAttribute("al");
	%>
	<%
							String user=(String) session.getAttribute("user");
							String admin=(String) session.getAttribute("Admin");
							if(admin==null && user==null){
								request.setAttribute("msg", "Please Login For Better Experiance...");
							}
							
							
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
							<th>Movie Name</th>
							<th>Movie Director</th>
							<th>Movie Producer</th>


							<th>Movie Writer</th>
							<th>Movie Cast</th>
							<th>Movie Release Date</th>
							<%
							if(admin!=null || user!=null){
							%>
							<th colspan="3">Action</th>
							<%} %>
						</tr>

						<%
						if (al != null) {
							for (Movie m : al) {
						%>
						<tr id="val">

							<%-- <td><%= m.getMovieId() %></td> --%>
							<td><%=m.getMovieName()%></td>
							<td><%=m.getDirector()%></td>
							<td><%=m.getProducer()%></td>
							<td><%=m.getWriter()%></td>
							<td><%=m.getCast()%></td>
							<td><%=m.getReleaseDate().format(DateTimeFormatter.ofLocalizedDate(FormatStyle.MEDIUM))%></td>

							<%
							if(admin!=null){
							
							%>

							<td><a class="btn btn-primary" id="up"
								href="movieServe?process=update&movieId=<%=m.getMovieId()%>"><i
									class="fa-regular fa-pen-to-square"></i> Update</a></td>
							<td><a class="btn btn-danger" id="del"
								href="movieServe?process=delete&movieId=<%=m.getMovieId()%>"
								onclick="return confirm('Are You Sure ,You Want to Delete this Movie ? ')"><i
									class="fa-solid fa-trash-can"></i> Delete</a></td>
							<%} %>
							<%
							if(user!=null ||admin!=null){
							
							%>
							<td><a class="btn btn-primary" id="up"
								href="showServe?process=getshow&movieId=<%=m.getMovieId()%>"><i
									class="fa-solid fa-masks-theater"></i> Show's</a></td>
							<%} %>
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