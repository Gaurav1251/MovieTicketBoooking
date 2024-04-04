<%@page import="com.movie.dao.MovieDaoImpl"%>
<%@page import="com.movie.pojo.Movie"%>
<%@page import="java.util.List"%>
<%@page import="com.movie.pojo.Show"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function ctype() {
	var x=document.getElementById("type");
	
	var y=document.getElementById("type1").value;
	x.value=y;
	
	}
</script>
<style type="text/css">
#star {
	color: red;
}

td, th {
	text-align: center;
}

#time {
	width: max-content;
}

/* tr:nth-child(5) td {
text-align: left;

} */
tr:last-child {
	text-align: center;
}

th[rowspan]:not([rowspan="1"]) {
	vertical-align: middle;
}

.container.bg-white {
	box-shadow: 1px 1px 8px 0px black;
	border-radius: 20px;
	width: 720px;
}

input {
	width: 20%;
}
input:hover{
box-shadow:0.2mm 0.22mm 0.3mm 0mm black;

}
select:hover{
	box-shadow:0.2mm 0.22mm 0.3mm 0mm black;
	
}
#select {
	justify-content: flex-start;
	text-align: left;
}

select {
	width: 80%;
}
</style>
</head>
<body>
	<%
								
								List<Movie> al=new MovieDaoImpl().getAllMovies();
								pageContext.setAttribute("all", al,pageContext.PAGE_SCOPE);
								%>
	<jsp:include page="header.jsp"></jsp:include>
	<section class="py-5">

		<div class="container bg-white">


			<div class="moviecontainer">
				<div class="container">
					<jsp:include page="msg.jsp"></jsp:include>


					<form action="showServe" method="post">
						<input type="hidden" name="process" value="Addshow">
						<table class="table">
							
							<tr>
								<th>Movie Name :</th>

								<td id="select"><select name="show_MovieId" class="form-control form-select form-control-sm">

										<c:forEach var="m" items="${all}">
											<option value="${m.movieId }">${m.movieName }</option>
										</c:forEach>

								</select></td>
								<%-- <td><input class="form-control form-control-sm" type="text" name="movieName" value="${showobj.showMovie.movieName }" required="required"  readonly="readonly"></td>
  --%>
								<td><sup><span id="star">*</span></sup></td>
							</tr>
							<tr>
								<th>Theater :</th>
								<td><input class="form-control form-control-sm" type="text"
									name="theatreName_loc" 
									required="required" autofocus="autofocus"></td>
								<td><sup><span id="star">*</span></sup></td>

							</tr>
							<tr>
								<th>Date :</th>
								<td><input class="form-control form-control-sm" type="date"
									name="showDate" 	required="required"></td>
								<td><sup><span id="star">*</span></sup></td>

							</tr>
							<tr>
								<th>Time :</th>
								<td style="text-align: left;border-radius: 20px;">From- <input type="time" 
									name="startTime"
									style="margin-right: 30px"> To- <input type="time"
									name="endTime" ></td>



								<td><sup><span id="star">*</span></sup></td>

							</tr>
							<tr>
								<th>Screen_No :</th>
								<td><input class="form-control form-control-sm" type="text"
									name="screnn_no"
									required="required"></td>
								<td><sup><span id="star">*</span></sup></td>

							</tr>
							<tr>
								<th class="type">Show Type :</th>
								<td>
									 
									<select  class="form-control form-select form-control-sm" name="show_Type" id="type1"  style="height: max-content">
										<option> Click to Change</option>
										<option value="Morning">Morning</option>
										<option value="AfterNoon">AfterNoon</option>
										<option value="Evening">Evening</option>
										<option value="Night">Night</option>
									
								</select></td>
								<td><sup><span id="star">*</span></sup></td>

							</tr>							

							<tr>
								<th>Price :</th>
								<td><input class="form-control form-control-sm" type="text"
									name="price"  required="required"></td>
								<td><sup><span id="star">*</span></sup></td>

							</tr>
							<tr>
								<th><button type="reset" class=" btn btn-dark">
										<i class="fa-solid fa-rotate"></i> Reset
									</button></th>
								<th>
									<button class=" btn btn-primary">
										<i class="fa-solid fa-plus"></i> Add Show
									</button>
								</th>

							</tr>
						</table>

					</form>





				</div>

			</div>

		</div>

	</section>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>