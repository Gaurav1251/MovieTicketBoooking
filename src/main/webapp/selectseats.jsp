<%@page import="com.movie.dao.MovieDaoImpl"%>
<%@page import="com.movie.pojo.Show"%>
<%@page import="com.movie.dao.ShowDaoImpl"%>
<%@page import="com.movie.pojo.Movie"%>
<%@page import="com.movie.dao.CustomerDaoImpl"%>
<%@page import="com.movie.pojo.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="icon" type="image/*" href="images/logo.png"/>
<link rel="stylesheet" type="text/css" href="css/seatingcss.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<script>
function seatselect() {
	$(".seatStructure").show();
			$(".displayerBoxes").hide();
	
}

	function seats(count,seat) {
		if(count==0){
			alert('Please Select Atleast 1 Seat');
		}
		else{
			var price=$("#price").val();
			var bill=price*count;
			$("#totalbill").val(bill);
			var s="";
			
			for(let i=0;i<count;i++){
				if(i==count-1){
				s=s+seat[i].defaultValue;}
				else{
					s=s+seat[i].defaultValue+",";
				}
			}
			$("#seatsDisplay").val(s);
			
			$(".seatStructure").hide();
			$(".displayerBoxes").show();
		}
		
	}
		$(function(){
			$(".displayerBoxes").hide();
			$(".csbtn").click(function(){
				
				var seat =$("input:checked");
				var seatcount=seat.length;
				seats(seatcount,seat);
				
			})
			
			

		})

		

	</script>
	<style type="text/css">
/* 	.moviecontainer{
	background-color:#242323;
	border-radius: 20px ;
	
	width: 100%;
	} */
	.container.bg-white {
	
	background-image:url("images/seatbooking.png");
	box-shadow: 1px 1px 8px 0px black;
	border-radius: 20px ;
	
	width:660px;
	height: max-content;
	
	
		

}
table.Displaytable tr th {
  font-size: 18px;
  text-align:center;
  color: black;
}
input[type=checkbox] {
	width: 0px;
	margin-right: 18px;
}

input[type=checkbox]:before {
	content: "";
	width: 15px;
	height: 15px;
	display: inline-block;
	vertical-align: middle;
	text-align: center;
	border-top-left-radius:5px;
	border-top-right-radius:5px;
	box-shadow: 0.1mm 0.1mm 0px 0.2mm white;
	background-color: #a2a2bd;
}

input[type=checkbox]:checked:before {
	background-color: Green;
	font-size: 15px;
}

input[type=checkbox]:disabled:before {
    background-color: blue;
    font-size: 15px;
    width: 15px;
	height: 15px;
}

.showcase .seat:not(.sold):hover{
    cursor: default;
    transform: scale(1);

}

.showcase{
    background-color: #242323;
    padding: 5px 1px;
    border-radius: 5px;
    color:white;
    list-style-type: none;
    display: flex;
    justify-content: space-between;
}
.showcase li{
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 1px;
    
}
.showcase li small{
    margin-left: 33px;
    font-weight: 500;

}
.seat{
    background-color: #a2a2bd;
    height: 26px;
    width: 32px;
    margin: 3px;
    border: 0.3mm solid white;
     
}
.seat.selected{
    background-color: green;

}
.seat.sold{
    background-color: blue;

}
#screen{

    background-color:white;
    height: 120px;
    width: 100%;
    margin: 15px 0px;
    transform: rotateX(-45deg);
    box-shadow: 0 3px 10px aqua;
    
     
}
	
#seatBlock tr:first-child td{
	height: 120px;
}
	</style>
</head>
<body>

	<%
	
	int showId=(int)request.getAttribute("showId");
	List<String>reservedSeats=(List<String>)request.getAttribute("seats");
	
	int cols=12;
	char rows='I';
	Show s= new ShowDaoImpl().getShowById(showId);

	%>
	<%
	String email=(String) session.getAttribute("user");
	Customer c=new CustomerDaoImpl().showCustomerByEmailId(email);
	Movie m=s.getShowMovie();
	%>
	<input type="hidden" id="price" value="<%=s.getPrice()%>">
	<jsp:include page="header.jsp"></jsp:include>


	<section class="py-5">

		<div class="container bg-white">

			<div class="moviecontainer">
				<div class="container">
					<jsp:include page="msg.jsp"></jsp:include>
				
					<div class="seatStructure column" style="margin: 0px auto;justify-content: flex-start;">
						<ul class="showcase">
        <li>
            <div class="seat"><small>Available</small></div>

            
        </li>
