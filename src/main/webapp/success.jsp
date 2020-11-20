<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${ requestScope.msg!=null}">
<c:out value="${ requestScope.msg}"></c:out>
</c:if>

<c:if test="${ sessionScope.fileName!=null}">
<c:set var="file" scope="session" value="${ sessionScope.fileName}"></c:set>
</c:if>

<a href="<c:url value="DownloadServlet?fileName=${ file}" />">download</a>
<%--<a href="<c:url value="file-list.jsp"/>">list</a>--%>

</body>
</html>