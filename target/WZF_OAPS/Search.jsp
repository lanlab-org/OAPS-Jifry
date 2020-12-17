<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
<!--  <a href="com.javaBeans.Controller?page=aboutus">About us</a> -->
<a href="Controller?page=contact">Contact us for help</a>
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

<sql:query var="result" dataSource="${db}">
select * from article a , subject s where a.sid=s.sid  and  hide="No" and (title like '%<%=request.getAttribute("search2") %>%' or abstracts like '%<%=request.getAttribute("search2") %>%' or highlight like '%<%=request.getAttribute("search2") %>%') order by time desc
</sql:query>

<!--  -->

<!-- method highlighter reads picks user input keyword and database search results
as arguments. It confirms if the input keyword is in the result set retrieved from
database. if this is true, then the entire search results is highlighted. Else the result
isn't highlighted -->
<%!
   public String highlighter(String s,String searchResults){
	 String finalOutput = null;
	 
  if(searchResults !=  null){
   
    if(s.contains(searchResults))
    {
        finalOutput = "<span style='background-color:yellow'> " + s+ "  </span>";
    }
    else
    {
    	finalOutput = s;
    }
  
  }
  
	return finalOutput;
}

 %>

<div>
<table class="table2">
<tr>
<th>Subject</th>
<th>Title</th>
<th>Author Email</th>
<th>Time</th>
<th>Popularity</th>
</tr>

<c:forEach items="${result.rows}" var="row">

<!-- setting results from database  into c: tag variable-->
	<c:set  value="${search2}" var="search2"></c:set> 
	<c:set var="subj_name" value="${row.subject}"/>
 	<c:set var="subj_title" value="${row.title}"></c:set> 
 
	<!-- this scriplet accesses user input search string from servlet as well as from
	database inorder to be used as arguments for the highlighter function -->
	
<%
	String searchResults = (String)request.getAttribute("search2");
	String subj_name = (String)pageContext.getAttribute("subj_name");
	String subj_title = (String)pageContext.getAttribute("subj_title");
	
	//printing output in console for the purpose of debugging
	System.out.println(searchResults);
	System.out.println(subj_name );
	System.out.println(subj_title );
%>
<tr>
<td><c:out value="${row.subject}"></c:out></td>
<td><a href="Controller?page=view-article&title=${row.title}"> <c:out value="${row.title}"></c:out> </a></td>
<td><c:set var = "string" value = "${fn:length(row.author)}"/><c:out value="${fn:substring(row.author, 0, 3)}***${fn:substring(row.author, string-8, string)}"></c:out></td>
<td><c:out value="${row.time}"></c:out></td>
<td><c:out value=""></c:out></td>
</tr>
</c:forEach>
</table>
</div>

<br><br>

<!-- When the user enters a search keyword, that keyword is sent to the servlet "com.javaBeans.Controller.java" where the servlet
looks for an HTTP request parameter called "search2", then extracts the search keyword and assigns it to request 
attribute, that attribute is redirected to this page.
In the following search query we are searching for the keyword assigned to "search2" from the "com.javaBeans.Controller.java" servlet.
And then the search results are stored in the variable "result2". -->
<sql:query var="result2" dataSource="${db}">
select * from comments where comment like '%<%=request.getAttribute("search2") %>%' order by time desc
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
<td><a href="Controller?page=view-article&title=${row2.title}"> <c:out value="${row2.title}"></c:out> </a></td>
<td><c:out value="${row2.comment}"></c:out></td>
<td><c:out value="${row2.time}"></c:out></td>
<td><c:set var = "string" value = "${fn:length(row2.user)}"/><c:out value="${fn:substring(row2.user, 0, 3)}***${fn:substring(row2.user, string-8, string)}"></c:out></td>
</tr>
</c:forEach>
<tr>
</tr>
</table>
</div>


<footer>
Copyright (C) 2019, 2020 [MIJC Team]
</footer>

</body>
</html>