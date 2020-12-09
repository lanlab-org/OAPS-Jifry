<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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


<sql:setDataSource user="root" password="1234" url="jdbc:mysql://localhost:3306/ooad?serverTimezone=UTC&&autoReconnect=true&&useSSL=false" driver="com.mysql.cj.jdbc.Driver" var="db" />

<sql:query var="result" dataSource="${ db}">
	select * from article where title='<%= request.getAttribute("title")%>'
</sql:query>

<c:forEach items="${ result.rows}" var="row">


<form class="form1" action="/OAPS/AdminController" method="post">
<input type="hidden" name="page" value="edit-form">
<input type="hidden" name="old-title" value="<%= request.getAttribute("title")%>">
<table>

<tr>
<td>Current Subject</td>
</tr>

<tr>
<td><input type="text" name="subject" value="<c:out value="${ row.subject}"></c:out>" readonly style="background:lightgray"></td>
</tr>

<tr>
<td>Title</td>
</tr>

<tr>
<td><input type="text" name="title" value="<c:out value="${ row.title}"></c:out>" placeholder="Enter title" required></td>
</tr>

<tr>
<td>Highlights</td>
</tr>

<tr>
<td><input type="text" name="highlights" value="<c:out value="${ row.highlight}"></c:out>" placeholder="Enter highlights" required></td>
</tr>

<tr>
<td>Abstract</td>
</tr>

<tr>
<td><input type="text" name="abstracts" value="<c:out value="${ row.abstracts}"></c:out>" placeholder="Enter abstract" required></td>
</tr>


<tr>
<td><button>update</button></td>
</tr>

</table>
</form>

</c:forEach>

<footer>
2019 copyright&copy;mjh.mohamed
</footer>

</body>
</html>