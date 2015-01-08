<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<link href="foodblog.css" rel="stylesheet" type="text/css" />
<link href="table.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="validation.js"></script>
</head>
<body>
	<%@ include file="header.html" %>
	<%@ page session="false" %>
	<form name="registration" action="register2.jsp" method="post">
		<table class="center">
			<tr>
				<td colspan="2">Registration form for new foodblogger.</td>
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
				<td>First Name</td>
				<td>
					<input type="text" name="firstName" size ="30" placeholder="Enter your first name here.">
					<div id="firstNameAlert"></div>
				</td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td>
					<input type="text" name="lastName" size ="30" placeholder="Enter your last name here.">
					<div id="lastNameAlert"></div>
				</td>
			</tr>
			<tr>
				<td>Email</td>
				<td>
					<input type="text" name="email" size ="30" placeholder="Enter your email here.">
					<div id="emailAlert"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Register" onclick="return validation()"></td>
			</tr>
		</table>
	</form>
	<%@ include file="footer.html" %>
</body>
</html>