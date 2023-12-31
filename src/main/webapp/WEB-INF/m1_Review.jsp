<%-- 
    Document   : m1_Employees
    Created on : Jan 13, 2023
    Author     : rares
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Review</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Review:</h1>
        <br/>
        <p align="center"><a href="nou_Reviews.jsp"><b>Add a new review.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("reviews", "idreview", aux);
            rs.first();
            String date = rs.getString("date");
            String review = rs.getString("review");
            String written_by = rs.getString("written_by");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Reviews.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdReview:</td>
                    <td> <input type="text" name="idreview" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Date:</td>
                    <td> <input type="text" name="date" size="30" value="<%= date%>"/></td>
                </tr>
                <tr>
                    <td align="right">Review:</td>
                    <td> <input type="text" name="review" size="30" value="<%= review%>"/></td>
                </tr>
                <tr>
                    <td align="right">Written_by:</td>
                    <td> <input type="text" name="written_by" size="30" value="<%= written_by%>"/></td>
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