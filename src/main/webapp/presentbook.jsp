<%@page import="com.movie.pojo.Booking"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/seatingcss.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	
<style type="text/css">
.container.bg-white {
	box-shadow: 2px 2px 10px 0px grey;
	border-radius: 20px;
	background-image: linear-gradient(to bottom right, wheat, white, wheat, white);
	height: max-content;
	width: max-content;
}
.bot{
	bottom: 0;
	position: absolute;
	width: 100%;
}
</style>
</head>
<body>
<%Booking tk=(Booking)session.getAttribute("bk");


%>
<jsp:include page="header.jsp"></jsp:include>
	<section class="py-5">

		<div class="container bg-white">


			<div class="moviecontainer">
				<div class="container">
					<jsp:include page="msg.jsp"></jsp:include>
					
					<table class="Displaytable" align="center">
		
			
			<tr>
				<th>Booking Id :</th>
				<td><input type="text" id="showId" name="showId"
					readonly="readonly" value="<%=tk.getBookingId()%>"></td>
			</tr>
			<tr>
				<th>Movie :</th>
				<td><%=tk.getBookingShow().getShowMovie().getMovieName() %></td>
			</tr>
			<tr>
				<th>Screen No:</th>
				<td><%=tk.getBookingShow().getShow_MovieId() %></td>
			</tr>
			<tr>
				<th>Start Time:</th>
				<td><%=tk.getBookingShow().getStartTime() %></td>
			</tr>
			<tr>
				<th>End Time:</th>
				<td><%=tk.getBookingShow().getEndTime() %></td>
			</tr>
			<tr>
				<th>Seat:</th>
				<td><input type="text" id="seatsDisplay" name="bookedseats" readonly="readonly" value="<%=tk.getBookingSeats()%>"></td>
			</tr>
			<tr>
				<th>Total:</th>
				<td> <input type="text" id="totalbill" name="totalbill" readonly="readonly" value="<%=tk.getTotalBill()%>"> </td>
			</tr>
			
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