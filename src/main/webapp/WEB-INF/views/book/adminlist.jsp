<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 관리 - 관리자</title>
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
        height: 250px;
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
        margin-bottom: 0px;
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
/* Link Styles */
    .back-link {
        text-align: center;
        margin-top: 15px;
    }

    .back-link p {
        color: #666;
        font-size: 14px;
    }

    .back-link a {
        color: #6b7280;
        text-decoration: none;
        font-weight: bold;
    }

    .back-link a:hover {
        text-decoration: underline;
    }
    
    /* 별 아이콘 스타일 */
    .star-icon {
        position: absolute;
        top: 0px;
        left: 5px;
        font-size: 30px;
        cursor: pointer;
        z-index: 10;
    }
    
    .star-recommended {
        color: #FFD700;
    }
    
    .star-not-recommended {
        color: #ddd;
    }
    
    /* 하트 아이콘 스타일 */
    .heart-icon {
        position: absolute;
        top: 0px;
        right: 10px;
        font-size: 40px;
        cursor: pointer;
        z-index: 10;
    }
    
    .heart-advertise {
        color: #FF6B6B;
    }
    
    .heart-not-advertise {
        color: #ddd;
    }
    
    .book-item {
        position: relative;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>도서 관리 시스템</h1>
            <h2>⭐ - 추천도서        ♥️ - 광고도서</h2>
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
                                <!-- 별 아이콘 추가 -->
                                <span class="star-icon ${book.recommendedYN == 'Y' ? 'star-recommended' : 'star-not-recommended'}" 
                                      onclick="event.stopPropagation(); toggleRecommended('${book.bookNo}', '${book.recommendedYN}')">
                                    ★
                                </span>
                                
                                <!-- 하트 아이콘 추가 -->
                                <span class="heart-icon ${book.advertiseYN == 'Y' ? 'heart-advertise' : 'heart-not-advertise'}" 
                                      onclick="event.stopPropagation(); toggleAdvertise('${book.bookNo}', '${book.advertiseYN}')">
                                    ♥
                                </span>
                                
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
                <div class="back-link">
                <p><a href="<c:url value='/admin/main'/>">관리자 페이지로 돌아가기</a></p>
            </div>
            </c:otherwise>
        </c:choose>
    </div>
    
    <script>
        function toggleRecommended(bookNo, currentStatus) {
            // AJAX를 사용하여 추천 상태를 변경
            var form = document.createElement('form');
            form.method = 'POST';
            form.action = '${pageContext.request.contextPath}/admin/recommended-book';
            
            var bNoInput = document.createElement('input');
            bNoInput.type = 'hidden';
            bNoInput.name = 'bNo';
            bNoInput.value = bookNo;
            
            var recommendedInput = document.createElement('input');
            recommendedInput.type = 'hidden';
            recommendedInput.name = 'recommendedYN';
            recommendedInput.value = currentStatus;
            
            form.appendChild(bNoInput);
            form.appendChild(recommendedInput);
            document.body.appendChild(form);
            
            form.submit();
        }
        
        function toggleAdvertise(bookNo, currentStatus) {
            // AJAX를 사용하여 광고 상태를 변경
            var form = document.createElement('form');
            form.method = 'POST';
            form.action = '${pageContext.request.contextPath}/admin/advertise-book';
            
            var bNoInput = document.createElement('input');
            bNoInput.type = 'hidden';
            bNoInput.name = 'bNo';
            bNoInput.value = bookNo;
            
            var advertiseInput = document.createElement('input');
            advertiseInput.type = 'hidden';
            advertiseInput.name = 'advertiseYN';
            advertiseInput.value = currentStatus;
            
            form.appendChild(bNoInput);
            form.appendChild(advertiseInput);
            document.body.appendChild(form);
            
            form.submit();
        }
    </script>

</body>
</html>