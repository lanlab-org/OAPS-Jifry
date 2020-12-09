<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
<a href="<c:url value="file-list.jsp"/>">list</a>

</body>
</html>