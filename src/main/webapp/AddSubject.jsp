<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
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

        .form1
        {
            width:60%;
            margin: 0px auto;
            font-size:20px;
        }

        table
        {
            margin:20px;
        }

        .form1 input
        {
            width:200%;
            margin-bottom:15px;
            border-radius:3px;
            padding-left:5px;
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
    <h1>Welcome Administrator</h1>
    <nav>
        <a href="AuthorController?page=home">Home</a>
        <%--<a href="AuthorController?page=articles"></a>--%>
        <a href="AdministratorController?page=logout">logout</a>
    </nav>
</header>


<h3 style="text-align: center;">${info}</h3>
<form class="form1" action="AdministratorController" method="post">
    <input type="hidden" name="page" value="addSubject">
    <table>
        <tr>
            <td><input type="text" name="subject"  placeholder="Enter a subject name" required></td>
        </tr>


        <tr>
            <td><button>Add the Subject</button></td>
        </tr>
        <tr>
            <td><input type="text" hidden name="parentsid" value="${parentsid}"></td>
        </tr>
    </table>

</form>

<%--</c:forEach>--%>

<footer>
    2020 copyright&copy;Wu Zhongfu
</footer>

</body>
</html>