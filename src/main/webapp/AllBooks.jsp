<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.FormatStyle"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.movie.dao.CustomerDaoImpl"%>
<%@page import="com.movie.pojo.Customer"%>
<%@page import="java.util.List"%>
<%@page import="com.movie.pojo.Booking"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="icon" type="image/*" href="images/logo.png"/>

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
tr:first-child th {
	top: 0;
	border-right: 0.5mm solid white;
	border-left: 0.5mm solid white;
	border-bottom: 1px solid white;
	/* position: sticky; */
	background: #e0e0b6;
	color: black;
}
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
tr:nth-child(even) td {
	background: #e4f5e9;
}
tr:nth-child(odd) td {
	background: #b0e3e8;
}

</style>
</head>
<body>
<%
List<Booking> Bobj = (List<Booking>) session.getAttribute("AllBooks");
Customer c;
if(Bobj.isEmpty()){
	request.setAttribute("msg", "Sorry No Bookings Are Done Yet...");
}
%>

<jsp:include page="header.jsp"></jsp:include>
	<section class="py-5">

		<div class="container bg-white">


			<div class="moviecontainer">
				<div class="container">
					<jsp:include page="msg.jsp"></jsp:include>
					</div>




<table class="table">

<tr>
<th>Booking Id</th>
<th>Customer Name</th>
<th>Customer Email_Id</th>
<th>Movie</th>
<th>Booking Date & <br> TIme</th>
<th>Screen No</th>
<th>Show Date</th>
<th>Movie Time</th>
<th>Seats</th>
<th>Total Amount</th>


</tr>

<%for(Booking b:Bobj){ 
	DateTimeFormatter dtf=DateTimeFormatter.ofPattern("HH:mm a");
	   LocalDateTime bt1=b.getBookingDate();
	  String bt=dtf.format(bt1);
%>

<tr>

<td><%=b.getBookingId() %></td>
<%c=new CustomerDaoImpl().showCustomerByEmailId(b.getCustEmailId()); %>
<td><%=c.getFirstName()%> <%=c.getLastName() %></td>

<td><%=b.getCustEmailId() %></td>

<td><%=b.getBookingShow().getShowMovie().getMovieName() %></td>

<td><%=b.getBookingDate().format(DateTimeFormatter.ofLocalizedDate(FormatStyle.SHORT)) %> & <%=bt %></td>

<td><%=b.getBookingShow().getScrenn_no() %></td>
<td><%=b.getBookingShow().getShowDate().format(DateTimeFormatter.ofLocalizedDate(FormatStyle.SHORT))%></td>
<td>From: <%=b.getBookingShow().getStartTime()%> To: <%=b.getBookingShow().getEndTime()  %></td>

<td><%=b.getBookingSeats() %></td>
<td><%=b.getTotalBill() %></td>
</tr>


<%} %>

</table>



			</div>

		</div>

	</section>

	<div class="bot">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>




</body>
</html>