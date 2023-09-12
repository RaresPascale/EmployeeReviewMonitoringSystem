<%-- 
    Document   : modifica_CEmployee
    Created on : Jan 13, 2023
    Author     : rares
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
     <style>
      body {
         background-color: rgb(204, 255, 255);
      }
   </style>
 <style>
.button {
  background-color: #0066cc;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
</style> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Employees</title>
    <link rel="stylesheet" href="style.css">    
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Employees:</h1>
        <br/>
        <p align="center"><a href="nou_Employees.jsp" class = "button"><b>Add a new employee.</b></a> <a href="index.html" class = "button"><b>Home</b></a></p>
        <form action="m1_Employees.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdEmployee:</b></td>
                    <td><b>Name:</b></td>
                    <td><b>Surname:</b></td>
                    <td><b>Adress:</b></td>
                    <td><b>Role:</b></td>
                    <td><b>Salary:</b></td>
                    
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("employees");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idemployees");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                    <td><%= x%></td>
                    <td><%= rs.getString("name")%></td>
                    <td><%= rs.getString("surname")%></td>
                    <td><%= rs.getString("adress")%></td>
                    <td><%= rs.getString("role")%></td>
                    <td><%= rs.getString("salary")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <%
    jb.disconnect();%>
        <br/>
        <p align="center">
            <a href="index.html" class = "button"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>