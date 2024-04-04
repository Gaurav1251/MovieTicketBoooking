<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="js/jq.js">
</script>
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

<style type="text/css">
.eye{
position: absolute;
left:80%;
bottom: 10%;
}
.eye:hover{
color: black;
}
.container.bg-white {

	box-shadow: 1px 1px 8px 0px black;
	border-radius: 20px ;
	
	width:430px;
	height: max-content;
	
	
		

}



/* th{
	text-align: center;
	
}
td{
text-align: left;
}


tr:last-child {
	text-align: center;
}
 */

form h3{
text-align: center;
font-weight: 500;
letter-spacing: 0.1em;

}

form{

inset:4px;
padding: 40px 30px;
z-index: 2;
display: flex;
flex-direction: column;
}
form .input{
position: relative;
width:400px;
margin-top: 35px;



}
form .input input{
position: relative;
width:80%;
padding: 20px 10px 10px;
background: transparent;
border: none;
font-size: 1em;
letter-spacing: 0.05em;
transition:0.5s;
z-index: 10;
outline: none;
box-shadow: none;
color: black;


}
form .input span{
position: absolute;
left: 0;
padding: 20px 0px 10px;
pointer-events:none;
font-size:1em;
letter-spacing:0.05em;
transition:0.5s;

}

form .input input:valid ~ span,form .input input:focus~ span{
	font-size: 0.80em;
	transform:translateY(-36px);
	
	
}
form .input input:valid ~ .i,form .input input:focus~ .i{
	height: 40px;
	overflow: hidden;
	background: #eddedd;
	
}
button:hover{
	box-shadow: 1px 1px 8px 0px black;
	
	
}
form .input .i{

position: absolute;
left: 0;
bottom: 0;
width: 80%;
height: 2px;
background: black;
border-radius: 4px;
overflow:hidden;
transition:0.5s;
pointer-events:none;


}
.but{
margin-top:20px;
display: flex; 

width:100%;
justify-content: space-between;
}
.show{
margin-top:10px;
justify-content: flex-start;
}
sup{
color: red;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	
 
	<section class="py-5">

		<div class="container bg-white">
	
			<div class="moviecontainer">
				<div class="container">
				<jsp:include page="msg.jsp"></jsp:include>
				<form action="Login_Serve" method="post">
				<h3>Login</h3>
					<input type="hidden" name="process" value="login">
						<div class="input">
						<input type="text" name="username" required="required" autofocus="autofocus"><span><i class="fa-solid fa-user"></i> UserName <sup>*</sup> </span> <i class="i"></i>
						
						</div>
						<div class="input">
						<input type="password" name="password" required="required"  id="show"><span><i class="fa-solid fa-lock"></i> Password <sup>*</sup> </span> <i class="i"></i> <a href="" class="eye"><i id="eye" class="fa-solid fa-eye fa-lg"></i></a>
						
						
						</div>
						<!-- <div class="show">
						<input type="checkbox" id="showc">  Show Password
						</div> -->
						<div class="but"> 
						<div><button type="reset" class=" btn btn-dark"><i class="fa-solid fa-rotate"></i> Reset</button></div>
						<div><button class=" btn btn-primary"><i class="fa-solid fa-right-to-bracket"></i> Login </button></div>
						</div>
				</form>
				
				
				
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>