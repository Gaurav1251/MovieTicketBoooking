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
								
								List<Movie> al=(List<Movie>) session.getAttribute("al");
								
								%>
	<jsp:include page="header.jsp"></jsp:include>
	<section class="py-5">

		<div class="container bg-white">


			<div class="moviecontainer">
				<div class="container">
					<jsp:include page="msg.jsp"></jsp:include>


					<form action="showServe" method="post">
						<input type="hidden" name="process" value="editshow">
						<table class="table">
							<tr>
								<th>Show Id :</th>
								<td><input class="form-control form-control-sm" type="text"
									name="showId" required="required" readonly="readonly"
									value="${showobj.showId }"></td>
								<td><sup><span id="star">*</span></sup></td>

							</tr>
							<tr>
								<th>Movie Name :</th>

								<td id="select"><select name="show_MovieId" class="form-control form-select form-control-sm">

										<c:forEach var="m" items="${al}">
											<c:if test="${m.movieId==showobj.show_MovieId }">
												<option selected="selected" value="${m.movieId }">${m.movieName }</option>
											</c:if>
											<c:if test="${m.movieId!=showobj.show_MovieId }">
												<option value="${m.movieId }">${m.movieName }</option>
											</c:if>
										</c:forEach>

								</select></td>
								<%-- <td><input class="form-control form-control-sm" type="text" name="movieName" value="${showobj.showMovie.movieName }" required="required"  readonly="readonly"></td>
  --%>
								<td><sup><span id="star">*</span></sup></td>
							</tr>
							<tr>
								<th>Theater :</th>
								<td><input class="form-control form-control-sm" type="text"
									name="theatreName_loc" value="${showobj.theatreName_loc }"
									required="required" autofocus="autofocus"></td>
								<td><sup><span id="star">*</span></sup></td>

							</tr>
							<tr>
								<th>Date :</th>
								<td><input class="form-control form-control-sm" type="date"
									name="showDate" value="${showobj.showDate }"
									required="required"></td>
								<td><sup><span id="star">*</span></sup></td>

							</tr>
							<tr>
								<th>Time :</th>
								<td style="text-align: left;border-radius: 20px;">From- <input type="time" 
									name="startTime" value="${showobj.startTime }"
									style="margin-right: 30px"> To- <input type="time"
									name="endTime" value="${showobj.endTime }"></td>



								<td><sup><span id="star">*</span></sup></td>

							</tr>
							<tr>
								<th>Screen_No :</th>
								<td><input class="form-control form-control-sm" type="text"
									name="screnn_no" value="${showobj.screnn_no}"
									required="required"></td>
								<td><sup><span id="star">*</span></sup></td>

							</tr>
							<tr>
								<th class="type">Show Type :</th>
								<td><input  class="form-control form-control-sm" type="text" readonly="readonly" id="type" style="margin-bottom: 10px"
									 value="${showobj.show_Type }">
									 
									<select  class="form-control form-select form-control-sm" name="show_Type" id="type1" onchange="ctype()" style="height: max-content">
										<option value="${showobj.show_Type }" selected="selected">${showobj.show_Type }</option>
										<option value="Morning">Morning</option>
										<option value="AfterNoon">AfterNoon</option>
										<option value="Evening">Evening</option>
										<option value="Night">Night</option>
										<!-- <option value="Comedy">Comedy</option>
								<option value="Science_fiction">Science Fiction</option>
								<option value="Thriller">Thriller</option>
								<option value="Superhero">Superhero</option> -->
								</select></td>
								<td><sup><span id="star">*</span></sup></td>

							</tr>							

							<tr>
								<th>Price :</th>
								<td><input class="form-control form-control-sm" type="text"
									name="price" value="${showobj.price }" required="required"></td>
								<td><sup><span id="star">*</span></sup></td>

							</tr>
							<tr>
								<th><button type="reset" class=" btn btn-dark">
										<i class="fa-solid fa-rotate"></i> Reset
									</button></th>
								<th>
									<button class=" btn btn-primary">
										<i class="fa-regular fa-pen-to-square"></i> Update
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