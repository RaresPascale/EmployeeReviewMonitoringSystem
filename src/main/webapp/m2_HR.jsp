<%-- 
    Document   : m2_HR
    Created on : Jan 23, 2023
    Author     : rares
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela HR</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela HR:</h1>
        <br/>
        <p align="center"><a href="nou_HR.jsp"><b>Do your HR job.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idhr"));
            String idreview = request.getParameter("idreview");
            String idemployees = request.getParameter("idemployees");
            String Bonus_Status = request.getParameter("status_anualbonus");
            String Leave_Status = request.getParameter("paid_leave_status");

            String[] valori = {idreview, idemployees, Bonus_Status, Leave_Status};
            String[] campuri = {"idreview", "idemployees", "status_anualbonus", "paid_leave_status"};
            jb.modificaTabela("hr", "idhr", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>