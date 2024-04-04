<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
  <!-- Bootstrap CSS -->
  <link rel="icon" type="image/*" href="images/logo.png"/>
  <link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.3.1.slim.min.js" ></script>
<script src="js/popper.min.js" ></script>
<script src="js/bootstrap.min.js" ></script>
	<script src="js/jquery.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->
	
	<link href="css/font-awesome.min.css" rel="stylesheet">
	
	<link href="css/main.css" rel="stylesheet">
	<script type="text/javascript">
		$(function(){
			$("li.nav-item").click(function(){
				 $('li.nav-item').removeClass('active'); 
				 $(this).addClass('active'); 
			});
		})
	</script>
	<style type="text/css">
	.movie-card:hover label{
	font-weight: 900;

	text-decoration: underline;
	
}

.movie-card label{
color:black;
font-family:sans-serif;
font-weight: 900;
}
.movie-title{
text-decoration: none;
color: black;
}
.movie-title:hover{
color: black;
text-decoration: none;
transform:scale(1.1);
}
	</style>
</head>
<body >
<%

String user=(String)session.getAttribute("user");
String admin=(String)session.getAttribute("Admin");
%>
		<jsp:include page="header.jsp"></jsp:include>
<section class="py-5">

		<div class="container bg-white">
	
			<div class="moviecontainer">
				<div class="container">
				<jsp:include page="msg.jsp"></jsp:include>
	<header>
	  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
	    <ol class="carousel-indicators">
	      <li data-target="#carouselExampleIndicators" data-slide-to="0"></li>
	      <li data-target="#carouselExampleIndicators" data-slide-to="1"  class="active"></li>
	      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	    </ol>
	    <div class="carousel-inner" role="listbox">
	      <!-- Slide Three - Set the background image for this slide in the line below -->
	      <div class="carousel-item" style="background-image: url('images/mission.jpg')">
	        <div class="carousel-caption d-none d-md-block">
	        <!--   <h2 class="display-4">Third Slide</h2>
	          <p class="lead">This is a description for the third slide.</p> -->
	        </div>
	      </div>
	      <!-- Slide One - Set the background image for this slide in the line below -->
	      <div class="carousel-item active" style="background-image: url('images/jawan.webp')" >
	        <div class="carousel-caption d-none d-md-block">
	          <!-- <h2 class="display-4">First Slide</h2>
	          <p class="lead">This is a description for the first slide.</p> -->
	        </div>
	      </div>
	      <!-- Slide Two - Set the background image for this slide in the line below -->
	      <div class="carousel-item" style="background-image: url('images/rrr.webp')">
	        <div class="carousel-caption d-none d-md-block">
	          <!-- <h2 class="display-4">Second Slide</h2>
	          <p class="lead">This is a description for the second slide.</p> -->
	        </div>
	      </div>
	    </div>
	    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	          <span class="sr-only">Previous</span>
	        </a>
	    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	          <span class="carousel-control-next-icon" aria-hidden="true"></span>
	          <span class="sr-only">Next</span>
	        </a>
	  </div>
	</header>
	<!-- main Content if any -->
	<section class="py-5">
	<div class="container bg-white">
		<div class="moviecontainer">
		<div class="container">
        <div class="row">
          <div class="col-md-4 col-sm-12">
            <div class="section-heading">
              <div class="line-dec"></div>
              <h1 class="page-title">Now Showing... </h1>
            </div>
          </div>
        </div>
      </div>
	  
	<div class="movie-card">
		<div class="movie-header movieimage" style="background-image: url('images/open.jpg'); background-size:100% 100%; background-repeat: no-repeat;">
			<div class="header-icon-container">
				<a href="#">
					<i class="material-icons header-icon"> </i>
				</a>
			</div>
		</div><!--movie-header-->
		<div class="movie-content">
			<div class="movie-content-header">
				<a href="movieServe?process=AllMo">
					<h3 class="movie-title">Oppenheimer</h3>
				</a>
				<div class="imax-logo"></div>
			</div>
			<div class="movie-info">
				
				<div class="info-section">
					<label>Producer</label>
					<span>Emma Thomas,Christopher Nolan</span>
				</div><!--Producer-->
				<div class="info-section">
					<label>Director</label>
					<span>Christopher Nolan</span>
				</div><!--Director-->
				<div class="info-section">
					<label>Writer</label>
					<span> Emily Blunt</span>
				</div><!--Director-->
			</div>
			<div class="movie-info">
				<div class="info-section">
					<label>Cast </label>
					<span>Cillian Murphy,Emily Blunt,Christopher Nolan</span>
				</div><!--cast-->
				<div class="info-section">
					<label>Release Date </label>
					<span>July 21, 2023</span>
				</div><!--date-->
			</div>
			<div  class="movie-info">
				<div  class="info-section">
					<%if(user!=null || admin!=null ) {%>
					<a class="btn btn-primary ml-auto" href="movieServe?process=AllMo" role="button">Show's</a>
					<%} if(admin==null && user==null){%>
					<a class="btn btn-primary ml-auto" href="movieServe?process=AllMo" role="button">Show's</a>
					<%} %>
				</div>
			</div>
		</div><!--movie-content-->
	</div><!--movie-card-->
	<div class="movie-card">
		<div class="movie-header movieimage" style="background-image: url('images/bdp1.jpg');background-size: 100% 100%;">
			<div class="header-icon-container">
				<a href="#">
					<i class="material-icons header-icon"> </i>
				</a>
			</div>
		</div><!--movie-header-->
		<div class="movie-content">
			<div class="movie-content-header">
				<a href="movieServe?process=AllMo">
					<h3 class="movie-title">Baipan Bhaari Deva</h3>
				</a>
				<div class="imax-logo"></div>
			</div>
			<div class="movie-info">
				
				<div class="info-section">
					<label>Producer</label>
					<span>Madhuri Bhosale,Bela Shinde</span>
				</div><!--Producer-->
				<div class="info-section">
					<label>Director</label>
					<span>	Kedar Shinde</span>
				</div><!--Director-->
				<div class="info-section">
					<label>Writer</label>
					<span>	Vaishali Naik</span>
				</div><!--Director-->
			</div>
			<div class="movie-info">
				<div class="info-section">
					<label>Cast </label>
					<span>	
	
