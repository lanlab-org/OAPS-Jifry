<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
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
	width:100%;
	position:fixed;
	bottom:0;	
}

</style>
</head>
<body>

<header>
<nav>

<a href="Controller?page=home">Home</a>
<!--  <a href="com.controllerr.Controller?page=aboutus">About us</a> -->
<a href="Controller?page=contact">Contact us for help</a>
<a href="Controller?page=administrator">Admin</a>



<form action="Controller" method="post">
<input type="hidden" name="page" value="search">
<input type="text" name="search2">
<button>search</button>
</form>
</nav>
</header>

<sql:setDataSource user="root" password="root" url="jdbc:mysql://127.0.0.1:3306/oo?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8" driver="com.mysql.cj.jdbc.Driver" var="db"/>

<sql:query var="result" dataSource="${db}">
select * from article a , subject s where a.sid=s.sid  and  hide="No" and (authorName like '%<%=request.getAttribute("search2") %>%' or title like '%<%=request.getAttribute("search2") %>%' or abstracts like '%<%=request.getAttribute("search2") %>%' or highlight like '%<%=request.getAttribute("search2") %>%') order by time desc
</sql:query>

<div>
<table class="table2">
<tr>
<th>Subject</th>
<th>Title</th>
<th>Author</th>
<th>Time</th>
<th>Article Views</th>
</tr>
<c:forEach items="${result.rows}" var="row">
<c:set value="${search2}" var="search2"></c:set>
<tr>
<td><c:out value="${row.subject}"></c:out></td>
<td><a href="Controller?page=view-article&title=${row.title}&id=${row.aid}"> <c:out value="${row.title}"></c:out> </a></td>
<td><a href="Controller?page=authorarticle&author=${ row.author}" style="color:dodgerblue"><c:out value="${row.authorName}"></c:out></a></td>
<td><fmt:formatDate value="${row.time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
    <sql:query var="result6" dataSource="${ db}">
        select * from visit where aid="${ row.aid}";
    </sql:query>

    <c:set var="q" value="0"></c:set>
    <c:forEach items="${ result6.rows}" var="row1">

        <c:set var="q" value="${ q+1}"></c:set>
    </c:forEach>
<td><c:out value="${q}"></c:out></td>
</tr>
</c:forEach>
</table>
</div>

<br><br>

<!-- When the user enters a search keyword, that keyword is sent to the servlet "com.controllerr.Controller.java" where the servlet
looks for an HTTP request parameter called "search2", then extracts the search keyword and assigns it to request 
attribute, that attribute is redirected to this page.
In the following search query we are searching for the keyword assigned to "search2" from the "com.controllerr.Controller.java" servlet.
And then the search results are stored in the variable "result2". -->
<sql:query var="result2" dataSource="${db}">
select c.title,c.comment,c.time,c.user,a.aid from comments c,article a where a.aid=c.aid and a.hide="No" and  comment like '%<%=request.getAttribute("search2") %>%' order by time desc
</sql:query>

<!-- A table is created that shows the results fetched from the search query as follows. -->
<div>
<table class="table2">
<tr>
<th>Title</th>
<th>Comment</th>
<th>Time</th>
<th>Author</th>
</tr>
<!-- forEach loop to list all the records related to the search keyword. -->
<c:forEach items="${result2.rows}" var="row2">
<c:set value="${search2}" var="search2"></c:set>
<tr>
<td><a href="Controller?page=view-article&title=${row2.title}&id=${row2.aid}"> <c:out value="${row2.title}"></c:out> </a></td>
    <c:set var="comment" value="${row2.comment}"></c:set>
    <c:set var="spots" value=""></c:set>
    <c:if test="${fn:length(comment)>30}" >
        <c:set var="comment" value="${fn:substring(comment,0,30)}"></c:set>
        <c:set var="spots" value="......"></c:set>
    </c:if>
    <td><c:out value="${comment}${spots}"></c:out></td>
<td><fmt:formatDate value="${row2.time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
<td><c:out value="${fn:substring(row2.user, 0, 3)}***${fn:substring(row2.user, string-8, string)}"></c:out></td>
</tr>
</c:forEach>
<tr>
</tr>
</table>
</div>


<footer>
2020 copyright©Wu Zhongfu
</footer>

</body>
</html>