<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신간도서</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/book/recentbooks.css">
</head>
<body>

<jsp:include page="../common/header.jsp"></jsp:include>

<div class="container">
    <h1 style="text-align: center;">신간도서</h1>
    
    <c:choose>
        <c:when test="${not empty newBooks}">
            <div class="book-grid">
                <c:forEach var="book" items="${newBooks}">
                    <div class="book-item" onclick="location.href='${pageContext.request.contextPath}/book/detail?bNo=${book.bookNo}'" style="cursor: pointer;">
                        <img src="${pageContext.request.contextPath}/BOOK-IMG/${book.bookNo}.jpg" 
                             alt="책 이미지" 
                             class="book-image"
                             onerror="this.src='${pageContext.request.contextPath}/BOOK-IMG/default.jpg'">
                        <div class="book-name">${book.bookName}</div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="no-results">
                신간도서가 없습니다.
            </div>
        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>