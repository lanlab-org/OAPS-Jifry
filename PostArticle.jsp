<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Post Articles</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style.css">
<style type="text/css">

body
{
	margin:0px;
}

header
{
	background-color:dodgerblue;
	text-align:center;
	height:70px;
	margin-bottom:50px;
}

header nav
{
	padding-top:20px;
}

header a
{
	font-size:25px;
	margin-left:25px;
	text-decoration:none;
	color:white;
	cursor:
}

header a:hover
{
	color:gold;
	text-decoration:none;
}

header form
{
	display:inline-block;
}

header select
{
	margin-left:25px;
	font-size:25px;
	border-radius:3px 3px 3px 3px;
}

header button
{
	font-size:20px;
	border-radius:5px 5px 5px 5px;
}

header input
{
	margin-left:25px;
	font-size:20px;
	border-radius:3px 3px 3px 3px;
}

.form1
{
	width:60%;
	margin: 0px auto;
	font-size:20px;
}

table
{
	margin:20px;
}

.form1 input
{
	width:200%;
	margin-bottom:15px;
	border-radius:3px;
	padding-left:5px;
}

footer
{
	background:dodgerblue;
	height:40px;
	color:white;
	text-align:center;
	padding:5px;
	font-size:20px;
	margin-top:50px;
}



</style>
</head>
<body>

<header>
<%@include file="header.jsp" %>
</header>

<form class="form1" action="/OOAD/UploadServlet" method="post" enctype="multipart/form-data">
<table>

<tr>
<td>Author</td>
</tr>

<tr>
<td><input type="text" name="author" value="<c:out value="${ author}"></c:out>" readonly style="background:lightgray"></td>
</tr>

<tr>
<td>Current Subject</td>
</tr>

<tr>
<td><input type="text" name="subject" value="<c:out value="${ subject}"></c:out>" readonly style="background:lightgray"></td>
</tr>

<tr>
<td>Title</td>
</tr>

<tr>
<td><input type="text" name="title" value="<c:out value="${ title}"></c:out>" placeholder="Enter title" required></td>
</tr>

<tr>
<td>Highlights</td>
</tr>

<tr>
<td><input type="text" name="highlights" value="<c:out value="${ highlights}"></c:out>" placeholder="Enter highlights" required></td>
</tr>

<tr>
<td>Abstract</td>
</tr>

<tr>
<td><input type="text" name="abstracts" value="<c:out value="${ abstracts}"></c:out>" placeholder="Enter abstract" required></td>
</tr>

<tr>
<td><input type="file" name="file" required></td>
</tr>


<tr>
<td><button>Post</button></td>
</tr>

</table>
</form>

<footer>
<%@include file="footer.jsp" %>
</footer>

</body>
</html>