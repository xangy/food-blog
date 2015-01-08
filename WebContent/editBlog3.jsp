<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link href="foodblog.css" rel="stylesheet" type="text/css" />
<link href="table.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="validation.js"></script>
</head>
<body>
	<%@ page session="true" %>
	<%@ page language="java" import="java.sql.Connection" %>
	<%@ page language="java" import="java.sql.DriverManager" %>
	<%@ page language="java" import="java.sql.Statement" %>
	<%@ page language="java" import="java.sql.SQLException" %>
	<%@ page language="java" import="java.io.*" %>
	<%
		String headline = request.getParameter("headline");
		String body = request.getParameter("body");
		String flag = request.getParameter("flag");
		String query = null;
		String oldHeadline = (String) session.getAttribute("oldHeadline");
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
			sqlStatement = con.createStatement();
			query = "UPDATE blog SET headline='" + headline +"', body='" + body + "' WHERE headline='" + oldHeadline + "'";
			if("1".equals(flag)) {
				query = "DELETE FROM blog WHERE headline='" + oldHeadline + "'";
			}
			int sqlStatus = sqlStatement.executeUpdate(query);
			out.println(sqlStatus);
			if(sqlStatus != 0) {
				RequestDispatcher rd = request.getRequestDispatcher("userMenu.jsp");
				rd.forward(request, response);
			}
			else {
				out.println("Error! Please try again.");
			}
		}
		catch (SQLException ex) {
			ex.printStackTrace();
		}
		finally {
			session.removeAttribute("oldHeadline");
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