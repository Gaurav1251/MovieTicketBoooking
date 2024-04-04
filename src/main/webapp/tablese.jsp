<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <link rel="stylesheet" href="css/seat.css">
    <style>
        input[type=checkbox] {
            width: 0px;
            margin-right: 18px;
        }
       
        input[type=checkbox]:before {
            content: "";
            width: 20px;
            height: 20px;
             border: 0.3mm solid white;
            display: inline-block;
            vertical-align: middle;
            text-align: center;
            box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px
                rgba(255, 255, 255, .8);
             background-color: #444451;
        }
        
        input[type=checkbox]:checked:before {
            background-color: Green;
            font-size: 15px;
        }
        
        input[disabled=checkbox]:disabled {
            background-color: rgb(44, 24, 189);
            font-size: 15px;
        }
        
        </style>
</head>
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
    
    <table class="rows">
        <tr>
        <td></td>
        <td>1</td>
        <td>2</td>
        <td>3</td>
        <td>4</td>
        <td>5</td>
        <td>6</td>
        <td>7</td>
        <td>8</td>
        <td>9</td>
        <td>10</td>
        
        </tr>
        <tr> 
        <td>A </td>
        <td> <input type="checkbox" name="" value="A1" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="A2" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="A3" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="A4" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="A5" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="A6" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="A7" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="A8" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="A9" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="A10" id="" class="seat"></td>
        </tr>
        <tr> 
        <td>B </td>
        <td> <input type="checkbox" name="" value="B1" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="B2" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="B3" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="B4" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="B5" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="B6" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="B7" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="B8" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="B9" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="B10" id="" class="seat"></td>
        </tr>
        <tr> 
        <td>C </td>
        <td> <input type="checkbox" name="" value="C1" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="C2" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="C3" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="C4" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="C5" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="C6" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="C7" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="C8" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="C9" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="C10" id="" class="seat"></td>
        </tr>
        <tr> 
        <td>D </td>
        <td> <input type="checkbox" name="" value="D1" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="D2" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="D3" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="D4" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="D5" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="D6" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="D7" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="D8" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="D9" id="" class="seat"></td>
        <td> <input type="checkbox" name="" value="D10" id="" class="seat"></td>
        </tr>
        </table>
</div>


</body>

</html>