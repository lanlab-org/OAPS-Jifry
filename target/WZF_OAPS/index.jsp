<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
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

        .list-group-item {
            border: none;
            font-size: 25px;

        }
        .list-group-item02
        {
            border:none;
            font-size:20px;
            margin-left:20px;
            color:blue;
        }

        .subitem {

            border: none;
            margin-left: 50px;
            font-size: 21px;
            color: green;
            text-decoration: none;
            cursor: pointer;
        }
        .pop_subitem {
            margin-left:50px;
            font-size:18px;
            color: red;
        }

        .sub_subitem {
            margin-left: 120px;
            font-size: 18px;
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

        a:hover {
            background-color: yellow;
            text-decoration: none;
        }
        .seepop {
            color: blue;
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

<sql:setDataSource user="root" password="root"
                   url="jdbc:mysql://127.0.0.1:3306/oo?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8"
                   driver="com.mysql.cj.jdbc.Driver" var="db"/>

<sql:query var="subject" dataSource="${db}">
    select * from subject where parentsid=0
</sql:query>
<sql:query var="mostPopular" dataSource="${db}">
    select lov.aid,lov.title,SUM(lov.prefer) AS popular FROM love_article lov,article art where lov.aid=art.aid and art.hide!="Yes"  group BY title order by popular DESC LIMIT 0,2;
</sql:query>
<div class="container">
    <div class="row">
        <div class="col-md-5">
            <div class="list-group">
                <table class="list-group-item02">
                    <tr>
                        <th>Most Popular Article</th>
                    </tr>
                    <c:forEach items="${mostTwoPop}" var="mos_popular">
                        <tr>
                            <td>
                                <a class="pop_subitem" href="Controller?page=view-article&title=${mos_popular.title}&id=${mos_popular.aid}">
                                    <c:out value="${mos_popular.title}"></c:out></a></td>
                        </tr>
                    </c:forEach>

                </table>
                <div><a class="pop_subitem seepop" href="PopController"> To see all articles' popularity</a></div>
                <c:forEach items="${subject.rows}" var="s_row">
                    <%--<sql:query var="article" dataSource="${ db}">--%>
                    <%--select * from article a , subject s where a.sid=s.sid  and subject="${s_row.subject}" and hide="No";--%>
                    <%--</sql:query>  --%>
                    <sql:query var="sub_subject" dataSource="${ db}">
                        select * from subject where parentsid=${s_row.sid};
                    </sql:query>


                    <div class="list-group-item"><c:out value="${s_row.subject}"></c:out></div>
                    <c:forEach items="${ sub_subject.rows}" var="row">
                        <a class="subitem" href="Controller?page=subject&id=${ row.subject}&psid=${row.parentsid}"><c:out
                                value="${ row.subject}"></c:out></a><br>
                        <sql:query var="article" dataSource="${ db}">
                            select * from article a , subject s where a.sid=s.sid and subject="${row.subject}" and hide="No";
                        </sql:query>
                        <c:forEach items="${ article.rows}" var="a_row">
                            <a class="sub_subitem"
                               href="Controller?page=view-article&title=${ a_row.title}&id=${a_row.aid}"><c:out
                                    value="${a_row.title}"></c:out></a><br>
                        </c:forEach>
                    </c:forEach>
                </c:forEach>

            </div>
        </div>
    </div>
</div>

<footer>
    2020 copyright&copy;Wu Zhongfu
</footer>

</body>
</html>