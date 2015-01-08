<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Blog</title>
<link href="foodblog.css" rel="stylesheet" type="text/css" />
<link href="table.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="userHeader.jsp" %>
	<%@ page session="true" %>
	<%@ page language="java" import="java.sql.Connection" %>
	<%@ page language="java" import="java.sql.DriverManager" %>
	<%@ page language="java" import="java.sql.Statement" %>
	<%@ page language="java" import="java.sql.SQLException" %>
	<%@ page language="java" import="java.sql.ResultSet" %>
	<%
		String username = (String) session.getAttribute("username");
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
			String query = "SELECT * FROM blog WHERE username='" + username +"' ORDER BY date DESC";
			ResultSet rs = sqlStatement.executeQuery(query);
			if(!session.isNew())
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