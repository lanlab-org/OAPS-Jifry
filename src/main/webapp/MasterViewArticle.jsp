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
<title>Master View Article</title>
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

.div1
{
	margin:0px auto;
	width:60%;
	border:1px solid gray;
	border-radius:5px;
	margin-bottom:30px;
}

.div1 table
{
	margin:20px;
	margin-top:10px;
}

.div1 table h1
{
	color:gray;
	font-weight:bold;
}

.div1 .td1
{
	color:dodgerblue;
	font-weight:bold;
	font-size:20px;
}

.div1 .td2
{
	color:dodgerblue;
	padding-bottom:20px;
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

<sql:setDataSource user="wzf" password="wzf" url="jdbc:mysql://121.4.94.30:3306/oo?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8" driver="com.mysql.jdbc.Driver" var="db"/>

<sql:query var="result" dataSource="${ db}">
select * from article a , subject s where a.sid=s.sid  and title="${ title}";
</sql:query>

<div class="div1">
<table>

<tr><td><h1> <c:out value="${ title}"> </c:out> </h1> </td></tr>

<c:forEach items="${ result.rows}" var="row">

<tr><td class="td1">Abstract</td></tr>
<tr><td class="td2"><c:out value="${ row.abstracts}"></c:out></td></tr>

<tr><td class="td1">Highlight</td></tr>
<tr><td class="td2"><c:out value="${ row.highlight}"></c:out></td></tr>

<tr><td class="td1">Publication Date</td></tr>
<tr><td class="td2"><fmt:formatDate value="${row.time}" pattern="yyyy-MM-dd HH:mm:ss" /></td></tr>

</c:forEach>

</table>
</div>

<footer>
2020 copyright&copy;Wu Zhongfu
</footer>

</body>
</html>