<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.FormatStyle"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.movie.pojo.Show"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
background-image:linear-gradient(to bottom right,wheat,white,wheat,white);
	width: max-content;
	height: max-content;
	
	
}
#del:hover{
	box-shadow: 1px 1px 6px 0px black;
	
}

tr:nth-child(2)  th{

border-color:black;
border-style:solid;
border-top-width: 0.43mm;
/* border-bottom-width: 0.1mm; */
background: aqua;


}
tr:first-child th,tr:nth-child(2) th {
	top: 0;
border-right:0.4mm solid black;
	border-left:0.4mm solid  black;
	 border-bottom:0.1mm solid black; 
	border-top:0.4 solid black;
	/* position: sticky; */
	background: #fcfcca;
	color: black;
}
th[rowspan]:not([rowspan="1"]) {
    vertical-align : middle;
}
.bot{
bottom: 0;
position:absolute;
width: 100%;
}
.moviecontainer {

	 overflow-y:scroll; 
	height: auto;
	
	
}
.moviecontainer::-webkit-scrollbar {
    display: none;
}
tr:nth-child(even) td {
	background: #e6d7d5;
	font-family:monospace;
}

tr:nth-child(odd) td {

	background: #e4f5e9;
	font-family:monospace;
}
th, td, tr {

	border-right-style: ridge;
	border-right-width: 0.4mm;
	border-left-width: 0.4mm;
	border-left-style: ridge;
	
	text-align: center;
	margin: auto;
}

tr:hover:not(:first-child) td{
	border-right-style: ridge;
	border-right-width: 0.4mm;
	border-left-width: 0.4mm;
	border-left-style: ridge;
	background: #aba6f7;
	border-color:/*  #e0f2a5 */aqua;
	
}
tr:first-child {
	top: 0;
	/* position: sticky; */
	
	background: #e0e0b6;
	color: black;
}
#up:hover{
	box-shadow: 1px 1px 6px 0px white;
	transform:scale(1.1);
	
	
}
#del:hover{
transform:scale(1.1);
	
	box-shadow: 1px 1px 6px 0px white;
	
}
</style>
</head>
<body>
<%
							String user=(String) session.getAttribute("user");
							String admin=(String) session.getAttribute("Admin");
							List<Show> sl= (List<Show>) session.getAttribute("sl");
							
							%>
<jsp:include page="header.jsp"></jsp:include>
	<section class="py-5">

		<div class="container bg-white">


			<div class="moviecontainer">
				<div class="container">
					<jsp:include page="msg.jsp"></jsp:include>
					
					
					<table  class="table table-responsive" id="mytable">
					
  <tr>
    <th rowspan="2">Movie</th>
<th rowspan="2">Theater</th>
	<%
							if(admin!=null){
							
							%>
							<th rowspan="2">Screen</th>
							<%} %>
<th rowspan="2">Date</th>
<th rowspan="1" colspan="2">Time</th>
<th rowspan="2">Type</th>
    <th rowspan="2">Price</th>
    <%
							if(admin!=null || user!=null){
							%>
							<th rowspan="2" colspan="3">Action <br>
							<small>(Booking Will be Available Only <br> Before 4 days of Show Date)</small> </th>
							<%} %>
    
  </tr>
  <tr>
  <th>From</th>
<th>To</th>
  </tr>
  <%!
  
  public boolean book1(LocalDate sd,LocalDateTime nd){
	  int nowday=nd.getDayOfMonth();
	  int showday=sd.getDayOfMonth();
	  if((showday-nowday)<=4){
		  return true;
	  }
	  
	  return false;
  }
  //
  public boolean book(LocalDate sd,LocalDateTime nd,LocalTime starTime){
	  int nowyear=nd.getYear();
		int nowmonth=nd.getMonthValue();
		int nowday=nd.getDayOfMonth();
		int nowhour=nd.getHour();
		int nowmin=nd.getMinute();
		int nowfinalmin=(nowhour*60)+nowmin;
		
		//
		int showyear=sd.getYear();
		int showmonth=sd.getMonthValue();
		int showday=sd.getDayOfMonth();
		int showhour=starTime.getHour();
		int showmin=starTime.getMinute();
		 int showfinalmin=(showhour*60)+showmin;
		
		 if(nowyear==showyear){
			if(showmonth==nowmonth){
				if(nowday>showday){
					return false;
					
				}
				else if(nowday==showday){
					if(nowfinalmin<=showfinalmin){
						return true;
						
					}
					
					
				}
				else if((showday-nowday)<=4 || (showday-nowday)>4){
					return true;
				}
				
				
			}
		} 
		return false;
  }
  %>
  <%for(Show s:sl){ %>
  
 <%
 LocalDate showdate=s.getShowDate();
 LocalDateTime nowdate=LocalDateTime.now();
 
boolean a= book(showdate,nowdate,s.getStartTime());
 boolean b;
 %>

<!--  -->

<!--  -->




 
  <tr>
  <td><%=s.getShowMovie().getMovieName() %></td>
  <td><%=s.getTheatreName_loc() %></td>
  <%
							if(admin!=null){
							
							%>
							<td><%=s.getScrenn_no() %></td>
							<%} %>

  <td><%=s.getShowDate().format(DateTimeFormatter.ofLocalizedDate(FormatStyle.MEDIUM))%></td>
  <td><%=s.getStartTime() %></td>
  <td><%=s.getEndTime() %></td>
  <td><%=s.getShow_Type() %></td>
  <td><%=s.getPrice() %></td>
  	<%
							if(admin!=null){
							
							%>
						
							<td><a class="btn btn-primary" id="up"
								href="showServe?process=updateshow&showId=<%=s.getShowId()%>"><i
									class="fa-regular fa-pen-to-square"></i> Update</a></td>
							<td><a class="btn btn-danger" id="del"
								href="showServe?process=deleteshow&showId=<%=s.getShowId() %>"  onclick="return confirm('Are You Sure ,You Want to Delete This Show ?')"><i class="fa-solid fa-trash-can"></i> Delete</a></td>
								<%} %>
		<%
							if(user!=null){
							
							%>	
							
							<%if(a==true){ b=book1(showdate, nowdate);%>
							<%if(b==true){ %>
												
  <td><a class="btn btn-primary" id="up"
								href="bookServe?process=bookshow&showId=<%=s. getShowId()%>"><i class="fa-solid fa-masks-theater"></i> Book</a></td>
								<%} else{%>
								
								 <td><a class="btn btn-primary" id="up"
								href=""  style="pointer-events:none"><i class="fa-solid fa-masks-theater"></i> Book</a></td>
								<%} %>
								
								
								<%} else{ %>
								<td><a class="btn btn-primary" id="up"
								href="#" style="pointer-events:none"><i class="fa-solid fa-masks-theater" ></i> ShowDate Expired</a></td>
								
								<%} %>
								<%} %>
  
  </tr>
  
 <%} %>

  <%
							if(admin!=null){
							
							%>
  <tr>
  <th colspan="10"><a class="btn btn-primary" id="up"
								href="Addshow.jsp"><i
									class="fa-solid fa-plus"></i> Add More Show</a></th>
  
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