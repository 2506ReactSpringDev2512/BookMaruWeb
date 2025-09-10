<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="searchType" value="${empty searchType ? 'all' : searchType}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 검색</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/book/searchbook.css">
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