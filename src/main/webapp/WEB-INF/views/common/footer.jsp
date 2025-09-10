<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/footer.css">
</head>
<body>
    <!-- Footer -->
    <footer id="footer">
        <div class="footer-container">
            <div class="footer-brand">
                <h3><a href="/">BOOKMARU</a></h3>
                <p>지식과 상상력이 만나는 곳 · 스마트 도서관리 시스템</p>
            </div>

            <div class="footer-links">
                <a href="/book/searchbook?searchType=all&bookSearchTerm=" class="footer-link">도서 검색</a>
                <a href="/book/recentbooks" class="footer-link">신간 안내</a>
                <a href="/book/recommendedbooks" class="footer-link">추천 도서</a>
                <a href="/member/signup" class="footer-link">회원 가입</a>
            </div>
            
            <p class="footer-copyright">&copy; 2025 BOOKMARU. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
