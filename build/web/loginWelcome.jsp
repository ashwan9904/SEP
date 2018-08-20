<%@page contentType="text/html" import="uts.wsd.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="demo.css"> 
        <title>Welcome Page</title>
    </head>    
    <%
        Student student = (Student)session.getAttribute("studentLogin");
        String color;
        if (student != null) {
            color = student.getFavcol();
        } else {
            color = "#AED6F1";
        }
    %>
    <body style="background-color: <%=color%>">
        <div><span class="time"> <jsp:include page="date.jsp" flush="true"/></span></div>
        <% if(student != null) { %>        
        <h1>Hello, <%= student.getName() %></h1> 
        <p>Your ID is: <%= student.getID() %></p>
        <p>Your email: <%= student.getEmail() %></p>
        <p>Your DOB: <%= student.getDob() %></p>
        <p>Your password is: <%= student.getPassword() %></p>        
        <p>Your Favorite color is: <%= student.getFavcol() %></p>        
        <%            
            session.setAttribute("student",student);
        %>
        <button class="button" type="button" onclick="location.href = 'main.jsp'" > Main Page </button>
        <%}else{%>
        <p class="outline"> Login unsuccessful! </p>
        <button class="button" type="button" onclick="location.href = 'main.jsp'" > Main Page </button>
        <%}%>        
        <button class="button" type="button" onclick="location.href = 'index.jsp'" > Home Page </button>
    </body>
</html>
