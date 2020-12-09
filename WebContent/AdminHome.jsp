<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style.css">
<style type="text/css">

header h1
{
	float:left;
	color:white;
	margin-left:20px;
}

header nav
{
	float:right;
	margin-right:20px;
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
<h1>Welcome Admin</h1>
<nav>
<a href="AdminController?page=home">Home</a>
<a href="AdminController?page=articles"></a>
<a href="AdminController?page=logout">logout</a>
</nav>
</header>

<sql:setDataSource user="root" password="1234" url="jdbc:mysql://localhost:3306/ooad?serverTimezone=UTC&&autoReconnect=true&&useSSL=false" driver="com.mysql.cj.jdbc.Driver" var="db"/>

<sql:query var="result" dataSource="${ db}">
select * from article where author="${ email}"
</sql:query>

<div>
<table class="table2">
<tr>
<th>Subject</th>
<th>Title</th>
<th>Highlight</th>
<th>Option</th>
</tr>
<c:forEach items="${result.rows}" var="row">
<tr>
<td><c:out value="${ row.subject}"></c:out></td>
<td><c:out value="${ row.title}"></c:out></td>
<td><c:out value="${ row.highlight}"></c:out></td>
<td><a href="AdminController?page=edit&title=${ row.title}">edit</a> || 
    <a href="AdminController?page=delete&title=${ row.title}">delete</a></td>
</tr>
</c:forEach>
</table>
</div>

<footer>
2019 copyright&copy;mjh.mohamed
</footer>

</body>
</html>