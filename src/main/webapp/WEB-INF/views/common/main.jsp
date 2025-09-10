<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북마루 도서관리 시스템</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/main.css">
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <div class="main-container">
        <div class="content-wrapper">
        <!-- Main Advertisement Section -->
        <div class="advertisement-section"> 
            <div class="ad-books-grid" id="advertiseBooksGrid">
                <c:choose>
                    <c:when test="${not empty advertiseBooks}">
                        <c:forEach var="book" items="${advertiseBooks}" end="4">
                            <div class="ad-book-item" onclick="location.href='${pageContext.request.contextPath}/book/detail?bNo=${book.bookNo}'">
                                <img src="${pageContext.request.contextPath}/BOOK-IMG/${book.bookNo}.jpg" 
                                     alt="${book.bookName}" 
                                     class="ad-book-image"
                                     onerror="this.src='${pageContext.request.contextPath}/BOOK-IMG/default.jpg'">
                                <div class="ad-book-info">
                                    <p class="ad-book-title">${book.bookName}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="ad-book-item">
                            <div class="book-placeholder">광고 도서 준비중</div>
                        </div>
                        <div class="ad-book-item">
                            <div class="book-placeholder">광고 도서 준비중</div>
                        </div>
                        <div class="ad-book-item">
                            <div class="book-placeholder">광고 도서 준비중</div>
                        </div>
                        <div class="ad-book-item">
                            <div class="book-placeholder">광고 도서 준비중</div>
                        </div>
                        <div class="ad-book-item">
                            <div class="book-placeholder">광고 도서 준비중</div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        <!-- New Books Section -->
        <div class="section-title" style="margin-top: 50px;">
            <h2>신간도서</h2>
        </div>
        
        <!-- New Books Grid -->
        <div class="books-grid" id="newBooksGrid">
            <c:choose>
                <c:when test="${not empty newBooks}">
                    <c:forEach var="book" items="${newBooks}" end="3">
                        <div class="book-item" onclick="location.href='${pageContext.request.contextPath}/book/detail?bNo=${book.bookNo}'">
                            <img src="${pageContext.request.contextPath}/BOOK-IMG/${book.bookNo}.jpg" 
                                 alt="${book.bookName}" 
                                 class="book-image"
                                 onerror="this.src='${pageContext.request.contextPath}/BOOK-IMG/default.jpg'">
                            <div class="book-info">
                                <p class="book-title">${book.bookName}</p>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="book-item">
                        <div class="book-placeholder">신간도서 준비중</div>
                    </div>
                    <div class="book-item">
                        <div class="book-placeholder">신간도서 준비중</div>
                    </div>
                    <div class="book-item">
                        <div class="book-placeholder">신간도서 준비중</div>
                    </div>
                    <div class="book-item">
                        <div class="book-placeholder">신간도서 준비중</div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <!-- Recommended Books Section -->
        <div class="section-title" style="margin-top: 80px;">
            <h2>추천도서</h2>
        </div>
        <!-- Recommended Books Grid -->
        <div class="books-grid" id="recommendedBooksGrid">
            <c:choose>
                <c:when test="${not empty recommendedBooks}">
                    <c:forEach var="book" items="${recommendedBooks}" end="3">
                        <div class="book-item" onclick="location.href='${pageContext.request.contextPath}/book/detail?bNo=${book.bookNo}'">
                            <img src="${pageContext.request.contextPath}/BOOK-IMG/${book.bookNo}.jpg" 
                                 alt="${book.bookName}" 
                                 class="book-image"
                                 onerror="this.src='${pageContext.request.contextPath}/BOOK-IMG/default.jpg'">
                            <div class="book-info">
                                <p class="book-title">${book.bookName}</p>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="book-item">
                        <div class="book-placeholder">추천도서 준비중</div>
                    </div>
                    <div class="book-item">
                        <div class="book-placeholder">추천도서 준비중</div>
                    </div>
                    <div class="book-item">
                        <div class="book-placeholder">추천도서 준비중</div>
                    </div>
                    <div class="book-item">
                        <div class="book-placeholder">추천도서 준비중</div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        </div>
    </div>
    <script>
        function scrollNewBooks(direction) {
            const grid = document.getElementById('newBooksGrid');
            const scrollAmount = 243;
            if (direction === 'left') {
                grid.scrollLeft -= scrollAmount;
            } else {
                grid.scrollLeft += scrollAmount;
            }
        }
    </script>
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>