<%@page contentType="text/html" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="demo.css"> 
        <title>Welcome Page</title>
    </head>
    <body>        
        <div><span class="time"> <jsp:include page="date.jsp" flush="true"/></span></div>
        <h1>welcome to WSD: Math Page</h1> 
        <%            
            int n = (new Random().nextInt(9));
            double sqrt = Math.sqrt(n);
            double log = Math.log(n);
            double exp = Math.exp(n);          
        %>        
        <% out.print("Random generated number n = " +n); %>
        <p> Square root of <% out.print(n); %> : <%= sqrt %></p>
        <p> Logarithm of <% out.print(n); %>: <%= log %></p>
        <p> Exponent of <% out.print(n); %>: <%= exp %></p>
        <%
            int factorial = 1;
            for( int i=1 ; i <= n; i++){
               factorial *= i; 
            }
        %> 
        <p> Factorial of <% out.print(n); %>: <%= factorial %></p>
        <button class="button" onclick="location.reload();" >Refresh</button> &emsp; <button class="button" type="button" onclick="location.href='index.jsp'" > Home Page </button>
    </body>
</html>
