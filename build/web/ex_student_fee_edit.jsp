
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
int subject;
%>
<%
    subject=Integer.parseInt(request.getParameter("subject"));
    
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ex-Student Fee</title>
        <link rel="icon" href="input/logo.png">
        <jsp:include page="bootstrap_file.jsp" /> 
        <style>
            table{margin-top: 140px;
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
                .edit{
                    margin: 2px;
                    height: 70%;
                }
        </style>
         <link rel="stylesheet" type="text/css" href="css/button.css">
         <link rel="stylesheet" type="text/css" href="css/index.css">
    </head>
     <header>
<a href="index.jsp"><img id="logo" src="input/logo.png" alt="Institute of Engineering &amp; Technology"></a>
<h2>Institute Of Engineering &amp; Technology</h2>
</header>
    <body>
        <a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
    <center>
        <form action="ex_student_fee_update.jsp">
        <table  border="1" cellpadding="0px">
            <tr> <th height="50px">No of Subjects</th><th>Fees Amount</th><th></th></tr>
<%
        
    try
		{
                       ServletContext context=getServletContext();  
           Class.forName(context.getInitParameter("Driver"));
            Connection con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"),context.getInitParameter("Password"));
		
			PreparedStatement ps=con.prepareStatement("select * from ex_fees where subjects=?");
                        ps.setInt(1,subject);
			ResultSet rs=ps.executeQuery();
                        
			      rs.next();
                                int sub=rs.getInt("subjects");
                                int fee=rs.getInt("fees");
                              %>
                              <tr>
                                  <td height="50px"> <input type="number" value="<%=sub%>" name="sub" class="edit" /></td>
                                  <td height="50px"> <input type="number" value="<%=fee%>" name="fee" class="edit" /></td>
                                  <td><input type="submit" value="Update" class="button" ></td>
                              </tr>
                              <%
                              
                              
                        
                }
                catch(Exception e)
                {
                out.println(e);
                }
                            
                            
                            %>

    
        </table>
        </form>
    </center>
    </body>
     <footer style="margin-top:8%;">
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
