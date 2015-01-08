<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Food Blog's Home</title>
<link href="foodblog.css" rel="stylesheet" type="text/css" />
<link href="table.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="header.html" %>
	<%@ page session="false" %>
	<%@ page language="java" import="java.sql.Connection" %>
	<%@ page language="java" import="java.sql.DriverManager" %>
	<%@ page language="java" import="java.sql.Statement" %>
	<%@ page language="java" import="java.sql.SQLException" %>
	<%@ page language="java" import="java.sql.ResultSet" %>
	<%
		try {
            Class.forName("org.gjt.mm.mysql.Driver");
        }
		catch (ClassNotFoundException ex) {
            // handle the error
            ex.printStackTrace();
        }
		Connection con = null;
		Statement sqlStatement = null;
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodblog", "root", "frmghy");
			sqlStatement = con.createStatement(); // generate query
			String query = "SELECT * FROM blog ORDER BY date DESC";
			ResultSet rs = sqlStatement.executeQuery(query);
			while(rs.next()) {
	%>
	<h1>**<%= rs.getString("headline") %></h1>
	<table class="full">
		<tr>
			<td class="full">Author:<%= rs.getString("username") %></td>
		</tr>
		<tr>
			<td class="full">Dated:<%= rs.getDate("date") %></td>
		</tr>
		<tr>
			<td class="full"><%= rs.getString("body") %></td>
		</tr>
	</table>			
	<%
			}
		}
		catch (SQLException ex) {
			ex.printStackTrace();
		}
		finally {
		    if (sqlStatement != null) {
		        try {
		        	sqlStatement.close();
		        }
		        catch (SQLException ex) {
		        	ex.printStackTrace();
		        }
		        sqlStatement = null;
		    }
		    if (con != null) {
		        try {
		        	con.close();
		        }
		        catch (SQLException ex) {
		        	ex.printStackTrace();
		        }

		        con = null;
		    }
		}
	%>
	<%@ include file="footer.html" %>
</body>
</html>