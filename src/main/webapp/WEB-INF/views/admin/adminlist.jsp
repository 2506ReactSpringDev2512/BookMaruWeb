<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 관리 - 관리자</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/adminlist.css">
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