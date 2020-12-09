<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Author Register</title>
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

.form1
{
	border:5px solid gray;
	border-radius:7px;
	padding:20px;
	width:25%;
	margin: 0px auto;
}

table
{
	text-align:center;
	margin: 0px auto;
}

table h1
{
	color:royalblue;
	margin-bottom:20px;
}

table input
{
	border-radius:5px;
	margin-bottom: 10px;
	width:90%;
}

table button
{
	border-radius:5px;
	margin-bottom: 10px;
	width:50%;
	background:royalblue;
	color:white;
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

<form action="/OAPS/Controller" method="post">
<input type="hidden" name="page" value="select">
<select name="option">
<option value="Articles">Articles</option>
<option value="Comments">Comments</option>
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


<form action="/OAPS/AdminController" method="post" class="form1">
<table>
<tr><td><h1>Author Registration</h1></td></tr>
<tr><td><input type="hidden" name="page" value="register-form"></td></tr>
<tr><td>email</td></tr>
<tr><td><input type="email" name="email" required></td></tr>
<tr><td>password</td></tr>
<tr><td><input type="password" name="password" required></td></tr>
<tr><td>confirm password</td></tr>
<tr><td><input type="password" name="conpassword" required></td></tr>
<tr><td><button>register</button></td></tr>
<tr><td style="color:red"> <c:out value="${ msg}"></c:out> </td></tr>
</table>
</form>


<footer>
2019 copyright&copy;mjh.mohamed
</footer>

</body>
</html>