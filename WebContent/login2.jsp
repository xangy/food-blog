<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link href="foodblog.css" rel="stylesheet" type="text/css" />
<link href="table.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ page session="true" %>
	<%@ page language="java" import="java.sql.Connection" %>
	<%@ page language="java" import="java.sql.DriverManager" %>
	<%@ page language="java" import="java.sql.Statement" %>
	<%@ page language="java" import="java.sql.SQLException" %>
	<%@ page language="java" import="java.sql.ResultSet" %>
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
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
			String query = "SELECT password FROM foodblogger WHERE username='" + username +"'";
			ResultSet rs = sqlStatement.executeQuery(query);
			if(rs.next()) {
				if(password.equals(rs.getString("password"))) {
					session.setAttribute("username", username);
					RequestDispatcher rd = request.getRequestDispatcher("userMenu.jsp");
					rd.forward(request, response);
				}
			}
			else {
				out.println("Error! Please try again.");
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