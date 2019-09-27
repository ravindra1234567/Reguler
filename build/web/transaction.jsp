<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%> 
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
    String enrollmentno;
    String roll_no=null;
    String branch;
    String enrollment_no;
    int sem;
    String name;
    String father_name;
    String class_name;
    String course_name;
    String status;
    String paper_code;
    String subject_name;
    String subject_code;
    String subject_type;
    String st1;
    String year;
    ResultSet rs2;

    String subject_name1;
    String subject_code1;
    String subject_type1;
    String st2;
    String st;
    String course = null;
    String coursetype = null;
    int i;
%>


<%
    enrollmentno = request.getParameter("enrollmentno");
    //HttpSession ss = request.getSession();
//    enrollment_no = (String) ss.getAttribute("e");
//    status = (String) ss.getAttribute("s");
//    sem = (String) ss.getAttribute("sem");

//    SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yyyy hh:mm:ss");
//    Date date = new Date();
//    dt = sdf.format(date);
//    sem1 = Integer.parseInt(sem);
//    name = (String) ss.getAttribute("name");
//  
//    if (enrollment_no == null) {
//        response.sendRedirect("index.jsp");
//    }
//    try {
    ServletContext context = getServletContext();
    Class.forName(context.getInitParameter("Driver"));
    Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

    PreparedStatement ps2 = con.prepareStatement("select roll_no,enrollment_no,name,year,branch1 ,all_students.sem1,course1,coursetype1 from all_students,schema_table,subject_table where subject_table.subject_code = schema_table.subcode and all_students.enrollment_no = '" + enrollmentno + "' ");
    rs2 = ps2.executeQuery();
    if (rs2.next()) {
        branch = rs2.getString("branch1");
        enrollmentno = rs2.getString("enrollment_no");
        roll_no = rs2.getString("roll_no");
        year = rs2.getString("year");
        enrollment_no = rs2.getString("enrollment_no");
        name = rs2.getString("name");
        sem = Integer.parseInt(rs2.getString("sem1") );
        course  = rs2.getString("course1");
        coursetype = rs2.getString("coursetype1");

    }
%>


<!DOCTYPE html>

<head>
    <title>Student</title>
    <style>
        #d1{
            border-radius: 25px;
            border: 2px solid;
            padding: 2%;
            width: 800px;
            margin-left: 250px;
            margin-right: 250px;
            border-style: groove;
        }
    </style>
    <link rel="icon" href="input/logo.png">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<header style="width: 1550px;">
    <a href="index.jsp"><img id="logo" src="input/logo.png" alt="Institute of Engineering &amp; Technology"></a>
    <h2>Institute Of Engineering &amp; Technology</h2>
    <div class="menu">
        <a href="index.jsp">Home</a>
    </div>
</header>
<body>
    <div id="menu_bar" style="background-color:yellowgreen;margin-top: 10px;"></div>