<li>
    <div class="seat selected">

        <small>Selected</small>
    </div>
</li>

<li>

    <div class="seat sold">

        <small>
            Sold
        </small>
    </div>
</li>
    </ul>
    <div id="screen">

        <h2 style="color:black;text-align:center;margin:auto;padding: 30px">Screen</h2>
    </div>
						<table id="seatsBlock" align="center" style="color: black;height: 100%;">
							<tr>
							<!-- 	<td colspan="14"><div id="screen">

        <h2 style="color:white;text-align:center;margin:auto;padding: 30px">Screen</h2>
    </div></td> -->
								<!-- <td rowspan="20">
									<div class="smallBox greenBox">Selected Seat</div> <br />
									<div class="smallBox redBox">Reserved Seat</div> <br />
									<div class="smallBox emptyBox">Empty Seat</div> <br />
								</td> -->
								
							</tr>

							<tr>
								<td></td>
								 <%for(int i=1;i<=cols;i++){ %>
								 <td style="color: white"><%=i %></td>
								 <%if(i==6 || i==2 || i==10){ %>
								 <td class="seatGap"></td>
								 
								 <%} %>
        <%} %>
							</tr>
							<%for(char a='A';a<=rows;a++){ %>
							<tr>
								<td style="padding-right: 5px;padding-top: 5px;color: white"><%=a %>  </td>
								<%for(int i=1;i<=cols;i++){
								String seats=a+""+i;
								%>
								<%if(reservedSeats!=null && reservedSeats.contains(seats)) {%>
								<td> <input type="checkbox" disabled="disabled" >  </td><%} else{ %>
								
								<td><input type="checkbox" class="seats" value="<%=seats%>"></td>
								<%} %>
								<%if(i==6 || i==2 || i==10){ %>
								<td class="seatGap"></td>
								<%} %>
								<%} %>
								
								
							</tr>
							<%} %>
							<tr>
							
<td colspan="14"> <br>
 </td>


							</tr>
							<tr>
								<td align="center" colspan="14"><button class="csbtn"
										 style="margin: 5px;">Confirm
										Selection</button></td>
							</tr>
						</table>
					</div>


					<div class="displayerBoxes column " style="margin-top: 50px;">
						<form action="bookServe" method="post">
							<input type="hidden" name="process" value="payment">
							<table class="Displaytable" align="center">
		
			<tr>
				<th>Customer Name :</th>
				<td><%=c.getFirstName() %> <%=c.getLastName() %></td>
			</tr>
			<tr>
				<th>Show Id :</th>
				<td><input type="text" id="showId" name="showId"
					value="<%=showId %>" readonly="readonly"></td>
			</tr>
			<tr>
				<th>Movie :</th>
				<td><%= m.getMovieName()%></td>
			</tr>
			<tr>
				<th>Screen No:</th>
				<td><%=s.getScrenn_no() %></td>
			</tr>
			<tr>
				<th>Start Time:</th>
				<td><%=s.getStartTime()%></td>
			</tr>
			<tr>
				<th>End Time:</th>
				<td><%=s.getEndTime()%></td>
			</tr>
			<tr>
				<th>Seat:</th>
				<td><input type="text" id="seatsDisplay" name="bookedseats" readonly="readonly"></td>
			</tr>
			<tr>
				<th>Total:</th>
				<td> <input type="text" id="totalbill" name="totalbill" readonly="readonly"> </td>
			</tr>
			<tr>
				<th colspan="2"> <a onclick="seatselect()" class=" btn btn-dark" style="color: white"><i class="fa-solid fa-arrow-left"></i>  Back To Seat Selection</a>
				<button class=" btn btn-primary"><i class="fa-regular fa-credit-card"></i> Buy</button></th>
			</tr>
		</table>
						</form>
						<div id="legend"></div>
						<div style="clear: both"></div>
					</div>
				</div>
			</div>
		</div>
		
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>