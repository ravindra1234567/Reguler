
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*" %>

<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="image/logo.png">
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
        String subject_name,subject_type,subject_code;
        String pass,pass1;
        String query,query3;
        String sem;
        String branch;
        String payment_status,status;
        String eno,rno;
        String name;
        String query1,query2;
        PreparedStatement pd;
        String course;
        ResultSet rs;
        String  coursetype;
       
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
                                
       
            query= "select * from administration where user_name=?";
           
           PreparedStatement pd=con.prepareStatement(query);
           pd.setString(1,uname);
           ResultSet rs=pd.executeQuery();
           if(rs.next()){
               uname1=rs.getString(1);
               pass1=rs.getString(2);
           }
            if(uname.equals(uname1) && pass.equals(pass1))
            {
        
               
      //  payment_status=request.getParameter("payment_status");
      
        sem=request.getParameter("sem");
//        out.println("Sem = "+ sem);
       // status=request.getParameter("status");
     
        branch=request.getParameter("branch");
        course=request.getParameter("course");
        
        String str = course;
		 course = str.substring(0,1);
                 coursetype = str.substring(1,2);
		
		
		if(str.equals("MSF"))
		{
			course = "MSC";
			coursetype = "F";
		}
		else if(str.equals("MSP"))
		{
			course = "MSC";
			coursetype = "P";
		}
		else{
			if(course.equals("B"))
			course = "BE";
                        else
			course = "ME";
                    }
        
        
        
//        out.println("course = "+ course);
//        out.println("Branch = "+ branch);
        query2="select distinct * from subschema inner join ex_student on subschema.subject_code=ex_student.subject_code and subschema.branch=ex_student.branch where ex_student.branch=? and ex_student.sem=?";
        
        pd=con.prepareStatement(query2);
        pd.setString(1,branch);
 
        pd.setString(2,sem);
        rs=pd.executeQuery();
           
        %>
           <table border radius="1" style="border-collapse:collapse;margin-top: 20px;" width="800px" >
               <tr>
                   
              
                   <th><center>Enrollment Number</center></th>
                   <th><center>Roll Number</center></th>
                   <th><center>NAME</center></th>
                   <th><center>BRANCH</center></th>
                   <th><center>SEMESTER</center></th>
          <th><center>SUBJECT CODE</center></th>
          <th><center>SUBJECT NAME</center></th>
          <th><center>SUBJECT TYPE</center></th>
                   <th><center>PAYMENT STATUS</center></th>
                   <th><center>DELETE</center></th>
               </tr>
        <%       
         
            while(rs.next()){
  
           name=(rs.getString("name")).toUpperCase();
           eno=(rs.getString("enrollment_no")).toUpperCase();
           rno=(rs.getString("roll_no")).toUpperCase();
           payment_status=(rs.getString("payment_status")).toUpperCase();
             subject_code=(rs.getString("ex_student.subject_code")).toUpperCase();
               subject_name=(rs.getString("subject_name")).toUpperCase();
                 subject_type=(rs.getString("ex_student.subject_type")).toUpperCase();
         
           %>
       
           <tr><td><center><%=eno%></center></td>
           <td><center><%=rno%></center></td>
           <td><center><%= name %></center></td>
           <td><center><%= branch %></center></td>
           <td><center><%= sem %></center></td>
           <td><center><%= subject_code %></center></td>
            <td><center><%= subject_name %></center></td>
             <td><center><%= subject_type %></center></td>
           <td><center><%= payment_status %></center></td>
           <td><center><a href="delete_ex.jsp?eno=<%= eno %>&subject=<%= subject_code %>&subject_type=<%= subject_type %>" >DELETE</a></center></td>
           </tr>
           
           <% }}
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
