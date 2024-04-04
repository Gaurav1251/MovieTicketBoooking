<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.bot {
	bottom: 0;
	
	width: 100%;
}

.container.bg-white {
	box-shadow: 1px 1px 8px 0px white;
	border-radius: 20px;
	width: 510px;
	background-image: url("images/RC.jpg");
}

section:not(.about){
	background-image: url("images/about.webp");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
}




.about {
    max-width: 800px;
    margin: 50px auto;
    padding: 20px;
    border: 1px solid #ddd;
   background: white;
   	box-shadow: 1px 1px 8px 0px white;
   font-weight: 500;
   font-family: serif;
   
}

.about h2, .about h3 {
    margin-bottom: 10px;
    text-decoration: underline;
    font-family: monospace;
}


</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section class="py-5">

		<div class="container bg-white">


			<div class="moviecontainer">


				<div class="container">

<section class="about">
					<h2>About Us</h2>
					<p>Welcome to BookYourShow.Com</p>
					<p>At <span class="company-name">BookYourShow.Com</span>, we are dedicated to <span class="mission">briefly describe our company's mission and values</span>. With a commitment to excellence and innovation, we strive to <span class="usp">highlight our unique selling proposition or what sets you apart from competitors</span>.</p>
            


<h3>Our Story</h3>
            <p>Founded in 2021 <span class="establishment-year"> Year of Establishment</span>, <span class="company-name">BookYourShow.Com</span> has evolved from a humble beginning into a <span class="achievements">creative agency, dedicated to the best result in web design, promotion, business consulting, and marketing</span>.</p>
            
           <p> Our team's relentless passion and hard work have helped us carve a niche for ourselves in the <span class="industry">Movie Industry/Niche</span> sector.</p>
       </section>

				</div>
			</div>


		</div>

	</section>

	<div class="bot">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>


</body>
</html>