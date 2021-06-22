<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Master Author</title>
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

<form action="AuthorController" method="post">
<input type="hidden" name="page" value="master-dropIp">
<input type="text" name="Ip">
<button>DROP WHOSE IP?</button>

<footer>
2020 copyright&copy;Wu Zhongfu
</footer>

</body>
</html>