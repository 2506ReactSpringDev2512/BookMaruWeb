<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="searchType" value="${empty searchType ? 'all' : searchType}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 검색</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f5f5f5;
    }
    .container {
        max-width: 1200px;
        margin: 0 auto;
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        margin-top: 20px;
    }
    .search-section {
        text-align: center;
        margin-bottom: 30px;
        padding: 20px;
        background-color: #f8f9fa;
        border-radius: 8px;
        display: flex;
    	flex-direction: column;
    	align-items: center; 
    }
    .search-form {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 10px;
        margion: 0px;
    }
    .search-form select {
        padding: 8px 12px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 14px;
    }
    .search-form input[type="text"] {
        padding: 8px 12px;
        border: 1px solid #ddd;
        border-radius: 4px;
        width: 300px;
        font-size: 14px;
        min-width: 300px;
    }
    .search-form input[type="submit"] {
        padding: 8px 20px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
    }
    .search-form input[type="submit"]:hover {
        background-color: #45a049;
    }
    .book-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
        gap: 20px;
        padding: 20px;
    }
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
        border-color: #4CAF50;
        background-color: #f0f8f0;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .book-image {
        width: 150px;
        height: 200px;
        object-fit: cover;
        border-radius: 4px;
        border: 1px solid #ddd;
        transition: filter 0.3s ease;
        margin-bottom: 5px;
    }
    .book-item:hover .book-image {
        filter: blur(3px);
    }
    .book-title-overlay {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: #333;
        font-weight: bold;
        font-size: 16px;
        text-align: center;
        opacity: 0;
        transition: opacity 0.3s ease;
        background-color: rgba(255, 255, 255, 0.9);
        padding: 10px;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.2);
        max-width: 180px;
        word-wrap: break-word;
        z-index: 10;
    }
    .book-item:hover .book-title-overlay {
        opacity: 1;
    }
    .book-name {
        color: #34495e;
        font-size: 14px;
        margin-top: 5px;
    }
    .no-results {
        text-align: center;
        color: #666;
        font-size: 18px;
        margin: 50px 0;
    }
    .search-results-title {
        color: #333;
        margin-bottom: 20px;
    }
</style>
<script>
window.onload = function() {
    var urlParams = new URLSearchParams(window.location.search);
    var searchTerm = urlParams.get('bookSearchTerm');
    var searchType = urlParams.get('searchType') || 'all';
    
    if (searchTerm && searchTerm.trim() !== '') {
        document.querySelector('input[name="bookSearchTerm"]').value = searchTerm;
        document.querySelector('select[name="searchType"]').value = searchType;
    }
};
</script>
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    
    <div class="container">
        <div class="search-section">
            <h1>책 검색</h1>
            <form action="${pageContext.request.contextPath}/book/searchbook" method="get" class="search-form">
                <select name="searchType">
                    <option value="all" <c:if test="${searchType == 'all'}">selected</c:if>>전체</option>
                    <option value="name" <c:if test="${searchType == 'name'}">selected</c:if>>제목</option>
                    <option value="author" <c:if test="${searchType == 'author'}">selected</c:if>>저자</option>
                </select>
                <input type="text" name="bookSearchTerm" value="${bookSearchTerm}" placeholder="검색어를 입력하세요">
                <input type="submit" value="검색">
            </form>
        </div>
        
        <c:choose>
            <c:when test="${not empty bookList}">
                <div class="search-results-title">
                    <h3>"${bookSearchTerm}" 검색 결과 (${bookList.size()}개)</h3>
                </div>
                <div class="book-grid">
                    <c:forEach var="book" items="${bookList}">
                        <div class="book-item" onclick="location.href='${pageContext.request.contextPath}/book/detail?bNo=${book.bookNo}'" style="cursor: pointer;">
                            <img src="${pageContext.request.contextPath}/BOOK-IMG/${book.bookNo}.jpg" 
                                 alt="책 이미지" 
                                 class="book-image"
                                 onerror="this.src='${pageContext.request.contextPath}/BOOK-IMG/default.jpg'">
                            <div class="book-title-overlay">
                                ${book.bookIntroTitle}
                            </div>
                            <div class="book-name">${book.bookName}</div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:when test="${not empty bookSearchTerm}">
                <div class="no-results">
                    "${bookSearchTerm}"에 대한 검색 결과가 없습니다.
                </div>
            </c:when>
        </c:choose>
    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>