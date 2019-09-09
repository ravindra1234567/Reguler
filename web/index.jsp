<%-- 
    Document   : index
    Created on : 14 Jul, 2019, 12:55:18 AM
    Author     : Ravindra
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Exam Registration Portal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="input/logo.png">
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        
        <script type="text/javascript">

            function Redirect()
            {

                var status = document.getElementById("status").value;
                if (status === "Regular"){
                    document.getElementById("f1").action = "student_registration.jsp";
			
        }else{
                    
                        alert("Record Not Found.........");
			window.location="index.jsp";
			
		}
                
                
                
                    //document.getElementById("f1").action = "student.jsp";

            }
        </script>
        <link rel="stylesheet" type="text/css" href="css/index.css" >
        <style>
            .div1{
                border-radius: 25px;
                border: 2px solid;
                padding: 10px;
                padding-top: 0px;
                margin-top: 50px;
                margin-left: 20px;
                margin-right: 20px;
                margin-bottom: 50px;
                width: 1100px;
            }

            #t1{
                background-color: #B0C4DE;
                width: 1000px;
                font-family:calibri;
                font-weight: bolder;
                font-size: 17px;
                margin-top: 1px; 
            }

            #t2{
                font-family:calibri;
                border-collapse:collapse;
                width: 1000px;
                border-color: grey;
                font-size: 15px;
            }

        </style>
    </head>
    <header>
        <a href="index.jsp"><img id="logo" src="input/logo.png" alt="Institute of Engineering &amp; Technology"></a>
        <h2>Institute Of Engineering &amp; Technology</h2>
        <div class="menu">
            <a href="admin.jsp">Admin</a>
            <a href="index.jsp">Home</a>
        </div>
    </header>
    <body>

    <center>
        <form id="f1">
            <div class="div1">
                <h3 style="text-align:center">Examination Registration Portal</h3><hr width="95%">

                <table id="t1">
                    <tr><td style="text-align: center;">LOGIN</td></tr>
                </table>

                <table border="1" id="t2">
                    <tr>
                        <td id="td1">
                            <b>Please Enter Enroll Number</b>
                        </td>
                        <td>
                            <input class="input"  id="eno" type="text" name="enrollmentno" maxlength="7" minlength="7"  required  />
                        </td>
                    </tr>

                    <tr>
                        <td id="td1">
                            <b>Select Student Status</b>
                        </td>
                        <td>
                            <select class="input"  id="status" name="status" required="">
                                <option value="">--Select Status--</option>
                                <option>Regular</option>
                                <option>Ex</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td  id="td1">
                            <b>Select Student Semester</b>
                        </td>
                        <td>
                            <select class="input" id="sem" name="sem" required="">
                                <option value="">--Select Semester--</option>
                                <option value="1">1Sem</option>
                                <option value="2">2Sem</option>
                                <option value="3">3Sem</option>
                                <option value="4">4Sem</option>
                                <option value="5">5Sem</option>
                                <option value="6">6Sem</option>
                                <option value="7">7Sem</option> 
                                <option value="8">8Sem</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td  id="td1">
                            <b>Select Branch</b>
                        </td>

                        <td>
                            <select name="branch" required="">
                                <option value="">Select Branch</option>
                                <option value="Computer Engineering">Computer Engineering</option>
                                <option value="Electronics & Telecommunication Engineering">Electronics & Telecommunication Engineering</option>
                                <option value="Information Technology">Information Technology</option>
                                <option value="Mechanical Engineering">Mechanical Engineering</option>
                                <option value="Civil Engineering">Civil Engineering</option>
                                <option value="Electronics & Instrumentation Engineering">Electronics & Instrumentation Engineering</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td  id="td1">
                            <b>Select Course</b>
                        </td>
                        <td>
                            <select class="input" id="course" name="course" required="">
                                <option value="">--Select Course--</option>
                                <option value="BF">BE</option>
                                <option value="BP(PT)">BE(PT)</option>
                                <option value="MF">ME</option>
                                <option value="MP(PT)">ME(PT)</option>
                                <option value="MS">MSC</option>
                                <option value="MSC(PT)">MSC(PT)</option>
                            </select>
                        </td>
                    </tr>
                </table>

                <input class="btn" type="submit" name="btn" value="GO" onclick="Redirect()">
                <input class="btn" type="button" name="cbtn" value="Cancel">

            </div>
        </form>
    </center>
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
