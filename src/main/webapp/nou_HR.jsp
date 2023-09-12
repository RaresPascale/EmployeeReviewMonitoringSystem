<%-- 
    Document   : nou_HR
    Created on : Jan 28, 2023
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
        <title>Add a new HR </title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String idreview, idemployees;
            String id1, id2, ReviewDate, Review, written_by, EmployeeName, EmployeeSurname, Adress, Role, Salary, Bonus_Status, Leave_Status;

            id1 = request.getParameter("idreview");
            id2 = request.getParameter("idemployees");
            Bonus_Status = request.getParameter("Bonus_Status");
            Leave_Status = request.getParameter("Leave_Status");
            if (id1 != null) {
                jb.connect();
                jb.adaugaHr(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), Bonus_Status, Leave_Status);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("reviews");
        ResultSet rs2 = jb.vedeTabela("employees");
        %>
        <h1> Suntem in tabela HR.</h1>
        <form action="nou_HR.jsp" method="post">
            <table>
                <tr>
                    <td align="right">IdReview:</td>
                    <td> 
                        Selectati review:
			<SELECT NAME="idreview">
                                <%
                                    while(rs1.next()){
                                        idreview = rs1.getString("idreview");
                                        ReviewDate = rs1.getString("date");
                                        Review = rs1.getString("review");
                                        written_by = rs1.getString("written_by");
                                %>
                                    <OPTION VALUE="<%= idreview%>"><%= idreview%>,<%= ReviewDate%>,<%= Review%>,<%= written_by%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                    
                    </td>
                </tr>
                <tr>
                    <td align="right">IdEmployee:</td>
                    <td> 
                        Selectati employee:
			<SELECT NAME="idemployees">
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                        idemployees = rs2.getString("idemployees");
                                        EmployeeName = rs2.getString("name");
                                        EmployeeSurname = rs2.getString("surname");
                                        Adress = rs2.getString("adress");
                                        Role = rs2.getString("role");
                                        Salary = rs2.getString("salary");
                                        
                                %>
                                    <OPTION VALUE="<%= idemployees%>"><%= idemployees%>,<%= EmployeeName%>,<%= EmployeeSurname%>,<%= Adress%>,<%= Role%>,<%= Salary%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                     </td>
                </tr>
                <tr>
                    <td align="right">Bonus_Status:</td>
                    <td> <input type="text" name="Bonus_Status" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Paid_leave_staus:</td>
                    <td> <input type="text" name="Leave_Status" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga bonus" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>