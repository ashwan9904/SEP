<%-- 
    Document   : loginAction
    Created on : Aug 11, 2018, 9:34:47 PM
    Author     : George
--%>

<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Action Page</title>
    </head>
    <body>
        <% String studentPath = application.getRealPath("WEB-INF/students.xml");%>
        <jsp:useBean id="studentApp" class="uts.wsd.StudentApplication" scope="application">
            <jsp:setProperty name="studentApp" property="filePath" value="<%=studentPath%>"/>
        </jsp:useBean>
        <% 
            Students students = studentApp.getStudents();
            String ID = request.getParameter("ID");
            String password = request.getParameter("password");
            Student student = students.login(ID, password);
            
            if (student != null) {
                session.setAttribute("studentLogin", student);
                response.sendRedirect("loginWelcome.jsp");                        
            }else{
                session.setAttribute("existErr", "Student profile does not exist!");
                response.sendRedirect("login.jsp");                               
            }
        %>
    </body>
</html>
