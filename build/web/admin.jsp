
<%@page import = "javax.servlet.http.HttpServlet" %>
<%@page import= "javax.servlet.http.HttpServletRequest" %>
<%@page import = "javax.servlet.http.HttpServletResponse" %>
<%@page import= "java.sql.*" %>
<%@page import = "javax.servlet.http.HttpSession" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <title>ADMINISTRATION</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="input/logo.png">
        <style>
            #main{
                border-radius: 25px;
                border: 1px gray ;
                padding-top: 2%;
                margin-left: 20px;
                margin-right: 20px;
                width: 390px;
                height: 400px;
                 }
                 .button {
  background-color:#8793cc;
   padding: 5px 40px;
  text-align: center;
  font-size: 16px;
    margin: 4px 2px;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;
  border:none;
  border-radius: 5px;
}
               .button:hover {
background-color:#737171;
}
        </style>
        <script type="text/javascript" src="jquery.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
                $("#slide_box").hide();
                $("#slide_box").slideDown(1000);
                $("main").css({"height":""})
                
		});
	</script>
    <link rel="stylesheet" type="text/css" href="css/index.css">
     
    </head>
    <header>
<a href="index.jsp"><img id="logo" src="input/logo.png" alt="Institute of Engineering &amp; Technology"></a>
<h2>Institute Of Engineering &amp; Technology</h2>
<div class="menu">
<!--  <a href="student_select.jsp">Student_Admit_Card</a>-->
 <!-- <a href="Register_sel.jsp">Student_Registration</a>-->
  <a href="admin.jsp">Admin</a>
  <a href="index.jsp">Home</a>
</div>

</header>
<center>
    
   <form action="details.jsp" method="post">
   <div id="main">
<!--<hr><h1>ADMINISTRATION</h1><hr>-->
<div id="slide_box">
    
    
<table id="t2">
<tr>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}



button:hover {
    opacity: 0.8;
    background-color: red;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>
</head>
<body>
    <div style="border: 1px solid;padding: 20px;border-radius: 12px;">
    <h3 style="color: rgb(2, 159, 91)">PLEASE LOGIN </h3><hr>
    <div class="container">
        <label for="uname"><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="uname" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pass" required>
        
   <!-- <button type="submit">Login</button>-->
    
  </div>
<input class="button" style="margin-top:10px; width: 302px;height: 40px;font-size:22px;font-style: bold;" type="submit"  name="btn" value="LOGIN" >   
 </body>
</html>

<!--end my demo-->

</table>
</div> 
</div>
 <input type="hidden" value="admin" name="page">
 </form>
   
</center>
</div>
</body>
<footer>
<p align="center" id="p1">
Exam Registration Portal
</p>
<hr align="center" width="60%">
<p align="center" id="p2">
  Developed & Designed by :- Hemant Sir,Ravindra Kumar Kushwaha and Sumit kr.

        For any queries contact ravindrakushwahanwg@gmail.com.
        Copyright © 2019 IET DAVV. All right reserved.
</p>
    
</footer>
</html>
