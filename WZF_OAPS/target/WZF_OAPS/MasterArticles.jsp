<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Master Articles</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style.css">
<style type="text/css">

header
{
	background:dodgerblue;
}

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
	background:dodgerblue;
	height:40px;
	color:white;
	text-align:center;
	padding:5px;
	font-size:20px;
	position:fixed;
	bottom:0;
	width:100%;
}

</style>

</head>
<body>

<header>
<h1>Welcome Author</h1>
<nav>
<a href="AuthorController?page=master-home">Home</a>
<a href="AuthorController?page=master-articles">Articles</a>
<a href="AuthorController?page=master-comments">Comments</a>
<a href="AuthorController?page=master-authors">Authors</a>
<a href="blocklist.jsp">BlockList</a>
</nav>
</header>

<sql:setDataSource user="wzf" password="wzf" url="jdbc:mysql://47.115.56.157:3306/oo?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8" driver="com.mysql.jdbc.Driver" var="db"/>

<sql:query var="result" dataSource="${ db}">
select * from article a,subject s where a.sid=c.sid
</sql:query>

<div>
<table class="table2">
<tr>
<th>Title</th>
<th>Author</th>
<th>Time</th>
<th>Option</th>
</tr>
<c:forEach items="${result.rows}" var="row">
<tr>
<td><a href="AuthorController?page=master-view-article&title=${ row.title}"> <c:out value="${ row.title}"></c:out> </a></td>
<td><c:out value="${ row.author}"></c:out></td>
<td><c:out value="${ row.time}"></c:out></td>
<td><a href="AuthorController?page=master-delete&title=${ row.title}">delete</a></td>
</tr>
</c:forEach>
</table>
</div>

<footer>
2020 copyright&copy;Wu Zhongfu
</footer>

</body>
</html>