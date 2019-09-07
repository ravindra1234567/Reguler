<%-- 
    Document   : check_schema
    Created on : 8 Sep, 2019, 1:06:46 AM
    Author     : Ravindra
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*" %>

<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="input/logo.png">
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 98%;
    margin-left: 1%;
    margin-right: 1%;
}
th{background-color: #e4e4e0;}
td, th {
    border: 1px solid;
    text-align: left;
    padding: 8px;
}


</style>
        <title>Payment Status</title>
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
    <body style="margin-bottom: 100px;">
        <%! HttpSession session1;
        String uname,uname1;
        String pass,pass1;
        String query,query3;
        String sem;
        String branch;
        String payment_status,status;
        String eno,roll_no;
        String name;
        String query1,query2;
        PreparedStatement pd;
        String course;
        ResultSet rs;
          
        String photourl;
        String transection_id;
        %>
         <% 
               ServletContext context=getServletContext();  
           Class.forName(context.getInitParameter("Driver"));
            Connection con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"),context.getInitParameter("Password"));
		
             try{
          session1=request.getSession();
        
    uname=(String)session1.getAttribute("uname");
    
      pass=(String)session1.getAttribute("pass");
  
      // session1.invalidate();
       
      if(uname==null||pass==null)
      {
          response.sendRedirect("admin.jsp");
      }
                                
       
           branch = request.getParameter("branch");
       int  sem = Integer.parseInt(request.getParameter("sem"));
//                  out.println(year);
        String course = request.getParameter("course");
        int ctype = Integer.parseInt(request.getParameter("ctype"));
        
        query2="select   distinct(roll_no),application_id,name,photourl,branch,all_students.sem from all_students,schema_table where branch=? and all_students.sem=? and status = 0 and status1= 0 ";
        
        pd=con.prepareStatement(query2);
        pd.setString(1,branch);
 
        pd.setInt(2,sem);
        rs=pd.executeQuery();
           
        %>
        
     
   
           <table border radius="1" style="border-collapse:collapse;margin-top: 20px;" width="800px" >
               <tr>
                   
                    <th><center>Sno.</center></th>
                   <th><center>Roll Number</center></th>
                   <th><center>NAME</center></th>
                   <th><center>BRANCH</center></th>
                   <th><center>SEMESTER</center></th>
                    <th><center>Transection Id</center></th>
                   <th><center>Slip</center></th>
               </tr>
        <%       
         int i=1;
            while(rs.next()){
  
           name=(rs.getString("name")).toUpperCase();
//           eno=(rs.getString("enrollment_no")).toUpperCase();
           roll_no=(rs.getString("roll_no")).toUpperCase();
            photourl=rs.getString("photourl");
            transection_id=rs.getString("application_id");
            //out.println(photourl);
           %>
            <tr><td><center><%= i %></center></td>
           <td><center><%=roll_no%></center></td>
           <td><center><%= name %></center></td>
           <td><center><%= branch %></center></td>
           <td><center><%= sem %></center></td>
           <td><center><%= transection_id %></center></td>
           <td><img src="image/<%= photourl %>" class="img-thumbnail" alt="" width="200" height="136"></td>
           </tr>
           
           <% 
            i = i+1;
            }}
                else    
                {
                response.sendRedirect("admin.jsp");
                }
                  
         }
catch(Exception e){
                         out.println(e+"skn");}
   %>
           </table>
    </center>   
    </body>
    
</html>