<center>
    <div id="d1">
        <hr>
        <h3 align="center">
            UTD Pay-Unpaid Examination Form/Print Reciept ( SEM <%= sem%> )
        </h3>
        <hr>

        <div style="background-color: #B0C4DE;text-align: left;">
            Opted Paper Description(Not In Sequence According To Time Table Of University)
        </div>
        <table cellpadding="4" cellspacing="1" border="1" style="border-collapse:collapse;margin-bottom: 7px;border-color: #cdcdcd" align="Center">
            <tr>

                <td align="left">
                    Name of College(Code)
                </td>
                <td align="left" colspan="4">
                    <span>
                        INSTITUTE OF ENGINEERING &amp; TECHNOLOGY (IET), INDORE(808)</span>
                </td>
                <td rowspan="2" align="center">
                    <img id="ihoto" style="height:120px;width:100px;border-width:0px;"/>
                </td>

            </tr>
            <tr>

                <td align="left">
                    Registration for Examination
                </td>
                <td align="left">
                    <span>Dec-2019</span>
                </td>
                <td align="left">
                    Examination Centre(Code)
                </td>
                <td align="left" colspan="2">
                    <span>INSTITUTE OF ENGINEERING &amp; TECHNOLOGY (IET), INDORE(808)</span>
                </td>

            </tr>
            <tr>

                <td align="left">
                    Name of Course
                </td>
                <td align="left">
                    <span><%%></span>
                </td>
                <td align="left">
                    Programme/Branch(Code)
                </td>
                <td align="left">
                    <div><%= branch%></div>
                </td>
                <td align="left">
                    Semester
                </td>
                <td align="left">
                    <span><%= sem%></span>
                </td>

            </tr>
            <tr>

                <td align="left">
                    Enrollment No.
                </td>
                <td align="left">
                    <span><%= enrollment_no%></span>
                </td>
                <td align="left">
                    Roll No
                </td>
                <td align="left">
                    <span><%= roll_no %></span>
                </td>
                <td align="left">
                    Class
                </td>
                <td align="left">
                    <span><%= year%></span>
                </td>

            </tr>
            <tr>
                <td align="left">
                    Name of Examinee
                </td>
                <td align="left">
                    <div><%= name%></div>
                </td>


                <td align="left">
                    Status
                </td>
                <td align="left">
                    <span><%= "Reguler"%></span>
                </td>

                <td align="left">
                    Gender
                </td>
                <td align="left">
                    <span></span>
                </td>
            </tr>
            <tr>

                <td align="left">
                    Father's Name 
                </td>
                <td align="left" colspan="2">
                    <div></div>
                </td>
                <td align="left">
                    Mother's Name
                </td>
                <td align="left" colspan="2">
                    <span></span>
                </td>

            </tr>

            <tr>

                <td align="left">
                    Category
                </td>
                <td align="left" colspan="2">
                    <div></div>
                </td>
                <td align="left" >
                    Mobile NO
                </td>
                <td align="left" colspan="2">
                    <span></span>
                </td>


            </tr>

            <tr><td align="left">
                    Present Address
                </td>
                <td align="left" colspan="5">
                    <div></div>
                </td></tr>
            <tr>

                <td align="left">
                    City
                </td>
                <td align="left" colspan="2">
                    <span></span>
                </td>
                <td align="left">
                    District
                </td>
                <td align="left" colspan="2">
                    <span></span>
                </td>

            </tr>     


        </table>
        <div class="head1" style="z-index: 730;background-color: #B0C4DE;text-align: left;">
            Subject Description
        </div>
        <table cellspacing="0" rules="all" border="1" id="grdSubject" style="width:100%;border-collapse:collapse;">
            <tr>
               	<th align="left">
                    Paper Code
                </th>
                <th align="left">
                    Paper Description
                </th>
                <th align="left">
                    Paper Type
                </th>
            </tr>
            <tr>
            <%
                //ServletContext context = getServletContext();
                // PreparedStatement ps22 = con.prepareStatement("select subject_code,subject_name,subtype,all_students.sem1 from all_students,schema_table,subject_table where subject_table.subject_code = schema_table.subcode and all_students.roll_no = schema_table.rollno and all_students.roll_no = '" + roll_no + "' ");
                
            PreparedStatement ps22 = con.prepareStatement("SELECT subcode,subtype,subject_name from schema_table,subject_table where schema_table.sem =? and schema_table.branch=? and schema_table.course = ? and  schema_table.coursetype = ? and subject_table.subject_code=schema_table.subcode");
                
                    ps22.setInt(1,sem);
                    ps22.setString(2,branch);
                    ps22.setString(3,course);
                    ps22.setString(4, coursetype);
            ResultSet rs22 = ps22.executeQuery();
                if (rs22.next()) {

                    do {
                        subject_name = rs22.getString("subject_name");
                        subject_code = rs22.getString("subcode");
                        subject_type = rs22.getString("subtype");
                         if (subject_type.equals("1")) {
                                   
                    %>
                    <td align="center"><%=subject_code%></td>
                    <td style="padding: 4px;"><%=subject_name%></td>
                    <td align="center">Practical</td>
                    <%          } 
                                else if (subject_type.equals("0")) {
                      
                    %>
                    <td align="center"><%=subject_code%></td>
                    <td style="padding: 4px;"><%=subject_name%></td>
                    <td align="center">Theory</td>

                    <%
                    } else {
                    %>

                    <td align="center"><%=subject_code%></td>
                    <td style="padding: 4px;"><%=subject_name%></td>
                    <td align="center">Theory</td>
                    
                </tr>
                <tr>
                    <td align="center"><%=subject_code%></td>
                    <td style="padding: 4px;"><%=subject_name%></td>
                    <td align="center">Practical</td>





                    <%  }

          //st2 = st;
                    %>

                    </tr>
                    
                <%                        } while (rs22.next());

                }

            %>       
            
        </table>
    </div>


<%
%>



