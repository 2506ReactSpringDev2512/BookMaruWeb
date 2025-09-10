<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 | 북마루 도서관리 시스템</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/mypage.css">
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>

    <div class="main-container">
        <div class="content-wrapper">
            <!-- 마이페이지 타이틀 -->
            <h1 class="mypage-title">${sessionScope.memberName}님의 마이페이지</h1>

            <!-- 대출 도서 섹션 -->
            <div class="section-title">
                <h2>대출 도서</h2>
            </div>

            <c:choose>
                <c:when test="${empty lendList}">
                    <div class="no-books-message">
                        <p>대출 중인 도서가 없습니다.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="loan-books-grid">
                        <c:forEach var="book" items="${lendList}">
                            <div class="loan-book-item">
                                <div class="loan-book-left">
                                    <div class="loan-book-image-container">
                                        <img src="${pageContext.request.contextPath}/BOOK-IMG/${book.bookNo}.jpg"
                                             alt="${book.bookName}"
                                             class="loan-book-image"
                                             onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">
                                        <div class="book-placeholder" style="display: none;">
                                            책 이미지 없음
                                        </div>
                                    </div>
                                    <form action="${pageContext.request.contextPath}/member/returnbook" method="post" style="margin: 0;">
                                        <input type="hidden" name="bookNo" value="${book.bookNo}">
                                        <button type="submit" class="return-btn">반납</button>
                                    </form>
                                </div>

                                <div class="loan-book-info">
                                    <div class="loan-detail">
                                        <span class="loan-label">제목</span>
                                        <span class="loan-value">${book.bookName}</span>
                                    </div>
                                    <div class="loan-detail">
                                        <span class="loan-label">작가</span>
                                        <span class="loan-value">${book.author}</span>
                                    </div>
                                    <div class="loan-detail">
                                        <span class="loan-label">대출 일시</span>
                                        <span class="loan-value">${book.lendDate}</span>
                                    </div>
                                    <div class="loan-detail">
                                        <span class="loan-label">반납 기한</span>
                                        <span class="loan-value">${book.returnDate}</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>

            <!-- 추천도서 섹션 -->
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
                            <div class="recommended-placeholder">추천도서 준비중</div>
                        </div>
                        <div class="book-item">
                            <div class="recommended-placeholder">추천도서 준비중</div>
                        </div>
                        <div class="book-item">
                            <div class="recommended-placeholder">추천도서 준비중</div>
                        </div>
                        <div class="book-item">
                            <div class="recommended-placeholder">추천도서 준비중</div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            
            
            
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>