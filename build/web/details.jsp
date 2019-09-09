<%-- 
    Document   : details
    Created on : 14 Jul, 2019, 11:01:59 AM
    Author     : Ravindra
--%>
<%@page import="javax.servlet.http.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="popup.css">
        <link rel="icon" href="input/logo.png">
        <title>Admin Home</title>
        <script>

            function fun1()
            {
                //alert("hi");
                if (typeof XMLHttpRequest != "undefined")
                {
                    xmlHttp = new XMLHttpRequest();

                }

                else if (window.ActiveXObject)
                {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");

                }

                if (xmlHttp == null)
                {
                    alert("Browser does not support XMLHTTP Request")
                    return
                }
                var url = "clerk_ex1.jsp";
                xmlHttp.onreadystatechange = state;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }
            function state()

            {
                if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete")
                {

                    a = document.getElementById("d1");
                    a.style.background = "#ffff99";
                    a.style.color = "black";
                    a.innerHTML = xmlHttp.responseText;

                }
            }
        </script>

        <style>
            .accordion {
                background-color: rgb(92, 184, 92);
                color: white;
                cursor: pointer;
                padding: 20px;
                width: 400px;
                border: solid;
                text-align: left;
                outline: none;
                font-size: 20px;
                font-family: sans-serif;
                transition: 0.4s;





            }

            .active{
                background-color: rgb(92, 184, 92);
            }
            .accordion:hover {
                background-color: rgb(166, 186, 216);
            }

            .accordion:after {
                background-color: rgb(92, 184, 92);
                font-weight: bold;
                float: right;
                margin-left: 5px;

            }

            .active:after {
                background-color:  rgb(92, 184, 92);
            }

            .panel {
                margin-left: 30%;
                align-content: center;
                padding-left: 10%;
                position: absolute;
                margin-top: 7%;
                width: 750px;
                height: 80%;
                max-height: 0;
                overflow: hidden;
                transition: max-height 0.2s ease-out;
            }
            table{
                font-family: sans-serif;
                font-size: 18px;
                width: 650px;
            }
            input{
                font-size: 18px;
            }
            select{
                font-size: 18px;
                width: 70%;
            }
            .semStyle{
                font-style: century-gothis;
                font-size:30px;
            }
        </style>

        <link rel="stylesheet" type="text/css" href="css/index.css">
        <link rel="stylesheet" type="text/css" href="css/button.css">
        <script type="text/javascript" >

            function Redirect()
            {
                var status = document.getElementById("status").value;


                if (status === "Regular") {

                    document.getElementById("f1").action = "admit_card.jsp";
                }
                else if (status == "Ex")
                    document.getElementById("f1").action = "ex_student_admitcard.jsp";

            }

            function Reg()
            {

                var status_1 = document.getElementById("status_reg").value;
                if (status_1 === "Regular")
                    document.getElementById("form1").action = "reg_not_reg.jsp";
                else
                    document.getElementById("form1").action = "reg_not_reg_ex.jsp";
            }
        </script>
    </head>
    <body>  

        <%!
            HttpSession session1;
            String page1;
            String pass, pass1;
            String uname, uname1;
            String query;
            ServletContext context;


        %>

        <%

            page1 = request.getParameter("page");//for different responses
            if (page1.equals("admin")) {
                pass = request.getParameter("pass");
                uname = request.getParameter("uname");
                query = "select * from administration where user_name=?";

                context = getServletContext();
                Class.forName(context.getInitParameter("Driver"));
                Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

                PreparedStatement pd = con.prepareStatement(query);
                pd.setString(1, uname);
                ResultSet rs = pd.executeQuery();
                if (rs.next()) {
                    uname1 = rs.getString(1);
                    pass1 = rs.getString(2);
                }
                if (uname.equals(uname1) && pass.equals(pass1)) {
                    session1 = request.getSession();
                    session1.setAttribute("uname", uname);
                    session1.setAttribute("pass", pass);
                } else {
                    response.sendRedirect("admin.jsp");
                }

            } else if (page1.equals("fileupload")) {
                int value = Integer.parseInt(request.getParameter("value"));

        %>


        <!-- The Modal -->
        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">


                <%                        if (value == -1) {
                %>

                <div class="modal-header" style="background-color: #cc240c">
                    <span class="close">&times;</span>
                    <h1 align="center">&#10006;</h1>
                </div>
                <div class="modal-body">
                    <p style="color:black;">File Upload Opertion Abort</p>
                    <%
                    } else {
                    %>
                    <div class="modal-header" style="background-color:  #419041;">
                        <span class="close">&times;</span>
                        <h1 align="center">&#10004;</h1>
                    </div>
                    <div class="modal-body">
                        <p style="color:black;"><%=value%> Records Successfully Entered</p>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
            <script src="popup.js">
            </script>

            <%
                }


            %>

            <header>
                <a href="index.jsp"><img id="logo" src="input/logo.png" alt="Institute of Engineering &amp; Technology"></a>
                <h2>Institute Of Engineering &amp; Technology</h2>
                <div class="menu">
                    <a href="admin.jsp">Admin</a>
                    <a href="index.jsp">Home</a>
                </div>
            </header>

            <img src="input/logo.png" alt="Institute of Engineering &amp; Technology" style="position: absolute;width: 450px;height: 450px;margin-left: 45%;opacity: 0.1;margin-top: 2%">

            <button class="accordion" style="position:absolute;" id="bt1">Student List ( For Deletion )</button>
            <div class="panel" style="position: absolute;margin-top: 5%;">

                    
                <form action="delete_student_record.jsp">
                    <table>
                        <tr><td style="text-align: center;"> <h2 style="color:#800000">Student List</h2></td></tr>
                    </table>
                    <table style="border-style:solid;" >
                        <tr>
                            <th width="50%">Select Course</th>
                            <td><select name="course" required="">
                                    <option value="" selected disabled>Select Course</option>
                                <option value="BF">BE</option>
                                <option value="BP(PT)">BE(PT)</option>
                                <option value="MF">ME</option>
                                <option value="MP(PT)">ME(PT)</option>
                                <option value="MS">MSC</option>
                                <option value="MSC(PT)">MSC(PT)</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Select Branch</th>
                            <td> 
                                <select name="branch" required="">
                                    <option value="" selected disabled>Select Branch</option>
                                    <option value="Computer Engineering">Computer Engineering</option>
                                    <option value="Electronics And Telecommunication Engineering">Electronics And Telecommunication Engineering</option>
                                    <option value="Information Technology">Information Technology</option>
                                    <option value="Mechanical Engineering">Mechanical Engineering</option>
                                    <option value="Civil Engineering">Civil Engineering</option>
                                    <option value="Electronics And Instrumentation Engineering">Electronics And Instrumentation Engineering</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Select Semester</th>
                            <td><select  name="sem" required="">
                                    <option value="" selected disabled>Select sem</option>
                                    <option value="1">1Sem</option>
                                    <option value="2">2Sem</option>
                                    <option value="3">3Sem</option>
                                    <option value="4">4Sem</option>
                                    <option value="5">5Sem</option>   
                                    <option value="6">6Sem</option>
                                    <option value="7">7Sem</option>
                                    <option value="8">8Sem</option>

                                </select></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">  <input type="hidden" value="0" name="i">
                                <input type="submit" value="SUBMIT" class="button" required /></td>
                        </tr>
                    </table><br>

                </form>


            </div>

            <button class="accordion" style="top:200px;position: absolute;" id="bt2">Print RASA Form</button>
            <div class="panel" style="position: absolute;">


                <div id="four">
                    <table>
                        <tr><td style="text-align: center;"> <h2 style="color:#800000">Print RASA Form </h2></td></tr>
                    </table>
                    <form id="f1">

                        <table  style="border-style:groove" >
                            <tr>
                                <th>
                                    Select Status:
                                </th>
                                <td><select name="status"  id="status" style="width:130px" required="">
                                        <option value="" selected disabled>Select Status</option>
                                        <option value="Regular">Regular</option>
                                        <option value="Ex">Ex</option>
                                    </select>
                                </td></tr>

                            <th>
                                Select Branch:
                            </th>
                            <td><select name="branch" style="width:130px" required="">
                                    <option value=""selected disabled>Select Branch</option>
                                    <option value="Computer Engineering">Computer Engineering</option>
                                    <option value="Electronics And Telecommunication Engineering">Electronics And Telecommunication Engineering</option>
                                    <option value="Information Technology">Information Technology</option>
                                    <option value="Mechanical Engineering">Mechanical Engineering</option>
                                    <option value="Civil Engineering">Civil Engineering</option>
                                    <option value="Electronics And Instrumentation Engineering">Electronics And Instrumentation Engineering</option>

                                </select></td>
                            </tr>
                            <tr>
                                <th>
                                    Select Semester
                                </th>
                                <td>
                                    <select name="sem" style="width:130px" required="">
                                        <option value=""selected disabled>Select sem</option>
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
                                <td colspan="2" align="center"><input class="button" type="submit" name="btn" required="" onclick="Redirect()" value="Print"></td>
                            </tr>
                        </table>

                        <br>


                    </form>
                </div>



            </div>





            <button class="accordion" style="top:260px;position: absolute;" id="bt3">  <a href="new_csv_download.jsp" style="color: white;font-size: 20px;font-family: sans-serif;">Download Student ( All CSV Files )</a></button>




            <button class="accordion" style="top:310px;position: absolute;"  id="bt5">Upload Student data</button>
            <div class="panel">

                <div id="one">
                    <form action="student_upload.jsp" enctype="multipart/form-data" method="post">
                        <table width="650px">
                            <tr>
                                <td style="text-align: center;"><h2 style="color:#800000">Upload Student data</h2>

                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <input type="file" name="file" multiple="" required="" />
                                    <input type="submit" value="Upload"/>

                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>



            <!--<button class="accordion" style="top:360px;position: absolute;" id="bt6">Upload Subject Schema </button>-->
            <button class="accordion" style="top:360px;position: absolute;"  id="bt7">Upload Subject Schema </button>
            <div class="panel">
                <div id="one">
                    <form action="subjectAlloc.jsp" action="GET">
                        <table style="border-style:solid;" >
                            <tr>
                                <th width="50%">Select Course</th>
                                <td><select name="course" required="">
                                        <option value="" selected disabled>Course</option>
                                        <option value="BE">BE</option>
                                        <option value="ME">ME</option>
                                        <option value="ME">MSC</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>Select Branch</th>
                                <td> 
                                    <select name="branch" required="">
                                        <option value=""selected disabled>Select Branch</option>
                                        <option value="Computer Engineering">Computer Engineering</option>
                                        <option value="Electronics And Telecommunication Engineering">Electronics And Telecommunication Engineering</option>
                                        <option value="Information Technology">Information Technology</option>
                                        <option value="Mechanical Engineering">Mechanical Engineering</option>
                                        <option value="Civil Engineering">Civil Engineering</option>
                                        <option value="Electronics And Instrumentation Engineering">Electronics And Instrumentation Engineering</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>Select Semester</th>
                                <td><select  name="sem" required="">
                                        <option value="" selected disabled >Select sem</option>
                                        <option value="1">1Sem</option>
                                        <option value="2">2Sem</option>
                                        <option value="3">3Sem</option>
                                        <option value="4">4Sem</option>
                                        <option value="5">5Sem</option>   
                                        <option value="6">6Sem</option>
                                        <option value="7">7Sem</option>
                                        <option value="8">8Sem</option>

                                    </select></td>
                            </tr>
                            <tr>
                                <th>Select Course Type</th>
                                <td><select  name="ctype" required="">
                                        <option value="" selected disabled>Select Course Type</option>
                                        <option value="P">PT</option>
                                        <option value="F">FT</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">  <input type="hidden" value="0" name="i">
                                    <input type="submit" value="SUBMIT" class="button" required=""></td>
                            </tr>
                        </table><br>

                    </form>
                </div>
            </div>



            <button class="accordion" style="top:410px;position: absolute;"  id="bt7">Eligible Student</button>
            <!--<button class="accordion" style="position:absolute;" id="bt1">Student List ( For Deletion )</button>-->
            <div class="panel" style="position: absolute;margin-top: 5%;">


                <form action="eligible_student.jsp">
                    <table>
                        <tr><td style="text-align: center;"> <h2 style="color:#800000">Eligible Student List</h2></td></tr>
                    </table>
                    <table style="border-style:solid;" >
                        <tr>
                            <th width="50%">Select Course</th>
                            <td><select name="course" required="">
                                    <option value="" selected disabled>Course</option>
                                    <option value="BE">BE</option>
                                    <option value="ME">ME</option>
                                    <option value="MSC">MSC</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Select Branch</th>
                            <td> 
                                <select name="branch" required="">
                                    <option value="" selected disabled>Select Branch</option>
                                    <option value="Computer Engineering">Computer Engineering</option>
                                    <option value="Electronics And Telecommunication Engineering">Electronics And Telecommunication Engineering</option>
                                    <option value="Information Technology">Information Technology</option>
                                    <option value="Mechanical Engineering">Mechanical Engineering</option>
                                    <option value="Civil Engineering">Civil Engineering</option>
                                    <option value="Electronics And Instrumentation Engineering">Electronics And Instrumentation Engineering</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Select Semester</th>
                            <td><select  name="sem" required="">
                                    <option value="" selected disabled>Select sem</option>
                                    <option value="1">1Sem</option>
                                    <option value="2">2Sem</option>
                                    <option value="3">3Sem</option>
                                    <option value="4">4Sem</option>
                                    <option value="5">5Sem</option>   
                                    <option value="6">6Sem</option>
                                    <option value="7">7Sem</option>
                                    <option value="8">8Sem</option>

                                </select></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">  <input type="hidden" value="0" name="i">
                                <input type="submit" value="SUBMIT" class="button" required=""></td>
                        </tr>
                    </table><br>

                </form>


            </div>




            <button class="accordion" style="top:460px;position: absolute;"  id="bt8">Not Eligible Student</button>
            <div class="panel" style="position: absolute;margin-top: 5%;">


                <form action="not_eligible_student.jsp">
                    <table>
                        <tr><td style="text-align: center;"> <h2 style="color:#800000">Eligible Student List</h2></td></tr>
                    </table>
                    <table style="border-style:solid;" >
                        <tr>
                            <th width="50%">Select Course</th>
                            <td><select name="course" required="">
                                    <option value="" selected disabled>Course</option>
                                    <option value="BE">BE</option>
                                    <option value="ME">ME</option>
                                    <option value="MSC"> MSC </option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Select Branch</th>
                            <td> 
                                <select name="branch" required="">
                                    <option value="" selected disabled>Select Branch</option>
                                    <option value="Computer Engineering">Computer Engineering</option>
                                    <option value="Electronics And Telecommunication Engineering">Electronics And Telecommunication Engineering</option>
                                    <option value="Information Technology">Information Technology</option>
                                    <option value="Mechanical Engineering">Mechanical Engineering</option>
                                    <option value="Civil Engineering">Civil Engineering</option>
                                    <option value="Electronics And Instrumentation Engineering">Electronics And Instrumentation Engineering</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Select Semester</th>
                            <td><select  name="sem" required="">
                                    <option value="" selected disabled>Select sem</option>
                                    <option value="1">1Sem</option>
                                    <option value="2">2Sem</option>
                                    <option value="3">3Sem</option>
                                    <option value="4">4Sem</option>
                                    <option value="5">5Sem</option>   
                                    <option value="6">6Sem</option>
                                    <option value="7">7Sem</option>
                                    <option value="8">8Sem</option>

                                </select></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">  <input type="hidden" value="0" name="i">
                                <input type="submit" value="SUBMIT" class="button" required=""></td>
                        </tr>
                    </table><br>

                </form>


            </div>


            <button class="accordion" style="position:absolute;top:510px;"  id="bt11">Check Subject Schema </button>
            <div class="panel" style="position: absolute;margin-top: 5%;">
                <form action="check_schema.jsp" method="post">
                     <table style="border-style:solid;" >
                            <tr>
                                <th width="50%">Select Course</th>
                                <td><select name="course" required="">
                                        <option value="" selected disabled>Course</option>
                                        <option value="BE">BE</option>
                                        <option value="ME">ME</option>
                                        <option value="ME">MSC</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>Select Branch</th>
                                <td> 
                                    <select name="branch" required="">
                                        <option value="" selected disabled>Select Branch</option>
                                        <option value="Computer Engineering">Computer Engineering</option>
                                        <option value="Electronics And Telecommunication Engineering">Electronics And Telecommunication Engineering</option>
                                        <option value="Information Technology">Information Technology</option>
                                        <option value="Mechanical Engineering">Mechanical Engineering</option>
                                        <option value="Civil Engineering">Civil Engineering</option>
                                        <option value="Electronics And Instrumentation Engineering">Electronics And Instrumentation Engineering</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>Select Semester</th>
                                <td><select  name="sem" required="">
                                        <option value="" selected disabled >Select sem</option>
                                        <option value="1">1Sem</option>
                                        <option value="2">2Sem</option>
                                        <option value="3">3Sem</option>
                                        <option value="4">4Sem</option>
                                        <option value="5">5Sem</option>   
                                        <option value="6">6Sem</option>
                                        <option value="7">7Sem</option>
                                        <option value="8">8Sem</option>

                                    </select></td>
                            </tr>
                            <tr>
                                <th>Select Course Type</th>
                                <td><select  name="ctype" required="">
                                        <option value="" selected disabled>Select Course Type</option>
                                        <option value="P">PT</option>
                                        <option value="F">FT</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">  <input type="hidden" value="0" name="i">
                                    <input type="submit" value="SUBMIT" class="button" required=""></td>
                            </tr>
                        </table><br>

                </form><br>

            </div>

            <button class="accordion" style="position:absolute;top:560px" id="bt12">Payment Status</button>
            <div class="panel" style="position: absolute;margin-top: 5%;">


                <form id="form1">
                    <table>
                        <tr><td style="text-align: center;"> <h2 style="color:#800000">Payment Status</h2></td></tr>
                    </table>
                    <table style="border-style:solid;" >
                        <tr>
                            <th width="50%">Select Course</th>
                            <td><select name="course" required="">
                                    <option>Course</option>
                                    <option>BE</option>
                                    <option>ME</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Select Branch</th>
                            <td> 
                                <select name="branch" required="">
                                    <option value="" selected disabled>Select Branch</option>
                                    <option value="Computer Engineering">Computer Engineering</option>
                                    <option value="Electronics And Telecommunication Engineering">Electronics And Telecommunication Engineering</option>
                                    <option value="Information Technology">Information Technology</option>
                                    <option value="Mechanical Engineering">Mechanical Engineering</option>
                                    <option value="Civil Engineering">Civil Engineering</option>
                                    <option value="Electronics And Instrumentation Engineering">Electronics And Instrumentation Engineering</option>

                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Select Semester</th>
                            <td><select  name="sem" required="">
                                    <option value=""selected disabled>Select sem</option>
                                    <option value="1">1Sem</option>
                                    <option value="2">2Sem</option>
                                    <option value="3">3Sem</option>
                                    <option value="4">4Sem</option>
                                    <option value="5">5Sem</option>   
                                    <option value="6">6Sem</option>
                                    <option value="7">7Sem</option>
                                    <option value="8">8Sem</option>

                                </select></td>
                        </tr>

                        <tr>
                            <th>Select Status </th>
                            <td><select name="status" id="status_reg" required="">
                                    <option value="" selected disabled>Select status</option>
                                    <option value="Regular">Regular</option>
                                    <option value="Ex">Ex</option>
                                </select></td>
                        </tr>
                        <tr>
                            <th>Registered/Not-Registered</th>
                            <td><select name="reg" required="">
                                    <option value="" selected disabled>Select status</option>
                                    <option value="Paid">Registered</option>
                                    <option value="Unpaid">Not Registered</option>
                                    <option value="Both">Both</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">  <input type="hidden" value="0" name="i">
                                <input class="btn" type="submit" name="btn" value="SUBMIT" onclick="Reg()">
                        </tr>
                    </table><br>
                </form>


            </div>

            <button class="accordion" style="top:660px;position: absolute;"  id="bt7"><a href="show_permission.jsp" style="color: white;font-size: 20px;font-family: sans-serif;">Show Special Permission </a></button>


            <!-- <button class="accordion" style="top:760px;position: absolute;" id="bt6">Upload MPonline List </button>
            <div class="panel">
                <div id="one">
                    <form action="mponline_upload.jsp" enctype="multipart/form-data" method="post">
                   
                    <table width="650px">
                            <tr>
                            <td style="text-align: center;"><h2 style="color:#800000">Upload MPonline List</h2>
                   
                   
                   </td>
                            </tr>
                            <tr>
                            <td align="center">
                            
                    <input type="file" name="file" multiple="" />
                    <input type="submit" value="Upload"/>
                    
                            </td>
                            </tr>
                    </table>
                    </form>
                    </div>
                    
              </div>-->

            <button class="accordion" style="top:610px;position: absolute;"  id="bt7"><a  href="credithome.jsp" style="color: white;font-size: 20px;font-family: sans-serif;">Check Subjects Credits</a></button>
        </div>

        <script>
            var acc = document.getElementsByClassName("accordion");
            var i;
            var last;

            for (i = 0; i < acc.length; i++) {
                acc[i].addEventListener("click", function () {

                    if (last) {
                        var p1 = last.nextElementSibling;
                        p1.style.maxHeight = null;
                    }

                    this.classList.toggle("active");
                    var panel = this.nextElementSibling;
                    if (panel.style.maxHeight) {
                        //  panel.style.maxHeight = null;
                    } else {
                        // panel.style.maxHeight = "100%";
                        panel.style.maxHeight = panel.scrollHeight + "px";
                    }
                    last = this;
                });
            }



        </script>


    </body>
    <footer style="position: relative;top:550px;">
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