<div style="width: 1400px;">
    <center>
        <!--<input id="pay" style="margin-top: 10px" type="button" onclick="window.print()" value="   Print   "/>-->
       
    </center>
</div>
</p>






<p style="page-break-after:always"></p>
<center> 

    <div class="relative" id="menu_bar" style="background-color:yellowgreen;margin-top: 10px;"></div>
    <center>
        <div id="d1">

            <hr>
            <h2 align="center"  style=" color: rgb(2,159,91);">
                Institute of Engineering & Technology -DAVV
                <br>   (RASA Form)</br>
            </h2>
            <hr>

            <hr>
            <br>
            <table border="1" style="border-collapse:collapse" width="800px">
                <tr><th>
                        Enrollment Number:
                    </th>
                    <td><%=enrollment_no%></td>
                    <td rowspan="7"><img id="ihoto" src= "show.jsp?image=<%= enrollment_no%>" style="height:185px;width:165px;border-width:0px;"/> </td>
                </tr>

                <tr>
                    <th>Roll No.</th>
                    <td><%=roll_no%></td>


                </tr>

                <tr>
                    <th>Exam Name:</th>
                    <td>DEC 2019</td>
                </tr>

                <tr>
                    <th>Exam Center:</th>
                    <td>INSTITUTE OF ENGINEERING AND TECHNOLOGY(IET),INDORE[808]</td>
                </tr>
                <tr>
                    <th>Exam Month:</th>
                    <td>DEC 2019</td>
                </tr>
                <tr>
                    <th>Name:</th>
                    <td><%=name%></td>
                </tr>

                <tr><th>Father Name:</th>
                    <td> </td>
                </tr>

                <tr><th>Mother Name:
                    </th>
                    <td colspan="2"> </td>
                </tr>

                <tr><th>Gender:</th>
                    <td colspan="2"> </td>
                </tr>
                <tr>
                    <th>Status:</th>
                    <td colspan="2">Regular</td>
                </tr>
            </table>
            <hr>
            <center>
                <br>
                <h3>Opted Paper Description(Not In Sequence According To Time Table Of University)</h3>
                <br>
            </center>
            <table border="1" style="border-collapse:collapse" width="800px">
                <tr><th>Subject Code</th>
                    <th>Subject Name</th>
                    <th>Subject Type</th>
                    <th>Date</th>
                    <th>Candidate's Signature</th>
                    <th>Answer Sheet Number:</th>
                    <th>Invigilator's Signature</th>
                    <th style="width:100px">Signature</th>
                </tr>
                <tr>
                    <%   // For subSchema

                        Class.forName(context.getInitParameter("Driver"));
                        Connection con1 = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

                        PreparedStatement ps1 = con.prepareStatement("select subject_code,subject_name,subtype,all_students.sem1 from all_students,schema_table,subject_table where subject_table.subject_code = schema_table.subcode and all_students.enrollment_no = '" + enrollmentno + "' ");
                        ResultSet rs = ps1.executeQuery();
                        if (rs.next()) {

                            do {
                                subject_name1 = rs.getString("subject_name");
                                subject_code1 = rs.getString("subject_code");
                                subject_type1 = rs.getString("subtype");
                                String st = "";
                                if (subject_type1.equals("1")) {
                                    st += "Practical";
                    %>
                    <td align="center"><%=subject_code1%></td>
                    <td style="padding: 4px;"><%=subject_name1%></td>
                    <td align="center"><%= st%></td>
                    <%          } else if (subject_type1.equals("0")) {
                        st += "Theory";
                    %>
                    <td align="center"><%=subject_code1%></td>
                    <td style="padding: 4px;"><%=subject_name1%></td>
                    <td align="center"><%= st%></td>

                    <%
                    } else {
                    %>

                    <td align="center"><%=subject_code1%></td>
                    <td style="padding: 4px;"><%=subject_name1%></td>
                    <td align="center">Theory</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center"><%=subject_code1%></td>
                    <td style="padding: 4px;"><%=subject_name1%></td>
                    <td align="center">Practical</td>





                    <%  }

          //st2 = st;
                    %>


                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <%                        } while (rs.next());

                    }

                %>       


            </table>

        </div>   </center>
</center>




<div style="width: 1400px;">
    <center>
        <input id="pay" style="margin-top: 10px" type="button" onclick="window.print()" value="   Print   "/>
        <button> <a href="index.jsp">Exit</a></button>
    </center>
</div>
</p>


</center>



</body>
<footer style="width: 1550px;">
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




