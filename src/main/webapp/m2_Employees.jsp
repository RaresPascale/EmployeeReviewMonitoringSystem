<%-- 
    Document   : m2_Employee
    Created on : Jan 13, 2023
    Author     : rares
--%>

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
        <h1 align="center"> Tabela Employees:</h1>
        <br/>
        <p align="center"><a href="nou_Employees.jsp"><b>Add a new employee.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idemployees"));
            String name = request.getParameter("Nume");
            String surname = request.getParameter("Prenume");
            String adress = request.getParameter("Adresa");
            String role = request.getParameter("Rol");
            String salary = request.getParameter("Salariu");



            String[] valori = {name, surname, adress, role, salary};
            String[] campuri = {"name", "surname", "adress", "role", "salary"};
            jb.modificaTabela("employees", "idemployees", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>