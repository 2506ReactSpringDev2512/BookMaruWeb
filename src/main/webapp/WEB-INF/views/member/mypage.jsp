<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>


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
        
        /* 광고 섹션 책 표시용 스타일 */
        .advertisement-section {
            position: relative;
            width: 100%;
            max-width: 1280px;
            height: 400px;
            margin: 0 auto;
            padding: 40px 20px;
            background-color: #f8f9fa;
            border: 2px solid #ddd;
            border-radius: 12px;
        }
        
        .ad-books-grid {
            display: flex;
            gap: 30px;
            justify-content: center;
            align-items: center;
            height: 100%;
        }
        
        .ad-book-item {
            width: 180px;
            height: 280px;
            background-color: #ffffff;
            position: relative;
            border: 2px solid #ddd;
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.3s ease;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .ad-book-item:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 24px rgba(0,0,0,0.15);
            border-color: #4CAF50;
        }
        
        .ad-book-image {
            width: 100%;
            height: 220px;
            object-fit: contain;
            background-color: #f9f9f9;
        }
        
        .ad-book-info {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: rgba(255, 255, 255, 0.95);
            padding: 12px;
            text-align: center;
        }
        
        .ad-book-title {
            margin: 0;
            font-size: 14px;
            color: #333;
            font-weight: bold;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        
        
        .section-title {
            padding: 0 20px;
            margin-bottom: 30px;
        }
        
        .section-title h2 {
            color: #000000;
            font-size: 24px;
            font-family: 'Inria Sans', Arial, sans-serif;
            margin: 0;
        }
        
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
        
        .book-placeholder {
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
        
        .section-nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            margin-top: 20px;
            margin-bottom: 40px;
            position: relative;
        }
        
        .section-nav-btn {
            width: 50px;
            height: 47px;
            border: none;
            border-radius: 50%;
            background-color: rgba(94, 88, 88, 0.4);
            color: #000000;
            font-size: 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            z-index: 10;
        }
        
        .section-nav-btn:hover {
            background-color: rgba(94, 88, 88, 0.6);
        }
        
        
        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .ad-title {
                font-size: 48px;
            }
            
            .advertisement-section {
                height: 300px;
            }
            
            .books-grid {
                gap: 15px;
                padding: 0 15px;
            }
            
            .book-item {
                width: calc(50% - 7.5px);
                height: 220px;
            }
            
            .book-image {
                height: 150px;
                object-fit: contain;
            }
        }
        
        @media (max-width: 480px) {
            .ad-title {
                font-size: 32px;
            }
            
            .advertisement-section {
                height: 200px;
            }
            
            .book-item {
                width: 100%;
                max-width: 300px;
            }
            
            .books-grid {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>


</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>


	<h1>"${memberName}"님의 마이페이지</h1>
	
	
	<div class="section-title" style="margin-top: 50px;">
    	<h2>대출 도서</h2>
	</div>
	
	
	<c:if test="${empty lendList}">
    <p>대출 중인 도서가 없습니다.</p>
	</c:if>
	<table border="1">
    <c:forEach var="book" items="${lendList}">
        <tr>
            <td><img src="${book.bookImage}" width="80"></td>
            <td>책 제목 ${book.bookName}</td>
            <td>작가 ${book.author}</td>
            <td>대출일 ${book.lendDate}</td>
            <td>반납 기한 ${book.returnDate}</td>
            <td>
                <form action="ReturnBookServlet" method="post">
                    <input type="hidden" name="bookNo" value="${book.bookNo}">
                    <input type="submit" value="반납">
                </form>
            </td>
        </tr>
    </c:forEach>
	
	
	<!-- Recommended Books Section -->
        <div class="section-title" style="margin-top: 80px;">
            <h2>추천도서</h2>
        </div>
        
        <!-- Recommended Books Grid -->
        <div class="books-grid" id="recommendedBooksGrid">
            <c:choose>
                <c:when test="${not empty recommendedBooks}">
                    <c:forEach var="book" items="${recommendedBooks}" end="3">
                        <div class="book-item">
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
           
    
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>