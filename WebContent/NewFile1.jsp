<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/booststrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
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

.list-group-item
{
	border:none;
	font-size:25px;
	cursor:pointer;
}

.subitem
{
	margin-left:50px;
	font-size:18px;
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

<form action="/OOAD/Controller" method="post">
<input type="hidden" name="page" value="select">
<select name="option">
<option value="Articles">Articles</option>
</select>
<button>go</button>
</form>

<form action="/OOAD/Controller" method="post">
<input type="hidden" name="page" value="search">
<input type="text" name="search2" required>
<button>search</button>
</form>
</nav>
</header>

<sql:setDataSource user="root" password="yujiahui@2014" url="jdbc:mysql://localhost:3306/oaps?autoReconnect=true&&useSSL=false&serverTimezone=CTT" driver="com.mysql.cj.jdbc.Driver" var="db"/>


<sql:query var="physical" dataSource="${ db}">
select * from article where subject="Physical Science";
</sql:query>

<sql:query var="computer" dataSource="${ db}">
select * from article where subject="Computer Science";
</sql:query>

<sql:query var="medical" dataSource="${ db}">
select * from article where subject="Medical Science";
</sql:query>

<sql:query var="social" dataSource="${ db}">
select * from article where subject="Social Science";
</sql:query>

<sql:query var="biological" dataSource="${ db}">
select * from article where subject="Biological Science";
</sql:query>

<sql:query var="math" dataSource="${ db}">
select * from article where subject="Mathematics";
</sql:query>


<div class="container">
<div class="row">
<div class="col-md-5">
<div class="list-group">
<a class="list-group-item" href="Controller?page=subject&id=Physical Science">Physical Science</a>
<c:forEach items="${ physical.rows}" var="row">
<a class="subitem" href="Controller?page=view-article&title=${ row.title}"><c:out value="${ row.title}"></c:out></a><br>
</c:forEach>

<a class="list-group-item" href="Controller?page=subject&id=Computer Science">Computer Science</a>
<c:forEach items="${ computer.rows}" var="row">
<a class="subitem" href="Controller?page=view-article&title=${ row.title}"><c:out value="${ row.title}"></c:out></a><br>
</c:forEach>

<a class="list-group-item" href="Controller?page=subject&id=Medical Science">Medical Science</a>
<c:forEach items="${ medical.rows}" var="row">
<a class="subitem" href="Controller?page=view-article&title=${ row.title}"><c:out value="${ row.title}"></c:out></a><br>
</c:forEach>


<a class="list-group-item" href="Controller?page=subject&id=Social Science">Social Science</a>
<c:forEach items="${ social.rows}" var="row">
<a class="subitem" href="Controller?page=view-article&title=${ row.title}"><c:out value="${ row.title}"></c:out></a><br>
</c:forEach>

<a class="list-group-item" href="Controller?page=subject&id=Biological Science">Biological Science</a>
<c:forEach items="${ biological.rows}" var="row">
<a class="subitem" href="Controller?page=view-article&title=${ row.title}"><c:out value="${ row.title}"></c:out></a><br>
</c:forEach>

<a class="list-group-item" href="Controller?page=subject&id=Mathematics">Mathematics</a>
<c:forEach items="${ math.rows}" var="row">
<a class="subitem" href="Controller?page=view-article&title=${ row.title}"><c:out value="${ row.title}"></c:out></a><br>
</c:forEach>

</div>
</div>
</div>
</div>

<footer>
2019 copyright&copy;mjh.mohamed
</footer>

</body>
</html>