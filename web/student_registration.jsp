<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Exam Registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Quicksand:300|Rajdhani:300|Raleway" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <link rel="icon" href="input/logo.png">


        <style>
            .genText{
                font-family: 'Quicksand', sans-serif;
                font-size: 1.2em;
                font-weight: 1000;
            }
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





    <%@page import="java.sql.*" import="java.io.IOException" 
            import="java.io.PrintWriter" 
            import="javax.servlet.annotation.WebServlet" 
            import="javax.servlet.http.HttpServlet" import="javax.servlet.http.HttpServletRequest" 
            import="javax.servlet.http.HttpServletResponse"  %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <header>
        <a href="index.jsp"><img id="logo" src="input/logo.png" alt="Institute of Engineering &amp; Technology"></a>
        <h2>Institute Of Engineering &amp; Technology</h2>
        <div class="menu">
            <a href="student_select.jsp">Student_Admit_Card</a>
            <a href="clerk.jsp">Clerk Verification</a>
            <a href="admin.jsp">Admin</a>
            <a href="index.jsp">Home</a>
        </div>
    </header>

    <%! Connection con;
        String eno;
        String sub_codes[];
        String en;
        String name;
        String status1;
        String sem1;
        String branch;
        String scheme_id;
        String subject_name;
        String subtype;
        String section;
        String subcode;
        String address;
        String rollno;
        String district;
        String key;
        String category;
        String course;
        String house_no, colony;
        String year;
        int count;
        int sem_num;
        String st1 = "";
        String sub_type, sub_type1;
        int fee1 = 0;
    %>
    <%

        eno = (request.getParameter("eno")).toUpperCase();
        status1 = request.getParameter("status");
        sem1 = request.getParameter("sem");
//        year = request.getParameter("branch");

        HttpSession s = request.getSession();
        s.setAttribute("e", eno);
        s.setAttribute("s", status1);
        s.setAttribute("sem", sem1);
        try {

            ServletContext context = getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

            PreparedStatement ps = con.prepareStatement("SELECT roll_no,enrollment_no,name,year,branch,section,subcode,subtype,subject_name from all_students,schema_table,subject_table where subject_table.subject_code=schema_table.subcode and schema_table.rollno=all_students.roll_no and all_students.enrollment_no=? and all_students.sem=? ");
            ps.setString(1, eno);
            ps.setString(2, sem1);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                branch = rs.getString("branch");
                rollno = rs.getString("roll_no");
                name = rs.getString(3);
                year = rs.getString("year");
                s.setAttribute("name", name);


    %>





    <!DOCTYPE html>

    <title> EX_Student</title>
    <style>
        #d1{
            border-radius: 25px;
            border: 2px solid;
            padding: 2%;
            width: 800px;
            margin-top: 20px;
            margin-left: 180px;
            margin-right: 180px;
            border-style: groove;
        }
        .footer {
            position:relative;
            left: 0;
            bottom: 0;
            width: 100%;
            height:150px;
            background-color:limegreen;
            color: white;
            text-align: center;
        }
         .input{
        font-size: 15px;
        width: 800px;
        height:27px;
        
 }
    </style>
</head>
<body>

