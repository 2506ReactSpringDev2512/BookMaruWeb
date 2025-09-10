<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신간도서</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f5f5f5;
    min-width: 1200px;
    overflow-x: auto;
}
.container {
    width: 1200px;
    margin: 0 auto;
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    margin-top: 20px;
}

.book-grid {
    display: grid;
    grid-template-columns: repeat(5, 220px);
    gap: 20px;
    padding: 20px;
    justify-content: center;
}

/* 책 아이템 */
.book-item {
    position: relative;
    border: 2px solid #ddd;
    border-radius: 8px;
    padding: 15px;
    text-align: center;
    background-color: #fafafa;
    cursor: pointer;
    transition: all 0.3s ease;
    height: 250px;
    overflow: hidden;
}

.book-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

/* 책 이미지 */
.book-image {
    width: 150px;
    height: 200px;
    object-fit: cover;
    border-radius: 4px;
    border: 1px solid #ddd;
    margin-bottom: 5px;
}

.book-name {
    color: #34495e;
    font-size: 14px;
    margin-top: 5px;
}

.book-author, .book-publisher {
    font-size: 14px;
    color: #555;
}

.no-results {
    text-align: center;
    color: #666;
    font-size: 18px;
    margin: 50px 0;
}
</style>
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