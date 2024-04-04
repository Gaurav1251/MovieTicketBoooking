<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="js/jq.js"></script>
<!-- <script src="js/jq.js"></script>
<script type="text/javascript">

function msg() {
	setTimeout(() => {
		$("#msg").hide();
	}, 10000);
	
}
$(document).ready(function(){
	  msg();
	});
</script> -->
<!-- 

<script src="js/jq.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	var m=document.getElementById("msg").innerHTML;

	if (m!=null&& m!="") {
		alert(m);
	}

})

</script> -->
<script type="text/javascript">
function show() {
	var x=document.getElementById("show")
	if(x.type=="password"){
		x.type="text";
		
	}
	else{
		x.type="password";
	}
}
$(document).ready(function () {
/* 	$("#showc").click(function(){
		show();
	}) */
	$(".eye").click(function(e){
		e.preventDefault();
		show();
		$("#eye").toggleClass('fa-eye-slash fa-eye');

	})
})
</script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" /> 
<style>
button:hover{
	box-shadow: 1px 1px 6px 0px black;
	
	
}
.eye:hover{
color: black;
}
#star {
	color: red;
}
td,th{
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
	width:750px;
	

}
tr:last-child {
	text-align: center;
}
/* #msg{
background-image: url("images/cust1.jpeg");
background-repeat:no-repeat;
background-size:cover;
text-align:center;
padding-top: 50px;



} */

</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%-- <%

	  String msg = (String)request.getAttribute("msg");
	String emsg = (String)request.getAttribute("emsg");
		
	%> --%>
	
<section class="py-5">

	
	<div class="container bg-white">
			<div class="moviecontainer">
				<div class="container">
				<jsp:include page="msg.jsp"></jsp:include>
<form action="CustServe" method="post">
<input type="hidden" name="process" value="addCust">
<table class="table">
  <tr>
    <th>First Name : </th>
   <td> <input class="form-control form-control-sm" type="text" name="firstName" required="required" autofocus="autofocus">  </td>
  <td><sup><span id="star">*</span></sup></td>
  </tr>
  <tr>
    <th>Last Name : </th>
   <td> <input type="text" class="form-control form-control-sm" name="lastName" required="required">   </td>
  <td><sup><span id="star">*</span></sup></td>
  </tr>
  <tr>
    <th> Email Id : </th>
   <td> <input type="text" name="emailId" required="required" class="form-control form-control-sm">  </td>
   <td><sup><span id="star">*</span></sup></td>
  </tr>
  <tr>
    <th>Contact No : </th>
   <td> <input type="text" name="contact" required="required" class="form-control form-control-sm">  </td>
<td><sup><span id="star">*</span></sup></td>
  </tr>
  <tr>
    <th>Address : </th>
   <td> <input type="text" name="address" required="required" class="form-control form-control-sm"> </td>
<td><sup><span id="star">*</span></sup></td>
  </tr>
  <tr>
    <th>Password : </th>
   <td> <input type="password" name="password" class="form-control form-control-sm" required="required" id="show"> </td>
   <td><a href="" class="eye"><i id="eye" class="fa-solid fa-eye fa-lg"></i></a><sup><span id="star">*</span></sup></td>
  </tr>
  <tr>
  <th><button type="reset" class=" btn btn-dark"><i class="fa-solid fa-rotate"></i> Reset</button></th>
  <th> <button class="btn btn-primary"><i class="fa-solid fa-user fa-sm"></i>   Register</button> </th>
  
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