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
        <title>Add review</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String date = request.getParameter("date");
            String review = request.getParameter("review");
            String written_by = request.getParameter("written_by");

            
            if (review != null) {
                jb.connect();
                jb.adaugaReviews(date, review, written_by);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Reviews.</h1>
        <h1><font size= "-1"> Formatul datei este (YYYY-MM-DD)</font></h1>
        <form action="nou_Reviews.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Review's Date:</td>
                    <td> <input type="text" name="date" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Review:</td>
                    <td> <input type="text" name="review" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Written_by:</td>
                    <td> <input type="text" name="written_by" size="40" /></td>
                </tr>
            </table>
            <input type="submit" value="Add review" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>