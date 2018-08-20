<%@page import="uts.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="demo.css"> 
        <title>Main Page</title>
    </head>
    <%
        String color;
        String log;
        Student student = (Student) session.getAttribute("student");

        if (student != null) {
            color = student.getFavcol();
            log = " &lt " + student.getName() + " &gt";
        } else {
            color = "#AED6F1";
            log = " &lt " + "Guest Student" + " &gt";
        }

    %>
    <body style="background-color: <%=color%>">
        <h2 class="outline">Student Profile</h2> 
        <table width="100%" >
            <tr bgcolor="lightgrey" ><td align="right" class="outline">You are logged in as  <%=log%></td></tr>
            <tr><td align="right">
                    <%if (student != null) { %>
                    <u><a class="link" href="edit_user.jsp">Account</a></u> 
                        <%} else { %>
                    <u><a class="link" href="register.jsp">Register</a></u>
                        <%}%>
                    &emsp;<u><a class="link" href="logout.jsp">Logout</a></u>
                </td>
            </tr>                  
        </table>        
        <hr>
        <% if (student != null) { %>
        <table class="account">
            <thead class="h">
                <tr>
                    <td class="a">ID</td>
                    <td class="a">Name</td>
                    <td class="a">DOB</td>
                    <td class="a">Email</td>
                    <td class="a">Password</td>
                    <td class="a">Favorite Color</td>
                </tr>
            </thead>
            <tbody >
                <tr>
                    <td class="a">${student.ID}</td>
                    <td class="a" >${student.name}</td>
                    <td class="a">${student.dob}</td>
                    <td class="a">${student.email}</td>
                    <td class="a">${student.password}</td>
                    <td class="a">${student.favcol}</td>
                </tr>
            </tbody>
        </table>
        <% session.setAttribute("studentEdit", student); %>
        <%}else{ %>
        <p class="outline">Welcome Guest Student</p>
        <%}%>
    </body>
</html>
