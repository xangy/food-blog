<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Write your Blog</title>
<link href="foodblog.css" rel="stylesheet" type="text/css" />
<link href="table.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="validation.js"></script>
</head>
<body>
	<%@ include file="userHeader.jsp" %>
	<%@ page session="true" %>
	<form name="blog" action="writeBlog2.jsp" method="post">
		<table class="center full">
			<tr>
				<td class="full">Headline:</td>
			</tr>
			<tr>
				<td class="full">
					<input type="text" name="headline" size ="50" placeholder="Enter a catchy headline.">
					<div id="headlineAlert"></div>
				</td>
			</tr>
			<tr>
				<td class="full">Food Blog:</td>
			</tr>
			<tr>
				<td class="full">
					<textarea name="body" rows="15" cols="120" placeholder="Write your blog here."></textarea>
					<div id="blogAlert"></div>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="Post" onclick="return blogValidation()"></td>
			</tr>
		</table>
	</form>
	<%@ include file="footer.html" %>
</body>
</html>