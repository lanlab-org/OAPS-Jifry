<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Author Home</title>
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
<sql:setDataSource user="wzf" password="wzf" url="jdbc:mysql://121.4.94.30:3306/oo?serverTimezone=GMT%2B8" driver="com.mysql.jdbc.Driver" var="db"/>

<sql:query var="result" dataSource="${ db}">
    select * from article a , subject s where a.sid=s.sid
</sql:query>
<header>
<h1>Admin Article</h1>
<nav>
<a href="Controller?page=home">Index</a>
<%--<a href="AuthorController?page=articles"></a>--%>
    <a href=" Controller?page=administrator">AdminSubject</a>

    <a href="AdministratorController?page=logout">Logout</a>
</nav>
</header>



<div>
<table class="table2">
<tr>
<th>Subject</th>
<th>Title</th>
<th>Highlight</th>
    <th>Hide</th>
<th>Option</th>
</tr>
<c:forEach items="${result.rows}" var="row">
<tr>
<td><c:out value="${ row.subject}"></c:out></td>
<td><a  href="Controller?page=view-article&title=${ row.title}&id=${row.aid}"><c:out value="${row.title}"></c:out></a></td>
    <c:set var="highlight" value="${row.highlight}"></c:set>
    <c:set var="spots" value=""></c:set>
    <c:if test="${fn:length(highlight)>20}" >
        <c:set var="highlight" value="${fn:substring(highlight,0,10)}"></c:set>
        <c:set var="spots" value="......"></c:set>
    </c:if>
<td><c:out value="${highlight}"></c:out><c:out value="${ spots}"></c:out></td>
    <td><c:out value="${ row.hide}"></c:out></td>
<td><a href="AuthorController?page=edit&aid=${ row.aid}&title=${row.title}">edit</a> ||
    <a href="AuthorController?page=delete&aid=${ row.aid}&title=${row.title}">delete</a>||
    <a href="AuthorController?page=show&aid=${ row.aid}&title=${row.title}">show</a>||
    <a href="AuthorController?page=hide&aid=${ row.aid}&title=${row.title}">hide</a>
</td>
</tr>
</c:forEach>
</table>
</div>

<footer>
2020 copyright&copy;Wu Zhongfu
</footer>

</body>
</html>