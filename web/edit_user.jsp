<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="uts.wsd.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="demo.css"> 
        <title>Insert title here</title>
    </head>

    <% String studentPath = application.getRealPath("WEB-INF/students.xml");%>
    <jsp:useBean id="studentApp" class="uts.wsd.StudentApplication" scope="application">
        <jsp:setProperty name="studentApp" property="filePath" value="<%=studentPath%>"/>
    </jsp:useBean>
    <%
        String color;
        Student student = (Student) session.getAttribute("studentEdit");

        if (student != null) {
            color = student.getFavcol();
        } else {
            color = "#AED6F1";
        }
    %>
    <body style="background-color: <%=color%>">
        <div><span class="time"> <jsp:include page="date.jsp" flush="true"/></span></div>

        <h1>My Account</h1>        
        <form action="edit_user.jsp" method="POST">
            <table>
                <tr><td>Student ID</td><td><%= student.getID()%></td></tr>
                <tr><td>Full name</td><td><input type="text" value="<%= student.getName()%>" name="name"></td></tr>
                <tr><td>Email</td><td><input type="text" value="<%= student.getEmail()%>" name="email"></td></tr>                
                <tr><td>Password</td><td><input type="password" value="<%= student.getPassword()%>" name="password"></td></tr>   
                <tr><td>Date of Birth</td><td><input type="date" value="<%= student.getDob()%>" name="dob"></td></tr> 
                <tr><td>Favorite color</td><td> <input type="color" name ="favcol" <%= student.getFavcol()%>></td></tr>
                <tr><td><input type="hidden" value="updated" name="updated"></td>
                    <td><input class="button" type="submit" value="Save"> 
                        &emsp; 
                        <button class="button" type="button" onclick="location.href = 'main.jsp'" > Main Page </button>
                    </td>
                </tr>
            </table>
        </form>
        <%
            if (request.getParameter("updated") != null) {
                student.updateDetails(request.getParameter("name"), request.getParameter("email"),
                        request.getParameter("password"), request.getParameter("dob"), request.getParameter("favcol"));
                Students students = studentApp.getStudents();
                if (students != null) {
                    students.updateList(student);
                    studentApp.updateXML(students, studentPath);
                    session.setAttribute("student", student);
                }else{
                  %>  <p class="outline"> Could not update students XML!</p> <%
                }
        %>
        <p class="outline"> Student details updated.</p>
        <%}%>
    </body>
</html>