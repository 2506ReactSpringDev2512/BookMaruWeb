<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신간도서</title>
<style>
/* 전체 컨테이너 */
.main-container {
        max-width: 1200px;
        margin: 0 auto;
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        margin-top: 20px;
}

/* 섹션 제목 */
.section-title {
    text-align: center;
    margin-bottom: 30px;
}

/* 책 그리드 */
.books-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 20px;
}

/* 책 아이템 */
.book-item {
    cursor: pointer;
    text-align: center;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 10px;
    transition: transform 0.2s, box-shadow 0.2s;
    background-color: #fff;
}

.book-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

/* 책 이미지 */
.book-image {
    width: 100%;
    height: 220px;
    object-fit: cover;
    border-radius: 5px;
}

/* 책 정보 */
.book-info {
    margin-top: 10px;
}

.book-title {
    font-weight: bold;
    font-size: 16px;
    margin-bottom: 5px;
}

.book-author, .book-publisher {
    font-size: 14px;
    color: #555;
}

/* placeholder */
.book-placeholder {
    height: 300px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #999;
    font-size: 16px;
    border: 1px dashed #ccc;
    border-radius: 8px;
}


</style>
</head>
<body>

<jsp:include page="../common/header.jsp"></jsp:include>

<div class="main-container">
    <div class="section-title">
        <h2>추천도서</h2>
    </div>

    <div class="content-wrapper">
        <div class="books-grid">
            <c:choose>
                <c:when test="${not empty recommendedBooks}">
                    <c:forEach var="book" items="${recommendedBooks}">
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
                    <!-- 책이 없을 경우 placeholder 4개 표시 -->
                    <div class="book-placeholder">추천도서 준비중</div>
                    <div class="book-placeholder">추천도서 준비중</div>
                    <div class="book-placeholder">추천도서 준비중</div>
                    <div class="book-placeholder">추천도서 준비중</div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>
