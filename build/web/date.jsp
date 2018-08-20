<%-- 
    Document   : date
    Created on : 21/03/2017, 10:49:18 AM
    Author     : george
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="demo.css"> 
        <title>Date Page</title>
    </head>
    <body>
        
        <br>
        <p align="center"><% out.print("Today is:"+java.util.Calendar.getInstance().getTime()); %></p>
        <br>
    </body>
</html>
