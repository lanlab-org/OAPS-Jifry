<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<sql:setDataSource user="root" password="root" url="jdbc:mysql://127.0.0.1:3306/oo?serverTimezone=GMT%2B8" driver="com.mysql.cj.jdbc.Driver" var="db"/>

<sql:query var="result" dataSource="${ db}">
    select * from subject order by parentsid
</sql:query>

<header>
    <h1>Admin Subject</h1>
    <nav>
        <a href="Controller?page=home">Index</a>
        <%--<a href="AuthorController?page=articles"></a>--%>

        <a href="AuthorController">AdminArticle</a>
        <a href="AdministratorController?page=add">AddRootSubject</a>
        <a href="AdministratorController?page=logout">Logout</a>
    </nav>
</header>



<div>
    <table class="table2">
        <tr>
            <th>SubjectId</th>
            <th>Name</th>
            <th>ParentId</th>
            <th>LastModificationTime</th>
            <th></th>

        </tr>
        <c:forEach items="${result.rows}" var="row">
            <tr>
                <td><c:out value="${ row.sid}"></c:out></td>
                <td><c:out value="${ row.subject}"></c:out></td>
                <td><c:out value="${ row.parentsid}"></c:out></td>
                <td><fmt:formatDate value="${ row.sdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>

                <td><a href="AdministratorController?page=edit&subject=${ row.subject}">edit</a> ||
                    <a href="AdministratorController?page=delete&sid=${ row.sid}">delete</a>
                    <c:if test="${row.parentsid==0}">
                        ||
                    <a href="AdministratorController?page=add&parentsid=${ row.sid}">AddChildSubject</a>
                    </c:if>

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