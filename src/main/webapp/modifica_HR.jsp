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
        <title>Tabela HR</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela HR:</h1>
        <br/>
        <p align="center"><a href="nou_HR.jsp" class = "button"><b>Adauga HR.</b></a> <a href="index.html" class = "button"><b>Home</b></a></p>
        <form action="m1_HR.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdHR:</b></td>
                    <td><b>IdEmployee:</b></td>
                    <td><b>EmployeeName:</b></td>
                    <td><b>EmployeeSurname:</b></td>
                    <td><b>Adress:</b></td>
                    <td><b>Role:</b></td>
                    <td><b>Salary:</b></td>
                    <td><b>IdReview:</b></td>
                    <td><b>ReviewDate:</b></td>
                    <td><b>Review:</b></td>
                    <td><b>WrittenBy:</b></td>
                    <td><b>Status_AnualBonus:</b></td>
                    <td><b>Paid_leave_staus:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeHr();
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idhr");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getInt("idhr")%></td>                    
                    <td><%= rs.getInt("idemployees_hr")%></td>
                    <td><%= rs.getString("EmployeeName")%></td>
                    <td><%= rs.getString("EmployeeSurname")%></td>
                    <td><%= rs.getString("Adress")%></td>
                    <td><%= rs.getString("Role")%></td>
                    <td><%= rs.getString("Salary")%></td>
                    <td><%= rs.getInt("idreview_hr")%></td>
                    <td><%= rs.getString("ReviewDate")%></td>
                    <td><%= rs.getString("Review")%></td>
                    <td><%= rs.getString("WrittenBy")%></td>
                    <td><%= rs.getString("status_anualbonus")%></td>
                    <td><%= rs.getString("paid_leave_status")%></td>
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
            <a href="index.html" class = "button"><b>Home </b></a>
            <br/>
        </p>
    </body>
</html>