Rohini Hattangadi,Vandana Gupte,Sukanya Kulkarni,Suchitra Bandekar,Deepa Parab,Shilpa Navalkar</span>
				</div><!--cast-->
				<div class="info-section">
					<label>Release Date </label>
					<span>30 June 2023</span>
				</div><!--date-->
			</div>
			<div  class="movie-info">
				<div  class="info-section">
					<a class="btn btn-primary ml-auto" href="movieServe?process=AllMo" role="button">Show's</a>
				</div>
			</div>
		</div><!--movie-content-->
	</div><!--movie-card-->
	  <div class="movie-card">
		<div class="movie-header movieimage" style="background-image: url('images/Barbie.webp');background-size:100% 100%;">
			<div class="header-icon-container">
				<a href="#">
					<i class="material-icons header-icon"> </i>
				</a>
			</div>
		</div><!--movie-header-->
		<div class="movie-content">
			<div class="movie-content-header">
				<a href="movieServe?process=AllMo">
					<h3 class="movie-title">Barbie</h3>
				</a>
				<div class="imax-logo"></div>
			</div>
			<div class="movie-info">
				
				<div class="info-section">
					<label>Producer</label>
					<span>David Heyman,
Margot Robbie</span>
				</div><!--Producer-->
				<div class="info-section">
					<label>Director</label>
					<span>Greta Gerwig</span>
				</div><!--Director-->
				<div class="info-section">
					<label>Writer</label>
					<span>Margot Robbie,Greta Gerwig</span>
				</div><!--Director-->
			</div>
			<div class="movie-info">
				<div class="info-section">
					<label>Cast </label>
					<span>	
Margot Robbie,
Ryan Gosling,
America Ferrera </span>
				</div><!--cast-->
				<div class="info-section">
					<label>Release Date </label>
					<span>July 21, 2023  </span>
				</div><!--date-->
			</div>
			<div  class="movie-info">
				<div  class="info-section">
					<a class="btn btn-primary ml-auto" href="movieServe?process=AllMo" role="button">Show's</a>
				</div>
			</div>
		</div><!--movie-content-->
	</div><!--movie-card-->

	
	</div>
	</div>
	</section>	
	<section class="py-5">
	<div class="container bg-white">
		<div class="moviecontainer">
		<div class="container">
        <div class="row">
          <div class="col-md-4 col-sm-12">
            <div class="section-heading">
              <div class="line-dec"></div>
              <h1 class="page-title">Up Coming Movies... </h1>
            </div>
          </div>
        </div>
      </div>
	  <div class="movie-card">
		<div class="movie-header movieimage" style="background-image: url('images/jawa2.webp');">
			<div class="header-icon-container">
				<a href="#">
					<i class="material-icons header-icon"> </i>
				</a>
			</div>
		</div><!--movie-header-->
		<div class="movie-content">
			<div class="movie-content-header">
				<a href="movieServe?process=AllMo">
					<h3 class="movie-title">Jawan</h3>
				</a>
				<div class="imax-logo"></div>
			</div>
			<div class="movie-info">
				
				<div class="info-section">
					<label>Producer</label>
					<span>	
	Gauri Khan,
