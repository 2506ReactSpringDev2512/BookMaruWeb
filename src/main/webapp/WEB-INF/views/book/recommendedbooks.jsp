<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천도서</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/book/recommendedbooks.css">
</head>
<body>

<jsp:include page="../common/header.jsp"></jsp:include>

<div class="container">
    <h1 style="text-align: center;">추천도서</h1>
    
    <c:choose>
        <c:when test="${not empty recommendedBooks}">
            <div class="book-grid">
                <c:forEach var="book" items="${recommendedBooks}">
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
                추천도서가 없습니다.
            </div>
        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>
