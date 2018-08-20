<%-- 
    Document   : login
    Created on : Aug 11, 2018, 9:34:31 PM
    Author     : George
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String error = request.getParameter("existErr");
        %>
        <div><span class="time"> <jsp:include page="date.jsp" flush="true"/></span></div>
        <h1>Enter your details to login: <span class="error"><c:if test="${existErr!=null}"><span class="error"><c:out value="${existErr}"/></span></c:if></span></h1>
        
        <form action="loginAction.jsp" method="post">
            <table>                
                <tr><td>Student ID:</td><td><input type="text" name="ID"></td></tr>
                <tr><td>Password:</td><td><input type="password" name="password"></td></tr>                
                <tr><td></td>
                    <td><input class="button" type="submit" value="Login"> 
                        &nbsp; 
                        <button class="button" type="button" onclick="location.href = 'index.jsp'" > Home Page </button>
                    </td>.
                </tr>
            </table>
        </form>
    </body>
</html>