Gaurav Verma</span>
				</div><!--Producer-->
				<div class="info-section">
					<label>Director</label>
					<span>Atlee</span>
				</div><!--Director-->
				<div class="info-section">
					<label>Writer</label>
					<span>	Sumit Arora</span>
				</div><!--Director-->
			</div>
			<div class="movie-info">
				<div class="info-section">
					<label>Cast </label>
					<span>	ShahRukh Khan,Nayanthara,Vijay Sethupathi</span>
				</div><!--cast-->
				<div class="info-section">
					<label>Release Date </label>
					<span>	
7 Sept 2023 </span>
				</div><!--date-->
			</div>
			<div  class="movie-info">
				<div  class="info-section">
					<a class="btn btn-primary ml-auto" href="movieServe?process=AllMo" role="button">Coming Soon...</a>
				</div>
			</div>
		</div><!--movie-content-->
	</div><!--movie-card-->
	<div class="movie-card">
		<div class="movie-header movieimage" style="background-image: url('images/meg.avif');background-size: 100% 100%; background-repeat: no-repeat;">
			<div class="header-icon-container">
				<a href="#">
					<i class="material-icons header-icon"> </i>
				</a>
			</div>
		</div><!--movie-header-->
		<div class="movie-content">
			<div class="movie-content-header">
				<a href="movieServe?process=AllMo">
					<h3 class="movie-title">Meg 2: The Trench</h3>
				</a>
				<div class="imax-logo"></div>
			</div>
			<div class="movie-info">
				
				<div class="info-section">
					<label>Producer</label>
					<span>Lorenzo di Bonaventura,Belle Avery</span>
				</div><!--Producer-->
				<div class="info-section">
					<label>Director</label>
					<span>	Ben Wheatley</span>
				</div><!--Director-->
				<div class="info-section">
					<label>Writer</label>
					<span>Dean Georgaris,
Jon Hoeber</span>
				</div><!--Director-->
			</div>
			<div class="movie-info">
				<div class="info-section">
					<label>Cast </label>
					<span>Jason Statham,
Wu Jing,
Sophia Cai</span>
				</div><!--cast-->
				<div class="info-section">
					<label>Release Date </label>
					<span>	
August 4, 2023</span>
				</div><!--date-->
			</div>
			<div  class="movie-info">
				<div  class="info-section">
					<a class="btn btn-primary ml-auto" href="movieServe?process=AllMo" role="button">Coming Soon...</a>
				</div>
			</div>
		</div><!--movie-content-->
	</div><!--movie-card-->
	
	<div class="movie-card">
		<div class="movie-header movieimage" style="background-image: url('images/Gadar2.jpg');background-size:90% 115%;background-repeat: no-repeat;">
			<div class="header-icon-container">
				<a href="#">
					<i class="material-icons header-icon"> </i>
				</a>
			</div>
		</div>
		<!--movie-header-->
		<div class="movie-content">
			<div class="movie-content-header">
				<a href="movieServe?process=AllMo">
					<h3 class="movie-title">Gadar 2</h3>
				</a>
				<div class="imax-logo"></div>
			</div>
			<div class="movie-info">
				<div class="info-section">
					<label>Producer</label>
					<span>	Anil     Sharma,
					Sanjay Sankla</span>
				</div><!--Producer-->
				<div class="info-section">
					<label>Director</label>
					<span>	Anil Sharma</span>
				</div><!--Director-->
				<div class="info-section">
					<label>Writer</label>
					<span>Shaktimaan Talwar</span>
				</div><!--Director-->
			</div>
			<div class="movie-info">
				<div class="info-section">
					<label>Cast </label>
					<span>	
Sunny Deol,
Ameesha Patel,
Utkarsh Sharma,
Simrat Kaur</span>
				</div><!--cast-->
				<div class="info-section">
					<label>Release Date </label>
					<span>11 August 2023 </span>
				</div><!--date-->
			</div>
			<div  class="movie-info">
				<div  class="info-section">
					<a class="btn btn-primary ml-auto" href="movieServe?process=AllMo" role="button">Coming Soon...</a>
				</div>
			</div>
		</div><!--movie-content-->
	</div><!--movie-card-->
	
	</div>
	</div>
	</section>	
	</div>
	</div>
	</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>