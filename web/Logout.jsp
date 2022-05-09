<%-- 
    Document   : Logout
    Created on : 30/11/2020, 10:00:47 ص
    Author     : Matrix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <%
        session.invalidate();
        response.sendRedirect("index.jsp");
            
        %>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
