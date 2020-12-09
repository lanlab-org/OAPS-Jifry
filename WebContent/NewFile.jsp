<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NewFile</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style.css">
<style type="text/css">

body
{
	margin:0px;
}

header
{
	background-color:black;
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
	border:1px solid gray;
	margin: 0px auto;
	width:60%;
	border-radius:3px;
	font-size:20px;
}

.table1
{
	margin:15px;
}

.table1 h1
{
	font-size:20px;
	margin-bottom:20px;
	color:black
}

.table1 input
{
	margin-bottom:20px;
	border-radius:3px;
	width:120%;
	padding-left:10px;
}

.table1 button
{
	margin-bottom:20px;
}

div
{	
	width:80%;
	margin:50px auto;
}

.table2
{
	width:100%;
}

.table2 th
{
	border:1px solid gray;
	border-right:none;
	border-left:none;
	text-align:center;
	font-size:20px;
	margin-bottom:20px;
}

.table2 td
{
	text-align:center;
	font-size:20px;
}

.table2 a
{
	text-decoration:none;
}

footer
{
	background:black;
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
<nav>
<a href="Controller?page=home">Home</a>
<a href="Controller?page=aboutus">About us</a>
<a href="Controller?page=contact">Contact</a>
<a href="Controller?page=admin">Admin</a>

<form action="/OAPS/Controller" method="post">
<input type="hidden" name="page" value="select">
<select name="option">
<option value="Articles">Articles</option>
</select>
<button>go</button>
</form>

<form action="/OAPS/Controller" method="post">
<input type="hidden" name="page" value="search">
<input type="text" name="search2" required>
<button>search</button>
</form>
</nav>
</header>

<form action="/OAPS/Controller" method="post" class="form1">
<input type="hidden" name="page" value="post-article">
<input type="hidden" name="subject" value="${ subject}">
<table class="table1">
<tr><td><h1>You are in <c:out value="${ subject}"></c:out></h1></td></tr>
<tr><td><input type="email" name="email" placeholder="enter email to post" required></td></tr>
<tr><td><button>Post Article</button></td></tr>
</table>
</form>

<sql:setDataSource user="root" password="1234" url="jdbc:mysql://localhost:3306/ooad?serverTimezone=UTC&&autoReconnect=true&&useSSL=false" driver="com.mysql.cj.jdbc.Driver" var="db"/>

<sql:query var="result" dataSource="${ db}">
select * from article where subject='<%=request.getAttribute("subject") %>'
</sql:query>

<div>
<table class="table2">
<tr>
<th>Title</th>
<th>Author</th>
<th>Time</th>
<th>Popularity</th>
</tr>
<c:forEach items="${result.rows}" var="row">
<tr>
<td><a href="Controller?page=view-article&title=${ row.title}"> <c:out value="${ row.title}"></c:out> </a></td>
<td><c:set var = "string" value = "${ fn:length(row.author)}"/><c:out value="${ fn:substring(row.author, 0, 3)}***${ fn:substring(row.author, string-8, string)}"></c:out></td>
<td><c:out value="${ row.time}"></c:out></td>
<td><c:out value=""></c:out></td>

</tr>
</c:forEach>
</table>
</div>

<footer>
2019 copyright&copy;mjh.mohamed
</footer>

</body>
</html>