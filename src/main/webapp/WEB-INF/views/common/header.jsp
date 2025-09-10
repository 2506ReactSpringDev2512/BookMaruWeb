<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/header.css">
<script>
	document.addEventListener('DOMContentLoaded', function() {
    const userMenu = document.querySelector('.user-menu');
    const userIcon = document.querySelector('.user-icon');
    if (userIcon && userMenu) {
        // 사용자 아이콘 클릭 시 메뉴 토글
        userIcon.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            userMenu.classList.toggle('active');
        });
        
        // 메뉴 외부 클릭 시 메뉴 닫기
        document.addEventListener('click', function(e) {
            if (!userMenu.contains(e.target)) {
                userMenu.classList.remove('active');
            }
        });
    }
});
</script>
</head>
<body>
<header class="header">
    <!-- 로고 -->
    <div class="logo">
        <a href="/">
            <img src="${pageContext.request.contextPath}/BOOK-IMG/logo.png" alt="로고">
        </a>
    </div>
    <!-- 검색창 -->
    <form class="search-form" action="${pageContext.request.contextPath}/book/searchbook" method="get">
        <input type="hidden" name="searchType" value="all">
        <input type="text" name="bookSearchTerm" placeholder="검색어 입력">
        <button type="submit"><i class="fa fa-search"></i></button>
    </form>
    <!-- 메뉴 -->
    <nav class="menu">
        <a href="/book/recommendedbooks">추천도서</a>
        <a href="/book/recentbooks">신간도서</a>
        <c:choose>
            <c:when test="${not empty sessionScope.memberId}">
                <!-- 로그인된 상태 - 드롭다운 메뉴 -->
                <div class="user-menu">
                    <img src="${pageContext.request.contextPath}/BOOK-IMG/mypage.png" alt="내 서재" class="user-icon">
                    <div class="dropdown-menu">
                        <a href="/member/mypage">내 서재</a>
                        <a href="/member/logout">로그아웃</a>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <!-- 로그인되지 않은 상태 - 로그인 페이지로 이동 -->
                <a href="/member/login">
                    <img src="${pageContext.request.contextPath}/BOOK-IMG/mypage.png" alt="로그인" class="user-icon">
                </a>
            </c:otherwise>
        </c:choose>
    </nav>
</header>
</body>
</html>