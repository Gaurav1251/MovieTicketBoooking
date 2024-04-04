<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <link rel="stylesheet" href="css/seat.css">
</head>
<script src="js/jq.js"></script>
<script type="text/javascript">
function count() {
	const count=$(".rows >.seat.selected").length;
    

	console.log(count );
}


$(document).ready(function(){
    $(".rows > .seat").click(function(){
        $(this).toggleClass("seat seat selected");
        count();
        
    })
})
</script>
<body>

    <div class="movie-container">

        <h4>Movie Name</h4>

    </div>
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
            sold
        </small>
    </div>
</li>
    </ul>


<div class="container">

    <div class="screen">

        <h2 style="color:black;text-align:center;margin:auto;padding: 30px">Screen</h2>
    </div>
    <div class="rows" >
        <div class="seat" data-seat="A1"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
 		<label>A </label>

    </div>
    <div class="rows">
       
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
	  	<label>B </label>

    </div>
    <div class="rows">
      
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
	 	 <label>C  </label>

    </div>
    <div class="rows">
       
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
		 <label>D </label>

    </div>
    <div class="rows">
       
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
		 <label>E  </label>

    </div> 
</div>
<p class="text">
    You Have Selected <span id="count"> 0 </span> Seat for Price of <span id="total">0</span>
</p>

</body>

</html>