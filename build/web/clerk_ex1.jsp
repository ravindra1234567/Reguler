<%@page import="java.sql.*" 
 import="java.sql.Connection"

 import="java.io.IOException" 
        import="java.io.PrintWriter" 
        import="javax.servlet.annotation.WebServlet" 
        import="javax.servlet.http.HttpServlet" import="javax.servlet.http.HttpServletRequest" 
        import="javax.servlet.http.HttpServletResponse"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%! String enrollment_no;
    String subject;
    String name;
    String status;
    String sem;
    String branch;
    String sub_code;
    String sub_type;
    String key;
    String course;
  
    String roll_no;
    String payment_status;
    String  sub_name;
    int sem_num;
  
    Connection con;
%>
<% 
   ServletContext context=getServletContext();
    ResultSet rs1=null;
    //out.println("1");
                try
		{
                        Class.forName(context.getInitParameter("Driver"));
                        con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"),context.getInitParameter("Password"));
                         PreparedStatement ps2=con.prepareStatement("select distinct  * from subschema inner join ex_student on subschema.subject_code=ex_student.subject_code and ex_student.branch=subschema.branch where ex_student.reg='Y' and payment_status='Unpaid' order by name, ex_student.sem,subject_name" ); 
                        
			  ResultSet rs2=ps2.executeQuery();
                          
                        
                            %>
                         
                        
                        
                        
      

<!DOCTYPE html>

	<title>Verify</title>
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
    
        </style>
       
<script type="text/javascript">
			function selectAll(){
				var items=document.getElementsByName('id');
				for(var i=0; i<items.length; i++){
					if(items[i].type=='checkbox')
						items[i].checked=true;
				}
			}
	function UnSelectAll(){
				var items=document.getElementsByName('id');
				for(var i=0; i<items.length; i++){
					if(items[i].type=='checkbox')
						items[i].checked=false;
				}
                            }
 
	
        function goBack() {
  window.history.back();
}

</script>

          <link rel="stylesheet" type="text/css" href="css/index.css">
          <link rel="icon" href="image/logo.png">
   <link rel="stylesheet" type="text/css" href="css/button.css">
</head>
<body>
      <form action="finalverify_ex.jsp" method="post">
    <header>
<a href="index.jsp"><img id="logo" src="image/logo.png" alt="Institute of Engineering &amp; Technology"></a>
<h2>Institute Of Engineering &amp; Technology</h2>
</header>
         
          <center>  
            
                       <div align="right" style="margin-right: 5%;">
                             <input type="button"  value="Back"  onclick="goBack()" style="float: left;margin-top: 10px;padding-top: 10px;padding-bottom: 10px;" class="button"/>
                
                            <input id="pay"  type="button" onclick="window.print()" value="   Print  " style="margin-top: 10px;padding-top: 10px;padding-bottom: 10px;"  class="button"/>
                        <input type="button" onclick='selectAll()' value="Select All" style="margin-top: 10px;padding-top: 10px;padding-bottom: 10px;" class="button"/>
                        <input type="button" onclick='UnSelectAll()' value="Unselect All" style="margin-top: 10px;padding-top: 10px;padding-bottom: 10px;" class="button"/>
	
                        <input type="submit" align="left" style="margin-top: 10px;padding-top: 10px;padding-bottom: 10px;" id="pay" class="button"  value="SUBMIT"/>
                    </div>
                    <div style="background-color: #B0C4DE;text-align: center;margin-top:5px;width:90%;font-size:24px;padding: 2px;">Ex-Student Details</div>
                 
                    <table border radius="1"  style="border-collapse:collapse;font-size: 18px;padding: 5px;"  width="90%">
                        
                     <tr>
                         <td>
                             <span>Course</span>
                         </td>
                      <td>
                             Name
                        </td>
                        
                         <td>
                             Enrollment no
                        </td>
                    
                         <td>
                             Roll no
                        </td>
                        
                         <td>
                             Branch
                         </td>
                
                         <td>
                             Sem
                        </td>
                             <td>
                            Subject Code
                        </td>
                         <td>
                             Subject Name
                        </td>
                     
                         <td>
                            Subject Type
                        </td>

                         <td>
                             Payment Status
                        </td>
                        <td>
                            Fees Paid
                        </td>
                     </tr>
                  
 
             <%    while(rs2.next())
                             {
                        	 course=rs2.getString("course");
                           branch=rs2.getString("branch");
                           status=rs2.getString("payment_status");
                           sem=rs2.getString("sem");
                          name=rs2.getString("name");
                          enrollment_no=rs2.getString("enrollment_no");
                          roll_no=rs2.getString("roll_no");
                          sub_type=rs2.getString("subject_type");
                          sub_name=rs2.getString("subject_name");
                          sub_code=rs2.getString("subject_code");
                           
                          
                          key = enrollment_no+sub_code+sub_type;
                         // out.println(key);
                             /*  sub= rs2.getString("subject_code").toUpperCase();
                               sub_type=rs2.getString("subject_type").toUpperCase();
                               subject=sub+sub_type;
                                sub_name=rs2.getString("subject_name").toUpperCase();
                                if(sub_type.equalsIgnoreCase("T"))
                                    sub_type="THEORY";
                                else
                                    sub_type="PRATICAL";
*/
                              

                %>
                
		<tr>
                         <td>
                             <span><%= course %></span>
                         </td>
                      <td>
                             <span><%= name %></span>
                        </td>
                        
                         <td>
                            <span><%=  enrollment_no %></span>
                        </td>
                    
                         <td>
                             <span><%= roll_no %></span>
                        </td>
                        
                         <td>
                            <span><%= branch %></span>
                         </td>
                   
                         <td>
                             <span><%= sem %></span>
                        </td>
                        <td>
                             <span><%= sub_code %></span>
                        </td>
                         <td>
                             <span><%= sub_name %></span>
                        </td>
                     
                         <td>
                           <span><%= sub_type %></span>
                        </td>

                         <td>
                             <span><%= status %></span>
                        </td>
            <!--    <input id="check1" type="checkbox" name="chkDeclaration"/> -->
               <td> <input type="checkbox" name="id" id="check1" value=<%= key %> </td>
                <br>
		</tr>
               <%           }
               %>   
	</table> 
        
                </center>
            </span>
            </div>
	
        </center>
      
           
           <footer>
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
           <script>

var checker = document.getElementById('check1');

 var sendbtn = document.getElementById('pay');
 // when unchecked or checked, run the function
 
checker.onchange = function(){

if(this.checked)
{
    sendbtn.disabled = false;

} 
else
 {
    sendbtn.disabled = true;
}



}
</script> 
 

 
        </form>    
</body>
</html>

  <%
 //}
                 //else
               // {
                %>
               
                
                <%
               // } 
        //}
}

        catch(Exception e)
        {
           
          e.printStackTrace();
        }
               %>
