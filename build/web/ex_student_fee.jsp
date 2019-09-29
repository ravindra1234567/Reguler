
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ex-Student Fee</title>
        <jsp:include page="bootstrap_file.jsp" /> 
        <style>
            table{margin-top: 60px;
                font-size: 20px;
                font-family:sans-serif;
                border-collapse: collapse;
                
                }
                		a{
			color: white;
			font-size: 17px;
                        font-family: calibri;
                        text-decoration: none;
		}
       
      
        </style>
        <link rel="icon" href="input/logo.png">
        <link rel="stylesheet" type="text/css" href="css/button.css">
         <link rel="stylesheet" type="text/css" href="css/index.css">
    </head>
      <header>
<a href="index.jsp"><img id="logo" src="input/logo.png" alt="Institute of Engineering &amp; Technology"></a>
<h2>Institute Of Engineering &amp; Technology</h2>
<div class="menu">
<!--  <a href="studentselect.jsp">Student_Admit_Card</a>-->
  <a href="admin.jsp">Admin</a>
  <a href="index.jsp">Home</a>
</div>
</header>
    <body>
      <a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
	
    <center>
        
        <table class="table table-bordered" style="width:500px;">
            <tr> <th>No of Subjects</th><th>Fees Amount</th><th></th></tr>
<%
        
                try
		{
                       ServletContext context=getServletContext();  
           Class.forName(context.getInitParameter("Driver"));
            Connection con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"),context.getInitParameter("Password"));
		
			PreparedStatement ps=con.prepareStatement("select * from ex_fees");
                       
			ResultSet rs=ps.executeQuery();
                        
			while(rs.next())
                        {      
                                int sub=rs.getInt("subjects");
                                int fee=rs.getInt("fees");
                              %>
                              <tr>
                                  <td> <%=sub%></td>
                                  <td><%=fee%></td>
                                  <td><a  href="ex_student_fee_edit.jsp?subject=<%=sub%>"><button class="btn btn-success">Edit</button></a></td>
                              </tr>
                              <%
                              
                              
                        }
                }
                catch(Exception e)
                {
                out.println(e);
                }
                            
                            
                            %>

    
        </table>
    </center>
    </body>
    <footer style="margin-top:7%;">
<p align="center" id="p1">
Exam Registration Portal
</p>
<hr align="center" width="60%">
<p align="center" id="p2">
Developed & Designed by :- Vinod Thakure , Jayesh Punjabi and Tanveer Singh Bhatia.

For any queries contact 15bcs158@ietdavv.edu.in.
Copyright © 2017 IET DAVV. All right reserved.
</p>
    
</footer>
</html>
