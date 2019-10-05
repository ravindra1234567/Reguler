<%-- 
    Document   : subject_add_table_reg
    Created on : 5 Oct, 2019, 11:24:17 AM
    Author     : Ravindra
--%>

<%

        String subjectcode = request.getParameter("subjectcode");
        String subjectname = request.getParameter("subjectname");
        String theorycredit = request.getParameter("theorycredit");
        String practical = request.getParameter("paracticalcredit");
        out.println(subjectcode);
%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
