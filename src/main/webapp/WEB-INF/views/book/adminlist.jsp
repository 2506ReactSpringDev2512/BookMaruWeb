<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 관리 - 목록</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f5f5f5;
    }
    .container {
        max-width: 1200px;
        margin: 0 auto;
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .header {
        text-align: center;
        margin-bottom: 30px;
        color: #333;
    }
    .book-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
        gap: 20px;
        padding: 20px;
    }
    .book-item {
        border: 2px solid #ddd;
        border-radius: 8px;
        padding: 15px;
        text-align: center;
        background-color: #fafafa;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    .book-item:hover {
        border-color: #4CAF50;
        background-color: #f0f8f0;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .book-form {
        margin: 0;
    }
    .book-image {
        width: 150px;
        height: 200px;
        object-fit: cover;
        border-radius: 4px;
        margin-bottom: 10px;
        border: 1px solid #ddd;
    }
    .book-info {
        margin-top: 10px;
    }
    .book-no {
        font-weight: bold;
        color: #2c3e50;
        margin-bottom: 5px;
    }
    .book-name {
        color: #34495e;
        font-size: 14px;
    }
    .no-books {
        text-align: center;
        color: #666;
        font-size: 18px;
        margin: 50px 0;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>도서 관리 시스템</h1>
            <h2>등록된 도서 목록</h2>
        </div>
        
        <c:choose>
            <c:when test="${empty bList}">
                <div class="no-books">
                    등록된 도서가 없습니다.
                </div>
            </c:when>
            <c:otherwise>
                <div class="book-grid">
                    <c:forEach var="book" items="${bList}">
                        <form action="${pageContext.request.contextPath}/admin/list" method="post" class="book-form">
                            <input type="hidden" name="bNo" value="${book.bookNo}">
                            <div class="book-item" onclick="this.closest('form').submit()">
                                <img src="${pageContext.request.contextPath}/BOOK-IMG/${book.bookNo}.jpg" 
                                     alt="책 이미지" 
                                     class="book-image"
                                     onerror="this.src='${pageContext.request.contextPath}/BOOK-IMG/default.jpg'">
                                <div class="book-info">
                                    <div class="book-name">${book.bookName}</div>
                                </div>
                            </div>
                        </form>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

</body>
</html>