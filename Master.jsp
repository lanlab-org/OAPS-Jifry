<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Master Admin</title>
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
<h1>Welcome Admin</h1>
<nav>
<a href="AdminController?page=master-home">Home</a>
<a href="AdminController?page=master-articles">Articles</a>
<a href="AdminController?page=master-comments">Comments</a>
<a href="AdminController?page=master-authors">Authors</a>
<a href="blocklist.jsp">BlockList</a>
</nav>
</header>

<footer>
2019 copyright&copy;mjh.mohamed
</footer>

</body>
</html>