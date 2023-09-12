<%-- 
    Document   : nou_Employee
    Created on : 28.01.2023
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
        <title>Add employee</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            String adress = request.getParameter("adress");
            String role = request.getParameter("role");
            String salary = request.getParameter("salary");
            
            if (name != null) {
                jb.connect();
                jb.adaugaEmployee(name, surname, adress, role, salary);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Employees.</h1>
        <form action="nou_Employees.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Employee Name:</td>
                    <td> <input type="text" name="name" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Employee Surname:</td>
                    <td> <input type="text" name="surname" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Adress:</td>
                    <td> <input type="text" name="adress" size="30" /></td>
                </tr>
                                <tr>
                    <td align="right">Role:</td>
                    <td> <input type="text" name="role" size="30" /></td>
                </tr>
                                <tr>
                    <td align="right">Salary:</td>
                    <td> <input type="text" name="salary" size="30" /></td>
                </tr>
                
            </table>
            <input type="submit" value="Add employee" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>