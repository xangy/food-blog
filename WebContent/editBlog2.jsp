<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit your Blog</title>
<link href="foodblog.css" rel="stylesheet" type="text/css" />
<link href="table.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="validation.js"></script>
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
		String headline = request.getParameter("headline");
		session.setAttribute("oldHeadline", headline);
		String body = null;
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
			String query = "SELECT * FROM blog WHERE headline='" + headline +"'";
			ResultSet rs = sqlStatement.executeQuery(query);
			if(!session.isNew())
				while(rs.next()) {
					body = rs.getString("body");
				}
	%>
	<form name="blog" action="editBlog3.jsp" method="post">
		<table class="center full">
			<tr>
				<td class="full">Headline:</td>
			</tr>
			<tr>
				<td class="full">
					<input type="text" name="headline" size ="50" value='<%= headline %>' />
					<div id="headlineAlert"></div>
				</td>
			</tr>
			<tr>
				<td class="full">Food Blog:</td>
			</tr>
			<tr>
				<td class="full">
					<textarea name="body" rows="15" cols="120" placeholder="Write your blog here."><%= body %></textarea>
					<div id="blogAlert"></div>
				</td>
			</tr>
			<tr>
				<td class="full">
					<input type="radio" name="flag" value="0" checked>Edit&nbsp;&nbsp;&nbsp;
					<input type="radio" name="flag" value="1">Delete
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="Update" onclick="return blogValidation()"></td>
			</tr>
		</table>
	</form>
	<%
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