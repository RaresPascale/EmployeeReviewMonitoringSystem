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
        <h1 align="center">Tabela HR:</h1>
        <br/>
        <p align="center"><a href="nou_HR.jsp"><b>HR main menu.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            String ReviewDate, Review, WrittenBy, EmployeeName, EmployeeSurname, Adress, Role, Salary, Bonus_Status, Leave_Status;

            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceHrId(aux);
            rs.first();
            int id1 = rs.getInt("idreview_hr");
            int id2 = rs.getInt("idemployees_hr");

            ReviewDate = rs.getString("ReviewDate");
            Review = rs.getString("Review");
            WrittenBy = rs.getString("WrittenBy");
            EmployeeName = rs.getString("EmployeeName");
            EmployeeSurname = rs.getString("EmployeeSurname");
            Adress = rs.getString("Adress");
            Role = rs.getString("Role");
            Bonus_Status = rs.getString("Bonus_Status");
            Leave_Status = rs.getString("Leave_Status");
            

            ResultSet rs1 = jb.vedeTabela("reviews");
            ResultSet rs2 = jb.vedeTabela("employees");
            int idreview, idemployees;


        %>
        <form action="m2_HR.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdHR:</td>
                    <td> <input type="text" name="idhr" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">idreview:</td>
                    <td> 
                        <SELECT NAME="idreview">
                            <%
                                while (rs1.next()) {
                                    idreview = rs1.getInt("idreview");
                                    ReviewDate = rs1.getString("date");
                                    Review = rs1.getString("review");
                                    WrittenBy = rs1.getString("written_by");
                                    if (idreview != id1) {
                            %>
                            <OPTION VALUE="<%= idreview%>"><%= idreview%>, <%= ReviewDate%>, <%= Review%>, <%= WrittenBy%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idreview%>"><%= idreview%>, <%= ReviewDate%>, <%= Review%>, <%= WrittenBy%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">idemployees:</td>
                    <td> 
                        <SELECT NAME="idemployees">
                            <%
                                while (rs2.next()) {
                                    idemployees = rs2.getInt("idemployees");
                                    EmployeeName = rs2.getString("name");
                                    EmployeeSurname = rs2.getString("surname");
                                    Adress = rs2.getString("Adress");
                                    Role = rs2.getString("Role");
                                    Salary = rs2.getString("Salary");
                                    /*Bonus_Status = rs2.getString("Bonus_Status");
                                    Leave_Status = rs2.getString("Leave_Status");*/
                                    
                            if (idemployees != id2) {
                            %>
                            <OPTION VALUE="<%= idemployees%>"><%= idemployees%>, <%= EmployeeName%>, <%= EmployeeSurname%>, <%= Adress%>, <%= Role%>, <%= Salary%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idemployees%>"><%= idemployees%>, <%= EmployeeName%>, <%= EmployeeSurname%>, <%= Adress%>, <%= Role%>, <%= Salary%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">Status_AnualBonus:</td>
                    <td> <input type="text" name="status_anualbonus" size="30" value="<%= Bonus_Status%>"/></td>
                </tr>
                <tr>
                    <td align="right">Paid_Leave_Status:</td>
                    <td> <input type="text" name="Leave_Status" size="30" value="<%= Leave_Status%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center"">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
</html>