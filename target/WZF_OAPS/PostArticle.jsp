<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Post Articles</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="style.css">
    <style type="text/css">

        body {
            margin: 0px;
        }

        header {
            background-color: dodgerblue;
            text-align: center;
            height: 70px;
            margin-bottom: 50px;
        }

        header nav {
            padding-top: 20px;
        }

        header a {
            font-size: 25px;
            margin-left: 25px;
            text-decoration: none;
            color: white;
            cursor: default;
        }

        header a:hover {
            color: gold;
            text-decoration: none;
        }

        header form {
            display: inline-block;
        }

        header select {
            margin-left: 25px;
            font-size: 25px;
            border-radius: 3px 3px 3px 3px;
        }

        header button {
            font-size: 20px;
            border-radius: 5px 5px 5px 5px;
        }

        header input {
            margin-left: 25px;
            font-size: 20px;
            border-radius: 3px 3px 3px 3px;
        }

        .form1 {
            width: 60%;
            margin: 0px auto;
            font-size: 20px;
        }

        table {
            margin: 20px;
        }
        .redFont {
            color: red;
        }

        .form1 input {
            width: 160%;
            margin-bottom: 15px;
            border-radius: 3px;
            padding-left: 5px;
        }

        #IDverifyCode {
            width: 33%;
        }

        footer {
            background: dodgerblue;
            height: 40px;
            color: white;
            text-align: center;
            padding: 5px;
            font-size: 20px;
            margin-top: 50px;
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
    </nav>
</header>

<form class="form1" action="UploadServlet" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td style="text-align: center;"><h1 class="redFont">${suggestion}</h1></td>
        </tr>
        <tr>
            <td>Current Subject</td>
        </tr>
        <tr>
            <td><input type="text" name="subject" value="<c:out value="${ subject}"></c:out>" readonly
                       style="background:lightgray"></td>
        </tr>
        <tr>
            <td>Author's email</td>
        </tr>
        <tr>
            <td><input type="text" name="author" value="<c:out value="${email}"></c:out>" readonly
                       style="background:lightgray"></td>
        </tr>
        <tr>
            <td>Author's Name</td>
        </tr>
        <tr>
            <td><input type="text" name="authorName" value="<c:out value="${authorName}"></c:out>" readonly
                       style="background:lightgray"></td>
        </tr>
        <tr>
            <td>Title</td>
        </tr>
        <tr>
            <td><input type="text" name="title" placeholder="Enter title" required></td>
        </tr>
        <tr>
            <td>Highlights</td>
        </tr>
        <tr>
            <td><input type="text" name="highlights" placeholder="Enter highlights" required></td>
        </tr>
        <tr>
            <td>Abstract</td>
        </tr>
        <tr>
            <td><input type="text" name="abstracts" placeholder="Enter abstract" required></td>
        </tr>
        <tr>
            <td><input type="file" name="file" required></td>
        </tr>
        <tr>
            <td>Verification Code</td>
        </tr>
        <tr>
            <td><input type="text" name="verifyCode" class="verifyCode" id="IDverifyCode">
                <img src="" onclick="changeCode()" id="verifyCode-img"/><a
                        href="javascript:changeCode()">看不清&nbsp;换一张</a></td>
        </tr>
        <tr>
            <td>
                <button>Post</button>
            </td>
        </tr>
        <tr><td><input type="text" name="psid" hidden value="${psid}"></td></tr>

    </table>
</form>

<footer>
    2020 copyright&copy;Wu Zhongfu
</footer>
<script type="text/javascript">
    function changeCode() {
        var Oimg = document.getElementById("verifyCode-img");
        Oimg.src = "ValidateController?time=" + new Date().getTime();
    }

    window.onload = function () {
        changeCode();
    }
</script>
</body>
</html>