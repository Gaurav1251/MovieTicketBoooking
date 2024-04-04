<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>



<style>

#star {
	color: red;
}

td,th{
	text-align: center;
	
}

tr:last-child {
	text-align: center;
}
section{
background-image: url("images/cust1.jpeg");
background-repeat: no-repeat;
background-size: 100vw 100vh;
background-position: center center;


}


.container.bg-white {

	box-shadow: 1px 1px 8px 0px black;
	border-radius: 20px ;
	
	width:740px;
	
	
	
		

}



button:hover{
box-shadow: 1px 1px 8px 0px black;

}

</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	
 
	<section class="py-5">

		<div class="container bg-white">
	
			<div class="moviecontainer">
				<div class="container">
				<jsp:include page="msg.jsp"></jsp:include>
					<form action="movieServe" method="post">
					<input type="hidden" name="process" value="edit">
						<table class="table">
						<tr>
								<th>Movie Id :</th>
								<td><input class="form-control form-control-sm" type="number" name="movieId" required="required" readonly="readonly" value="${updobj.movieId}"></td>

							</tr>
							<tr>
								<th>Movie Name :</th>
								<td><input class="form-control form-control-sm" type="text" name="movieName" required="required" autofocus="autofocus" value="${updobj.movieName}"></td><td><sup><span id="star">*</span></sup></td>

							</tr>
							<tr>
								<th>Movie Director :</th>
								<td><input class="form-control form-control-sm" type="text" name="director" required="required" value="${updobj.director}">
									</td>
									<td><sup><span  id="star">*</span></sup></td>

							</tr>
							<tr>
								<th>Movie Producer :</th>
								<td><input class="form-control form-control-sm" type="text" name="producer" required="required" value="${updobj.producer}">
									</td>
									<td><sup><span  id="star">*</span></sup></td>

							</tr>
							<tr>
								<th>Movie Writer :</th>
								<td><input class="form-control form-control-sm" type="text" name="writer" required="required" value="${updobj.writer}">
									</td>
									<td><sup><span  id="star">*</span></sup></td>

							</tr>
							<tr>
								<th>Movie Casts :</th>
								<td><input class="form-control form-control-sm" type="text" name="cast" required="required" value="${updobj.cast}">
									</td>
									<td><sup><span  id="star">*</span></sup></td>

							</tr>
							<tr>
								<th>Movie Release Date :</th>
								<td><input class="form-control form-control-sm" type="date" name="releaseDate" required="required" value="${updobj.releaseDate}"></td>
									<td><sup><span  id="star">*</span></sup></td>

							</tr>
							<tr>
								<th><button type="reset" class=" btn btn-dark"><i class="fa-solid fa-rotate"></i> Reset</button> </th>
								<th>
									<button class=" btn btn-primary"><i
									class="fa-regular fa-pen-to-square"></i> Update</button>
								</th>

							</tr>
						</table>


					</form>
				</div>
			</div>
		</div>
	</section>
	<div class="bot">
	<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>