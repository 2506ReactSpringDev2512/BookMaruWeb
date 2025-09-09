<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 | 북마루 도서관리 시스템</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Inria Sans', Arial, sans-serif;
            background-color: #ffffff;
        }

        .main-container {
            width: 100%;
            max-width: 1280px;
            margin: 0 auto;
            background-color: #ffffff;
            min-height: 100vh;
            position: relative;
        }

        .content-wrapper {
            padding-top: 90px;
        }

        /* 마이페이지 타이틀 */
        .mypage-title {
            color: #000000;
            text-align: center;
            font-size: 48px;
            font-family: 'Inria Sans', Arial, sans-serif;
            font-weight: bold;
            margin: 40px 0 60px 0;
            line-height: 1.2;
        }

        .section-title {
            padding: 0 20px;
            margin-bottom: 30px;
        }

        .section-title h2 {
            color: #000000;
            font-size: 28px;
            font-family: 'Inria Sans', Arial, sans-serif;
            margin: 0;
            font-weight: bold;
        }

        /* 대출 도서 섹션 - 2개씩 중앙 정렬 */
        .loan-books-grid {
            display: flex;
            gap: 30px;
            padding: 0 20px;
            justify-content: flex-start;
            flex-wrap: wrap;
            margin-bottom: 40px;
            max-width: 1030px;
            margin-left: auto;
            margin-right: auto;
        }

        .loan-book-item {
            display: flex;
            flex-direction: row;
            width: 500px;
            background-color: transparent;
            gap: 20px;
        }

        .loan-book-left {
            display: flex;
            flex-direction: column;
            width: 180px;
            flex-shrink: 0;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            background-color: #ffffff;
        }

        .loan-book-image-container {
            width: 100%;
            height: 240px;
            position: relative;
            background-color: #f8f8f8;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .loan-book-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .book-placeholder {
            background-color: #e8e8e8;
            height: 100%;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #999;
            font-size: 14px;
            position: relative;
            overflow: hidden;
        }

        .book-placeholder::before,
        .book-placeholder::after {
            content: '';
            position: absolute;
            background-color: #ccc;
            width: 150%;
            height: 1px;
        }

        .book-placeholder::before {
            transform: rotate(45deg);
        }

        .book-placeholder::after {
            transform: rotate(-45deg);
        }

        .return-btn {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
            flex-shrink: 0;
        }

        .return-btn:hover {
            background-color: #45a049;
        }

        .loan-book-info {
            flex: 1;
            padding: 25px 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background-color: #ffffff;
        }

        .loan-detail {
            margin: 10px 0;
            font-size: 15px;
            color: #333;
            display: flex;
            align-items: flex-start;
        }

        .loan-label {
            width: 80px;
            font-weight: bold;
            color: #555;
            flex-shrink: 0;
        }

        .loan-value {
            flex: 1;
            color: #222;
            line-height: 1.4;
        }

        .no-books-message {
            text-align: center;
            padding: 60px 20px;
            color: #666;
            font-size: 18px;
            background-color: #f8f9fa;
            margin: 20px;
            border-radius: 12px;
        }

        /* 추천도서 섹션 - main.jsp와 동일한 스타일 */
        .books-grid {
            display: flex;
            gap: 20px;
            padding: 0 20px;
            justify-content: center;
            flex-wrap: wrap;
            margin-bottom: 30px;
        }

        .book-item {
            width: 223px;
            height: 272px;
            background-color: #ffffff;
            position: relative;
            border: 2px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            transition: all 0.3s ease;
            cursor: pointer;
            flex-shrink: 0;
        }

        .book-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            border-color: #4CAF50;
        }

        .book-image {
            width: 100%;
            height: 200px;
            object-fit: contain;
            background-color: #f9f9f9;
        }

        .recommended-placeholder {
            background-color: #e0e0e0;
            height: 100%;
            width: 100%;
            border: 3px solid #000000;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #666;
            font-size: 14px;
        }

        .book-info {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: rgba(255, 255, 255, 0.95);
            padding: 10px;
            text-align: center;
        }

        .book-title {
            margin: 0;
            font-size: 14px;
            color: #333;
            font-weight: bold;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
    </style>
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