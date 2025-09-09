<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
/* 헤더 전체 */
.header {
    background-color: #e1e1e1;
    padding: 8px 0;
    height: 55px;
}

.header-container {
    max-width: 1280px;
    margin: 0 auto;
    padding: 0 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    height: 100%;
}

/* 로고 */
.logo img {
    width: 70px;
    height: 70px;
    border-radius: 50%;
    object-fit: cover;
}

/* 검색창 */
.search-form {
    flex: 1;
    display: flex;
    justify-content: center;
    max-width: 500px;
    margin: 0 20px;
}

.search-form input[type="text"] {
    width: 100%;
    padding: 10px 15px;
    border: 1px solid #000;
    border-radius: 25px;
    outline: none;
    font-size: 14px;
}

.search-form button {
    position: relative;
    right: 40px;
    background: none;
    border: none;
    cursor: pointer;
    font-size: 16px;
    color: gray;
}

/* 메뉴 */
.menu {
    display: flex;
    gap: 20px;
    align-items: center;
}

.menu a {
    text-decoration: none;
    color: black;
    font-weight: bold;
    font-size: 14px;
}

.menu a:hover {
    color: #007BFF;
}

/* 사용자 메뉴 아이콘 */
.user-menu {
    position: relative;
    display: inline-block;
}

.user-icon {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    object-fit: cover;
    cursor: pointer;
    transition: opacity 0.3s;
}

.user-icon:hover {
    opacity: 0.8;
}

/* 드롭다운 메뉴 */
.dropdown-menu {
    display: none;
    position: absolute;
    right: 0;
    top: 57px;
    background-color: white;
    min-width: 120px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    border-radius: 5px;
    z-index: 1000;
}

.dropdown-menu a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    font-size: 14px;
}

.dropdown-menu a:hover {
    background-color: #f1f1f1;
    color: #007BFF;
}

/* 드롭다운 표시 - 클릭으로 토글 */
.user-menu.active .dropdown-menu {
    display: block;
}

</style>

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
    <div class="header-container">
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
    </div>
</header>
</body>
</html>