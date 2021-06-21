<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About us</title>
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
@keyframes anim {
    0% {
        width: 0;
    }
    100% {
        width: 380px;
    }

}
div {

    width: 0;
    height: 30px;
    margin: 0 auto;
    font-size: 20px;
    color: green;
    overflow: hidden;
    white-space: nowrap;
    animation-name: anim;
    animation-duration: 3s;
    animation-timing-function: steps(19);
    animation-iteration-count: infinite;


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
<form action="Controller" method="post">
<input type="hidden" name="page" value="dropIp">
<button>DROP MY IP</button>
</form>
</nav>
</header>
<div>团队成员:吴钟富,唐震,卓晨曦,庄梓淇</div>
<footer>
    2020 copyright&copy;Wu Zhongfu
</footer>

</body>
</html>
