<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link href="foodblog.css" rel="stylesheet" type="text/css" />
<link href="table.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="validation.js"></script>
</head>
<body>
	<%@ include file="header.html" %>
	<%@ page session="false" %>
	<form name="login" action="login2.jsp" method="post">
		<table class="center">
			<tr>
				<td colspan="2">Login</td>
			</tr>
			<tr>
				<td>Username</td>
				<td>
					<input type="text" name="username" size ="30" placeholder="Enter your username here.">
					<div id="usernameAlert"></div>
				</td>
			</tr>
			<tr>
				<td>Password</td>
				<td>
					<input type="password" name="password" size ="30" placeholder="Enter your password here.">
					<div id="passwordAlert"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="register.jsp">New User?</a>
<!-- 					<a href="forgotPassword.jsp">Forgot Password.</a> -->
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Login" onclick="return loginValidation()"></td>
			</tr>
		</table>
	</form>
	<%@ include file="footer.html" %>
</body>
</html>