<center>
    <div id="d1">
        <hr>
        <h3 align="center">
            UTD Pay-Unpaid Examination Form/Print Reciept
        </h3>
        <hr>

        <div style="background-color: #B0C4DE;text-align: left;">
            Student Detail
        </div>
        <form action="upload.jsp?rollno=<%= rollno %>" method="get" >

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
                        <span>JULY 2019</span>
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
                        <span>BE</span>
                    </td>
                    <td align="left">
                        Programme/Branch
                    </td>
                    <td align="left">
                        <div><%= branch%></div>
                    </td>
                    <td align="left">
                        Semester
                    </td>
                    <td align="left">
                        <span><%= sem1%></span>
                    </td>

                </tr>
                <tr>

                    <td align="left">
                        Enrollment No.
                    </td>
                    <td align="left">
                        <span><%= eno%></span>
                    </td>
                    <td align="left">
                        Roll No.
                    </td>
                    <td align="left">
                        <span><%= rollno%></span>
                    </td>
                    <td align="left">
                        Class
                    </td>
                    <td align="left">
                        <span><%= year %></span>
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
                        <span><%= status1%></span>
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
<!--                    <div class="head1" style="z-index: 730;background-color: #B0C4DE;text-align: left;">
                <center>Transaction Id</center>
            </div><br>
                <div aling="center"> 
                    <span style="margin-right:10px;">Application Number</span> <input type="text" name="tid" size="50" placeholder="Enter Application Number" required />
                    
                </div><br>-->
                    <div class="head1" style="z-index: 730;background-color: #B0C4DE;text-align: left;">
                <center>Subject Description</center>
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
                    <!--<th align="left">Select Subjects</th>-->
                </tr>


                <%
                   
                    con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));
                  
                    PreparedStatement ps1 = con.prepareStatement("SELECT subcode,subtype,subject_name from all_students,schema_table,subject_table where subject_table.subject_code=schema_table.subcode and schema_table.rollno=all_students.roll_no and all_students.enrollment_no=? and all_students.sem=? ");
                    ;
                    ps1.setString(1, eno);
                    ps1.setString(2, sem1);

                    ResultSet rs1 = ps1.executeQuery();
                    
                    if (rs1!=null) {
                             //out.println("hello3");
//                        branch = rs1.getString("branch");
//                        course = rs1.getString("course");
                       while(rs1.next()) {
                                 
                            subtype = rs1.getString("subtype");
//                            out.println(subtype);
                            subcode = rs1.getString("subcode");
                            subject_name = rs1.getString("subject_name");
                            String st="";
                            if(subtype.equals("0")) {
                                st += "T";
                            } else if (subtype.equals("1")) {
                                st += "P";
                            } else {
                                st += "T+P";
                            }

                        st1=st;
                    
                   
                %>

                <tr>
                    <td>
                        <span><%=subcode%></span>
                    </td>
                    <td>
                        <span><%= subject_name%></span>
                    </td>
                    <td>
                        <span><%= st1 %></span>
                    </td>
                    <!--<td><input type="checkbox" name="sub_code" value=<%=key%> /></td>-->

                </tr>
                <%

                        }
                        
                    }
                     else {
                        response.sendRedirect("index.jsp");
                    }


                %>                
                
            </table>
           
            <div align="center">
                <span style="text-align:center;">
                    <input id="check" type="checkbox" name="chkDeclaration"/>
                    <label>CERTIFIED THAT</label>
                </span>
            </div>

            <div>
                <span>
                    I hereby declare that the information filled by me is true and complete as per my knowledge. If any information provided by me is found false or incorrect then i shall be disqualified by the university.
                </span>
            </div>

    </div>
</center>
<center>

    <input type="submit" style="margin-top: 10px" id="pay" class="button"  value="   Proceed To Register   " disabled/>
</center>
<input type="hidden" name="fee1" value="<%=fee1%>">  
<script>

    var checker = document.getElementById('check');

    var sendbtn = document.getElementById('pay');
    // when unchecked or checked, run the function

    checker.onchange = function ()
    {

        if (this.checked)
        {
            sendbtn.disabled = false;

        }
        else
        {
            sendbtn.disabled = true;
        }



    }
</script> 
<input type="hidden" name="rollno" value=<%= rollno %> />
</form> 

</body>
</html>

<%
} else {
%>

<script>
    if (window.confirm("No Records Found"))
    {
        window.location = "index.jsp";
    }
    else
    {
        window.location = "index.jsp";
    }

</script>
<%
        }

    } catch (Exception e) {

        e.printStackTrace();
    }

%>
<footer>
    <p align="center" id="p1">
        D e v e l o p e d &nbsp&nbsp & &nbsp&nbsp D e s i g n e d &nbsp&nbsp b y :- 
    </p>
    <hr align="center" width="60%">
    <p align="center" id="p2">
         Developed & Designed by :- Hemant Sir,Ravindra Kumar Kushwaha and Sumit kr.

        For any queries contact ravindrakushwahanwg@gmail.com.
        Copyright © 2019 IET DAVV. All right reserved.
    </p>

</footer>
</html>
