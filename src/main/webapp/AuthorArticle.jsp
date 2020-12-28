<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Author Article</title>
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
	cursor:default;
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
<a href="Controller?page=administrator">Admin</a>



<form action="Controller" method="post">
<input type="hidden" name="page" value="search">
<input type="text" name="search2">
<button>search</button>
</form>
</nav>
</header>

<sql:setDataSource user="wzf" password="wzf" url="jdbc:mysql://121.4.94.30:3306/oo?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8" driver="com.mysql.jdbc.Driver" var="db"/>

<sql:query var="result" dataSource="${ db}">
select * from article a , subject s where a.sid=s.sid  and author = '${ author}' and hide!="Yes"
</sql:query>

<div>
<table class="table2">
<tr>
<th>Author</th>
<th>Subject</th>
<th>Title</th>
<th>Time</th>
<th>Popularity</th>
<th>DownLoad</th>
</tr>
<c:forEach items="${result.rows}" var="row">
<tr>
<td  class="td2"><a href="Controller?page=authorarticle&author=${ row.author}" style="color:dodgerblue"><c:out value="${ row.authorName}"></c:out> </a> </td>
<td> <c:out value="${ row.subject}"></c:out> </td>
<td><a href="Controller?page=view-article&title=${ row.title}&id=${row.aid}"><c:out value="${ row.title}"></c:out></a></td>
<td><fmt:formatDate value="${row.time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
    <c:set var="popularity" value="0"></c:set>
    <sql:query var="result" dataSource="${ db}">
        select * from visit where aid="${ row.aid}";
    </sql:query>
    <c:forEach items="${ result.rows}" var="row1">

        <c:set var="popularity" value="${ popularity+1}"></c:set>
    </c:forEach>
<td><c:out value="${popularity}"></c:out></td>
<td><a href="DownloadServlet?fileName=${ row.filename}">Download</a></td>
</tr>
</c:forEach>
</table>
</div>


<footer>
2020 copyright&copy;Wu Zhongfu
</footer>

</body>
</html>