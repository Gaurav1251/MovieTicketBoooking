<%@page import="java.time.format.FormatStyle"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalTime"%>
<%@page import="com.movie.pojo.Movie"%>
<%@page import="com.movie.pojo.Booking"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
.bot {
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

.container.bg-white {
	box-shadow: 2px 2px 10px 0px grey;
	border-radius: 20px;
	background-image: linear-gradient(to bottom right, wheat, white, wheat, white);
	height: max-content;
	width: max-content;
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

tr:nth-child(odd) td {
	background: #b0e3e8;
}
</style>
</head>
<body>
	<%
	List<Booking> mytick = (List<Booking>) session.getAttribute("mytick");
	
	if(mytick.isEmpty()){
		request.setAttribute("msg", "Currently You Haven't Booked Any Tickets...");
	}
	
	%>
	<%!
	public boolean cancelbooking(LocalDateTime now,LocalDate showDate,LocalTime starTime){
		int nowyear=now.getYear();
		int nowmonth=now.getMonthValue();
		int nowday=now.getDayOfMonth();
		int nowhour=now.getHour();
		int nowmin=now.getMinute();
		int nowfinalmin=(nowhour*60)+nowmin;
		
		//
		//
		int showyear=showDate.getYear();
		int showmonth=showDate.getMonthValue();
		int showday=showDate.getDayOfMonth();
		int showhour=starTime.getHour();
		int showmin=starTime.getMinute();
		 int showfinalmin=(showhour*60)+showmin;
		
		  if(showyear==nowyear){
			if(nowmonth==showmonth){
				if(showday>nowday){
					return true;
						
					} 
					 else if(showday==nowday){
						if((nowfinalmin-showfinalmin)>=240){
							return true;
						}
						else{
							return  false;
						}
						
					}
					else{
						return false;
					} 
					
			 	}
			}
		 return false; 
		
			
		} 
		
		
		
		
	
	
	%>
	<jsp:include page="header.jsp"></jsp:include>


	<section class="py-5">

		<div class="container bg-white">

			<div class="moviecontainer">
				<div class="container">
					<jsp:include page="msg.jsp"></jsp:include>

					<table class="table">

						<tr>

							<th>Booking Id</th>
							<th>Movie Name</th>
							<th>Booking Date & Time</th>
							<th>Theater</th>
							<th>Show Date</th>
							<th>Screen</th>
							<th>Start Time</th>

							<th>Seats</th>
							<th>Total Amount</th>
							<th>Action <br> <small>(Cancellation Time 4 Hrs
									Before Showtime)</small>
							</th>

						</tr>

						<%
						for(Booking b : mytick){
						
						%>

						<tr>
						<%
						
						
						   LocalDateTime now = LocalDateTime.now();	
						
						LocalDate showdate=b.getBookingShow().getShowDate();
							
						   LocalTime startTime=b.getBookingShow().getStartTime();
						  boolean flag= cancelbooking(now,showdate, startTime);
						   
						   DateTimeFormatter dtf=DateTimeFormatter.ofPattern("HH:mm a");
						   LocalDateTime bt1=b.getBookingDate();
						  String bt=dtf.format(bt1);
						   
						   		
						  
								 %>
							<td><%=b.getBookingId() %></td>
							<td><%=b.getBookingShow().getShowMovie().getMovieName() %></td>
							<td><%=b.getBookingDate().format(DateTimeFormatter.ofLocalizedDate(FormatStyle.SHORT))%> & <%=bt %> </td>
							<td><%=b.getBookingShow().getTheatreName_loc()%></td>
							<td><%=b.getBookingShow().getShowDate().format(DateTimeFormatter.ofLocalizedDate(FormatStyle.SHORT))%></td>
							
							<td><%=b.getBookingShow().getScrenn_no() %></td>
							<td><%=b.getBookingShow().getStartTime()%></td>

							<td><%=b.getBookingSeats()%></td>
							<td><%=b.getTotalBill()%></td>

							

							<%if(flag){ %>
							<td><a class="btn btn-danger" id="del" href="bookServe?process=cancel&bookingId=<%=b.getBookingId() %>"
								onclick="return confirm('Are You Sure ,You Want to Delete this Booking ? ')"><i
									class="fa-solid fa-trash-can"></i> Cancel Booking</a>
							</td>
							<%} else{ %>
													<td><a class="btn btn-danger" id="del" href=""
								style="pointer-events:none">Cancellation Unavailable</a>
							</td>
							<%} %>

						</tr>

						<%} %>


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