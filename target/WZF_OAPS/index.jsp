<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
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

.list-group-item
{
	border:none;
	font-size:25px;

}

.subitem
{

    border:none;
	margin-left:50px;
	font-size:21px;
    color: green;
    text-decoration: none;
    cursor:pointer;
}
.sub_subitem
{
    margin-left:120px;
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
a:hover {
    background-color: yellow;
    text-decoration: none;
}

</style>
</head>
<body>

<header>
<nav>
<a href="Controller?page=home">Home</a>
<a href="Controller?page=aboutus">About us</a>u
<a href="Controller?page=contact">Contact</a>
<a href="Controller?page=administrator">Admin</a>
<form action="Controller" method="post">
<input type="hidden" name="page" value="select">
<select name="option">
<option value="Articles">Articles</option>
</select>
<button>go</button>
</form>

<form action="Controller" method="post">
<input type="hidden" name="page" value="search">
<input type="text" name="search2" required>
<button>search</button>
</form>
</nav>
</header>

<sql:setDataSource user="wzf" password="wzf" url="jdbc:mysql://47.115.56.157:3306/oo?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8" driver="com.mysql.jdbc.Driver" var="db"/>

<sql:query var="subject" dataSource="${db}">
    select * from subject where parentsid=0
</sql:query>

<div class="container">
<div class="row">
<div class="col-md-5">
<div class="list-group">
    <c:forEach items="${subject.rows}" var="s_row">
        <%--<sql:query var="article" dataSource="${ db}">--%>
            <%--select * from article a , subject s where a.sid=s.sid  and subject="${s_row.subject}" and hide="No";--%>
        <%--</sql:query>  --%>
        <sql:query var="sub_subject" dataSource="${ db}">
            select * from subject where parentsid=${s_row.sid};
        </sql:query>



        <div class="list-group-item" ><c:out value="${s_row.subject}"></c:out></div>
<c:forEach items="${ sub_subject.rows}" var="row">
<a class="subitem" href="Controller?page=subject&id=${ row.subject}"><c:out value="${ row.subject}"></c:out></a><br>
    <sql:query var="article" dataSource="${ db}">
        select * from article a , subject s where a.sid=s.sid  and subject="${row.subject}" and hide="No";
    </sql:query>
    <c:forEach items="${ article.rows}" var="a_row">
<a class="sub_subitem" href="Controller?page=view-article&title=${ a_row.title}"><c:out value="${a_row.title}"></c:out></a><br>
</c:forEach>
</c:forEach>
    </c:forEach>
<%--<a class="list-group-item" href="Controller?page=subject&id=Computer Science">Computer Science</a>--%>
<%--<c:forEach items="${ computer.rows}" var="row">--%>
<%--<a class="subitem" href="Controller?page=view-article&title=${ row.title}"><c:out value="${ row.title}"></c:out></a><br>--%>
<%--</c:forEach>--%>

<%--<a class="list-group-item" href="Controller?page=subject&id=Medical Science">Medical Science</a>--%>
<%--<c:forEach items="${ medical.rows}" var="row">--%>
<%--<a class="subitem" href="Controller?page=view-article&title=${ row.title}"><c:out value="${ row.title}"></c:out></a><br>--%>
<%--</c:forEach>--%>


<%--<a class="list-group-item" href="Controller?page=subject&id=Social Science">Social Science</a>--%>
<%--<c:forEach items="${ social.rows}" var="row">--%>
<%--<a class="subitem" href="Controller?page=view-article&title=${ row.title}"><c:out value="${ row.title}"></c:out></a><br>--%>
<%--</c:forEach>--%>

<%--<a class="list-group-item" href="Controller?page=subject&id=Biological Science">Biological Science</a>--%>
<%--<c:forEach items="${ biological.rows}" var="row">--%>
<%--<a class="subitem" href="Controller?page=view-article&title=${ row.title}"><c:out value="${ row.title}"></c:out></a><br>--%>
<%--</c:forEach>--%>

<%--<a class="list-group-item" href="Controller?page=subject&id=Mathematics">Mathematics</a>--%>
<%--<c:forEach items="${ math.rows}" var="row">--%>
<%--<a class="subitem" href="Controller?page=view-article&title=${ row.title}"><c:out value="${ row.title}"></c:out></a><br>--%>
<%--</c:forEach>--%>

</div>
</div>
</div>
</div>

<footer>
2020 copyright&copy;Wu Zhongfu
</footer>

</body>
</html>