<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<link href="foodblog.css" rel="stylesheet" type="text/css" />
<link href="table.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ page session="false" %>
	<%@ page language="java" import="java.sql.Connection" %>
	<%@ page language="java" import="java.sql.DriverManager" %>
	<%@ page language="java" import="java.sql.Statement" %>
	<%@ page language="java" import="java.sql.SQLException" %>
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		try {
            Class.forName("org.gjt.mm.mysql.Driver");
        }
		catch (ClassNotFoundException ex) {
            // handle the error
            ex.printStackTrace();
        }
		Connection con = null;
		Statement sqlStatement = null;
		int flag = 0;
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodblog", "root", "frmghy");
			sqlStatement = con.createStatement(); // generate query
			String query = "SELECT * FROM foodblogger";
			ResultSet rs = sqlStatement.executeQuery(query);
			while(rs.next()) {
				if(rs.getString("username").equals(username)) {
					flag = 1;
				}
				if(rs.getString("email").equals(email)) {
					flag = 2;
				}
			}
			if(flag == 1) {
				out.println("User already present. Try with different username.");
			}
			else if(flag == 2) {
				out.println("User already present. Try with different email.");
			}
			else {
				query = "INSERT INTO foodblogger (username, password, firstName, lastName, email) VALUES ('" + username + "', '" + password + "', '" + firstName + "', '" + lastName + "', '" + email + "')"; // get result code
				int sqlStatus = sqlStatement.executeUpdate(query);
				if(sqlStatus != 0) {
		%>
					<p align="center">User succesfully added.</p>
					<%@ include file="login.jsp" %>
		<%
				}
				else {
					out.println("Error! Please try again.");
				}
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
</body>
</html>