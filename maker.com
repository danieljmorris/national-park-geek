# national-park-geek
Given a database with information regarding multiple national parks we had to create a multipage website. The homepage displays an image and short description of each national park in the database. Users could click on the image or the park name to go to a new page with more details about the park as well as a five day weather forecast for that park. Using session attributes, the user could choose the temperature to be in Fahrenheit or Celsius and their choice would be persistent when viewing other park detail pages. The site also includes a survey form for users. Once filled out the information is added to the database and the user is redirected to a survey results page listing the top five parks with the most surveys submitted. No parks with zero surveys are shown. This project is an exercise using the MCV design pattern. We were responsible for writing the controller, models and views using the Spring and JDBC frameworks.
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project1</title>
    <link rel="stylesheet" href="css/style.css">
    </head>
    <link href="https://fonts.google.com/specimen/Baloo+Bhai+2?query=baloo+bhai" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        body{
            font-family: "Baloo Bhai 2", cursive;
            color: white;
            margin: 0px;
            padding: 0px;
            background-image: url("https://cdn.pixabay.com/photo/2013/03/09/14/38/machines-91849__340.jpg");
            background-size: cover;
            background-attachment: fixed;
            height: 4544px;

        }
        .left{
            display: inline-block;
            border: 2px solid red;
            position: absolute;
            left: 34px;
            text-align: center;
        }
        .left img{
            width: 45px;
        }
        .mid{
            display:block;
            width: 33%;
            margin: 12px auto;
            text-align: center;
             border: 2px solid green;


        }
        .right{ 
            position :absolute;
            right: 34px;
            top: 22px;
            display:inline-block;
            border: 2px solid yellow;

        }
        .navbar{
            display: inline-block;
            
        }
       
        .navbar li a:hover, .navbar li a.active{
            text-decoration: underline;
            color: grey;
            color: rgb(134, 13, 134);
        }
        .navbar li a{
            color: white;
            padding: 23px 34px;
        }
        .btn{
            font-family: "Baloo Bhai 2", cursive;
            margin: 0px 9px;
            background-color: rgb(8, 0, 0);
            color: white;
            padding : 4px 14px;
            border: 2px solid gray;
            border-radius: 10px;
            font-size: 20px;
            cursor: pointer;
        }
        .btn:hover{
            background-color: rgb(19, 117, 19);
        }
        .container{
            border: 2px solid white;
            margin : 106px 80px;
            padding: 75px;
            width: 33%;
            border-radius: 28px; 
        }
        .form-group input{
            text-align: center;
            display: block;
            width:345px;
            padding: 10px;
            border: 2px solid rgb(22, 21, 21);
            border-radius: 25px;
            font-size: 25px;
            margin: 11px auto;
            font-family: "Baloo Bhai 2", cursive;
        }
        .container h1{
            text-align: center;
        }
        .form-group button{
            display:block;
            margin:auto;
            width: 23%;

        }

    </style>
<body>
    <header class="header">
        <div class="left">
       <img src="https://cdn.pixabay.com/photo/2016/11/05/08/27/barbel-1799666__340.png" alt="">
       <div>Prashant's Fitness</div>
        </div>
        <div class="mid">
            <ul class="navbar">
        <li><a href="#"class="Active">Home</a></li>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Fitness Calculator</a></li>
        <li><a href="#">Contact Us</a></li>
        </ul>
        </div>
        <div class="right">
            <button class="btn">Call us Now</button><button class="btn">Email Us</button>
        </div>
    </header>
    <div class="container">
        <h1>Join the Best GYM of delhi now</h1>
        <form action="noaction.php">
            <div class="form-group">
                <input type="text" name="" placeholder="Enter your name">
                <input type="text" name="" placeholder="Enter your E-mail id">
                <input type="text" name="" placeholder="Enter your phone number">
                <button class="btn">Submit</button>
            </div>

        </form>
    </div>
    
</body>
</html>
