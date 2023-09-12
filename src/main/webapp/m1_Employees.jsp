<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Employees</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Employees:</h1>
        <br/>
        <p align="center"><a href="nou_Employees.jsp"><b>Add a new employee.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("employees", "idemployees", aux);
            rs.first();
            String name = rs.getString("name");
            String surname = rs.getString("surname");
            String adress = rs.getString("adress");
            String role = rs.getString("role");
            String salary = rs.getString("salary");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Employees.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdEmployee:</td>
                    <td> <input type="text" name="idemployees" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Name:</td>
                    <td> <input type="text" name="Nume" size="30" value="<%= name%>"/></td>
                </tr>
                <tr>
                    <td align="right">Surname:</td>
                    <td> <input type="text" name="Prenume" size="30" value="<%= surname%>"/></td>
                </tr>
                <tr>
                    <td align="right">Adress:</td>
                    <td> <input type="text" name="Adresa" size="30" value="<%= adress%>"/></td>
                </tr>
                <tr>
                    <td align="right">Role:</td>
                    <td> <input type="text" name="Rol" size="30" value="<%= role%>"/></td>
                </tr>
                <tr>
                    <td align="right">Salary:</td>
                    <td> <input type="text" name="Salariu" size="30" value="<%= salary%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center"">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>