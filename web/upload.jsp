<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>File Upload</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="popup.css">
        <link rel="icon" href="input/logo.png">
        <style>
            form{
                /*                background-image: url("image/logo.png");
                                background-repeat: no-repeat;*/
                width: 100%;
            }
            body{
                overflow-x: hidden;
            }

        </style>

        <link rel="stylesheet" type="text/css" href="css/index.css">
        <link rel="stylesheet" type="text/css" href="css/button.css">
    </head>
    <header>
        <a href="index.jsp"><img id="logo" src="input/logo.png" alt="Institute of Engineering &amp; Technology"></a>
        <h2>Institute Of Engineering &amp; Technology</h2>
        <div class="menu">
            <a href="index.jsp">Home</a>
        </div>
    </header>
    <div>
        <body>
           
            
                 <%!
            String subject_codes[];
            String query1;
            String eno;
            String status;
            String query2;
            String rollno;
            String tid;
        %>
        <%
            rollno=request.getParameter("rollno");
//            tid = request.getParameter("tid");
//            out.println("ravindra"+tid);
////            out.println(roll_no);
//            HttpSession session1 = request.getSession();
//            eno = (String) session1.getAttribute("e");
//            status = (String) session1.getAttribute("s");
//            ServletContext context = getServletContext();
            %>
            <div class="panel" style="position: absolute;margin-top: 5%;">
                <div class="panel">

                    <div >

                        <table width="300" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" >
                            <tr>
                            <form name="f1" method="post" action="submit.jsp?rollno=<%= rollno%>" enctype="multipart/form-data" >
                                <td>
                                    <table width="400" height="200" border="4" cellpadding="5" cellspacing="5" bgcolor="#FFFFFF">
                                        <tr>
                                            <td colspan="3" align="center">
                                                <div style="color:blue;"><b>Upload Slip </b></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="100%">
                                                <div style="font-size:17px;"><center><strong>Session</strong> </center></div>
                                            </td>
                                            <td width="6">:</td>
                                            <td><select name="session"  required>
                                                    <option value="" selected disabled >Select Session</option>
                                                    <option value="July-Dec-2019">July-Dec-2019</option>
                                                    <option value="Jan-may-2020">Jan-may-2020</option>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td width="100">
                                                <div style="font-size:17px;"><center><strong>Application Id</strong></center></div>
                                            </td>
                                            <td width="6">:</td>
                                            <td width="294"><input type="text" name="application_id" required /></td>
                                        </tr>
                                        <tr>
                                            <td width="78">
                                                <div style="font-size:17px;"><center><strong>Choose file</strong></center></div>
                                            </td>
                                            <td width="6">:</td>
                                            <td width="294"><input type="file" name="image" required /></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <center>
                                                    <input type="submit"  name="submit" value="Submit"> 
                                                    &nbsp;&nbsp;&nbsp;

                                                </center>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </form>
                            </tr>
                        </table>

                    </div>


                </div>

                <!--</div>-->
        </body>
        <footer style="position: relative;top:10px;">
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