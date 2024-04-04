<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="icon" type="image/*" href="images/logo.png" />
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<script src="js/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="css/font-awesome.min.css" rel="stylesheet">

<link href="css/main.css" rel="stylesheet">
<script src="js/jq.js"></script>
<script type="text/javascript">
		$(function(){
			$("li.nav-item").click(function(){
				 $('li.nav-item').removeClass('active'); 
				 $(this).addClass('active'); 
			});
		})
	</script>

<style type="text/css">

/*  .navbar-nav.ml-auto > li:hover {
	transform:scaleX(1.);
	
} */


.navbar-nav.ml-auto:hover li {
	filter: opacity(30%);
}

.navbar-nav.ml-auto>li:hover {
	filter: opacity(100%);
	transform: scale(1.1);
}


.dropdown-menu {
width: max-content;
}
@media screen and (max-width: 920px) {
 .navbar-nav.ml-auto li{
 width:max-content;
 color: white;

 text-shadow: 4px 4px 20px green;
 
 }
}
</style>

</head>
<body>
	<!-- Content here -->
	<!-- Navigation -->
	
	<%
		String user=(String) session.getAttribute("user");
		String admin=(String) session.getAttribute("Admin");
		/* Cookie []ck=request.getCookies();
		String cook=null;
		if(ck!=null){
			for(Cookie c:ck){
				if(c.getName().equals("Admin")||c.getName().equals("Customer")){
					cook=c.getValue();
					
				}
			}
		}
		
		if(cook==null){
			
			response.sendRedirect("login.jsp");
		} */
		%>
	<div class="fixed-top">
		<nav
			class="navbar navbar-expand-lg navbar-dark mx-background-top-linear">
			<div class="container">
				<a class="navbar-brand" rel="nofollow" target="_self"
					href="index.jsp"
					style="font-weight: bold; font-variant: small-caps; color: black;">
					Book <span class="ticket">Your</span> Show.COM
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">

					<ul class="navbar-nav ml-auto">

						<li class="nav-item active"><a class="nav-link"
							href="index.jsp">Home<span class="sr-only">(current)</span>
						</a> <!-- <span class="sr-only">(current)</span> --></li>
						<%-- <%
							if(admin!=null){
							%>
						<li class="nav-item"><a class="nav-link"
							href="">Profile</a></li>
						<%} %> --%>
						<%
							if(user!=null){
							%>
						<li class="nav-item"><a class="nav-link"
							href="CustServe?process=profile">Profile</a></li>
						<%} %>
						<li class="nav-item"><a class="nav-link" href="abouts.jsp">About</a></li>

						<li class="nav-item"><a class="nav-link"
							href="movieServe?process=AllMo">Movies</a></li>

						<li class="nav-item dropdown">
						<%
							if(user!=null){
							%>
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						          Ticket's
						        </a><%} %>
						        <%
							if(admin==null && user==null){
							%>
						<!-- <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						          Dropdown
						        </a> --><%} %>
						        <%
							if(admin!=null){
							%>
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						          Actions
						        </a><%} %>
						        
						        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
						        <%
							if(admin!=null){
							%>
						          <a class="dropdown-item" href="Addshow.jsp">Add New Show</a>
						          <a class="dropdown-item" href="AddMovie.jsp">Add New Movie</a>
						           <a class="dropdown-item" href="CustServe?process=allcust">Custmer List</a>
						           <a class="dropdown-item" href="bookServe?process=AllBook">All Booking's</a>
						          
						          <%} %>
						            <%
							if(user!=null){
							%>
						          <a class="dropdown-item" href="CustServe?process=mybook">My Tickets</a>
						          
						          
						          <%} %>
						          <a class="dropdown-item" href="#">Another action</a>
						          <div class="dropdown-divider"></div>
						          <a class="dropdown-item" href="#">Something else here</a>
						        </div>
							
         
					</li>
				<%
							if(admin==null && user==null){
							%>
				<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="AddCustomer.jsp">Register</a></li>
				<%} %>
<%
							if(admin==null){
							%>
				<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a> 
				<%} %>
				<%
							if(admin!=null || user!=null){
							%>
				<li class="nav-item"><a class="nav-link"
					href="Login_Serve?process=logout">logout</a></li>
				<%} %>
				</ul>
			</div>
	</div>
	</nav>
	</div>


</body>
</html>