<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Article</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	color:black;
	font-weight:bold;
	font-size:20px;
}

.div1 .td2
{
	color:black;
	padding-bottom:20px;
}

.like
{
	color: rgba(0,150,136,1);
	background: rgba(38,166,154,0.3);
	width:30px;
	height:30px;
	border-radius:50%;
	border-color: rgba(0,150,136,1);
	
}

.dislike
{
	color: rgba(255,82,82,1);
	background: rgba(255,138,128,0.3);
	width:30px;
	height:30px;
	border-radius:50%;
	border-color: rgba(255,82,82,1);
}

.popularity
{
	display:inline-block;
}

.div1 .downloadtd
{
	width:200%; 
	border:1px solid white;
}

.div1 .download
{
	background:royalblue; 
	color:white; 
	border-radius:3px; 
	padding:5px; 
	float:right;
}

.div2
{
	margin:0px auto;
	width:60%;
	border:1px solid gray;
	border-radius:5px;
	margin-bottom:30px;
}

.div2 table
{
	margin:20px;
}

.div2 input
{
	width:100%;
	border-radius:3px;
	margin-bottom:10px;
	font-size:20px;
	padding-left:10px;
	border:0.5px solid dodgerblue;
}

.div2 .input2
{
	width:100%;
	height:100px; 
}

.div2 table td
{
	width:770px;
}

.div2 button
{
	background:royalblue;
	color:white;
	border-radius:4px;
	float:right;
	padding:5px; 
	border:none;
	width:70px;
}

.div3
{
	margin:0px auto;
	width:60%;
	border:1px solid gray;
	border-radius:5px;	
}

.div3 table
{
	margin:10px;
}

.div3 table td
{
	width:790px;
}

.time
{
	float:right;
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
<a href="Controller?page=admin">Author</a>

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

<sql:setDataSource user="root" password="1234" url="jdbc:mysql://localhost:3306/ooad?serverTimezone=UTC&&autoReconnect=true&&useSSL=false" driver="com.mysql.cj.jdbc.Driver" var="db"/>

<sql:query var="result" dataSource="${ db}">
select * from article where title="${ title}";
</sql:query>

<%---------------------------------------------------------------------- --%>

<sql:query var="result3" dataSource="${ db}">
select * from user_ip where prefer=1 and title="${ title}";
</sql:query>

<c:set var="x" value="0"></c:set>
<c:forEach items="${ result3.rows}" var="row">

<c:set var="x" value="${ x+1}"></c:set>
</c:forEach>

<%---------------------------------------------------------------------- --%>

<sql:query var="result4" dataSource="${ db}">
select * from user_ip where prefer=0 and title="${ title}";
</sql:query>

<c:set var="y" value="0"></c:set>
<c:forEach items="${ result4.rows}" var="row">

<c:set var="y" value="${ y+1}"></c:set>
</c:forEach>

<div class="div1">
<table>

<tr><td><h1> <c:out value="${ title}"> </c:out> </h1> </td></tr>

<c:forEach items="${ result.rows}" var="row">

<tr><td class="td1">Abstract</td></tr>
<tr><td class="td2"><c:out value="${ row.abstracts}"></c:out></td></tr>

<tr><td class="td1">Highlight</td></tr>
<tr><td class="td2"><c:out value="${ row.highlight}"></c:out></td></tr>

<tr><td class="td1">Publication Date</td></tr>
<tr><td class="td2"><c:out value="${ row.time}"></c:out></td></tr>

<tr><td class="td1">Author</td></tr>
<tr><td  class="td2"><a href="Controller?page=authorarticle&author=${ row.author}" style="color:dodgerblue"> <c:set var="string" value="${ fn:length(row.author)}"></c:set> <c:out value="${ fn:substring(row.author, 0, 3)} *** ${ fn:substring(row.author, string-9, string)}"></c:out> </a> </td></tr>

<tr><td class="downloadtd">
<form action="/OAPS/Controller" method="post" class="popularity">
<input type="hidden" name="page" value="like">
<input type="hidden" name="title" value="${ title}">
<button class="like"><i class="fa fa-thumbs-o-up"></i></button>
<c:out value="${ x}"></c:out>
</form>
<form action="/OAPS/Controller" method="post"  class="popularity">
<input type="hidden" name="page" value="dislike">
<input type="hidden" name="title" value="${ title}">
<button class="dislike"><i class="fa fa-thumbs-o-down"></i></button>
<c:out value="${y}"></c:out>
</form>
<a class="download" href="DownloadServlet?fileName=${ row.filename}" >Download</a>
<td></tr>

</c:forEach>

</table>
</div>

<div class="div2">

<form action="/OAPS/Controller" method="post">
<input type="hidden" name="page" value="comment-post">
<input type="hidden" name="title" value="${ title}">
<input type="hidden" name="id" value="${ id}">
<table>
<tr><td> <input type="email" name="email" required placeholder="enter your email"> </td></tr>
<tr><td> <input class ="input2" type="text" name="comment" required placeholder="write something here"> </td></tr>
<tr><td style="width:200%; border:1px solid white;"> <button>Post</button> </td></tr>
<tr><td style="color:red"> <c:out value="${ msg}"></c:out> </td></tr>
</table>
</form>

</div>

<sql:query var="result2" dataSource="${ db}">
select * from comments where title="${ title}"
</sql:query>

<%---------------------------------------------------------------------- --%>
<%-- This block is the comment box, where the comment, user, and time are 
	 going to be displayed. 
 --%>

<c:forEach items="${ result2.rows}" var="row">
<div class="div3">
<table>
<tr><td><a> <c:out value="${ row.user}"></c:out> </a> </td></tr>
<tr><td> <c:out value="${ row.comment}"></c:out> </td></tr>
<tr><td><p class="time"> <c:out value="${ row.time}"></c:out> </p> </td></tr>
<tr>
<td>

<!-- ............................................................... -->
<!-- This block create like button and functionality to each comment-->

<sql:query var="result5" dataSource="${ db}">
select * from comments_ip where prefer=1 and id="${ row.id}";
</sql:query>

<c:set var="q" value="0"></c:set>
<c:forEach items="${ result5.rows}" var="row1">

<c:set var="q" value="${ q+1}"></c:set>
</c:forEach>

<form action="/OAPS/Controller" method="post" class="popularity">
<input type="hidden" name="page" value="comments_like">
<input type="hidden" name="id" value="${ row.id}">
<input type="hidden" name="title" value="${ title}">
<button class="like"><i class="fa fa-thumbs-o-up"></i></button>
<c:out value="${ q}"></c:out>
</form>

<!-- ............................................................... -->
<!-- This block create dislike button and functionality to each comment-->

<sql:query var="result6" dataSource="${ db}">
select * from comments_ip where prefer=0 and id="${ row.id}";
</sql:query>

<c:set var="r" value="0"></c:set>
<c:forEach items="${ result6.rows}" var="row2">

<c:set var="r" value="${ r+1}"></c:set>
</c:forEach>


<form action="/OAPS/Controller" method="post"  class="popularity">
<input type="hidden" name="page" value="comments_dislike">
<input type="hidden" name="id" value="${ row.id}">
<input type="hidden" name="title" value="${ title}">
<button class="dislike"><i class="fa fa-thumbs-o-down"></i></button>
<c:out value="${ r}"></c:out>
</form>

<!-- ............................................................... -->

</td>
</tr>
</table>
</div>

<br><br>

</c:forEach>

<footer>
2019 copyright&copy;mjh.mohamed
</footer>

</body>
</html>