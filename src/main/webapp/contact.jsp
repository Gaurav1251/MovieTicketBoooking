<%@page import="com.movie.dao.CustomerDaoImpl"%>
<%@page import="com.movie.pojo.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="icon" type="image/*" href="images/logo.png"/>
<style type="text/css">

.container.bg-white {
	box-shadow: 1px 1px 8px 0px black;
	border-radius: 20px ;
	width:510px;
	
	

}
section{
background-image: url("images/RC.jpg");
background-repeat: no-repeat;
background-size: cover;
background-position: center center;
}
tr:last-child{
	text-align: center;
}
th,td, tr {
	border-right-style: ridge;
	border-right-width: 0.4mm;
	border-left-width: 0.4mm;
	border-left-style: ridge;
	text-align: left;
	margin: auto;
	width: max-content;
}
</style>
<script src="js/jq.js"></script>
<script src="https://smtpjs.com/v3/smtp.js">
</script>
<script type="text/javascript">
function size(a){
	if (a>400) {
		$(".bot").css("position","static");
	}
	

	}
	
	
	function msg1(a) {
		
		Email.send({
		    Host : "smtp.elasticemail.com",
		    Username : "your mail",
		    Password : "app password ",
		    To : 'to',
		    From : "from",
		    Subject : "New Enquiry",
		    Body : a
		}).then(
				
		  message => alert("Message Send Succussefully...")
		  
		);
		
			
		
	}
$(document).ready(function () {
	size($(".moviecontainer").height());
	
	$("#btn").click(function (e) {
		
		e.preventDefault();
		
		var name=$("#name").val();
		var email=$("#email").val();
		var msg=$("#msg").val();
		
		var body="Name : "+name+'<br>'+"Email : "+email+'<br>'+"Message : "+msg;
		//msg1(body);
		alert("Message Sended Successfully...")
		
		
		
	})
	
	
})
</script>
</head>
<body>
<%
String email=(String)session.getAttribute("user");
String s="";
String e="";
Customer c= new CustomerDaoImpl().showCustomerByEmailId(email);
if(c!=null && email!=null){
s=c.getFirstName()+" "+c.getLastName();
if(s!=null){
	s=s+"";
	e=email+"";
	
}
else{
	s="";
}
}
%>
<jsp:include page="header.jsp"></jsp:include>
	<section class="py-5">

		<div class="container bg-white">


			<div class="moviecontainer">
			
			
				<div class="container">
				<marquee scrollamount="11"> <h5>Give us your details and we will get back to you</h5></marquee> 
<br>

<form action="">

<table class="table table-striped">

<tr>
<th>Name</th>
<td> <input type="text" class="form-control form-control-sm" required="required" id="name" autofocus="autofocus" value="<%=s%>"> </td>



</tr>
<tr>
<th>Email :</th>
<td> <input type="email" class="form-control form-control-sm" required="required" id="email" value="<%=e%>"> </td>



</tr>

<tr>
<th>Message :</th>
<td> <textarea rows="4" cols="30" id="msg" class="form-control form-control-sm" ></textarea> </td>



</tr>
<tr> <th colspan="2"> <button id="btn" class="btn btn-primary"><i class="fa-solid fa-paper-plane"></i>  Send Message</button> </th>  </tr>
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
