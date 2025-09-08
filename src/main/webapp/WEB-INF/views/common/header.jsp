<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
    /* 헤더 전체 */
    .header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        background-color: #e1e1e1; 
        padding: 8px 20px;
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
        width: 45px;
        height: 45px;
        border-radius: 50%;
        object-fit: cover;
    }

    /* 검색창 */
    .search-form {
        flex: 1;
        display: flex;
        justify-content: center;
        max-width: 500px;
    }

    .search-form input[type="text"] {
        width: 100%;
        padding: 10px 15px;
        border: none;
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
</style>

</head>
<body>
	<header class="header">

		<!-- 로고 -->
	    <div class="logo">
	        <a href="<%=request.getContextPath()%>/book/main">
	            <img src="<%=request.getContextPath()%>/BOOK-IMG/logo.png" alt="로고">
	        </a>
	    </div>
		
		<!-- 검색창 -->
	    <form class="search-form" action="<%=request.getContextPath()%>/book/searchbook" method="get">
	        <input type="hidden" name="searchType" value="all">
	        <input type="text" name="bookSearchTerm" placeholder="검색어 입력" required>
	        <button type="submit"><i class="fa fa-search"></i></button>
	    </form>
		
		<!-- 메뉴 -->
	    <nav class="menu">
	        <a href="###">추천도서</a>
	        <a href="###">신간도서</a>
	        <% 
	            // 세션에서 로그인 정보 확인
	            String memberId = (String) session.getAttribute("memberId");
	            if (memberId != null && !memberId.trim().isEmpty()) {
	        %>
	            <a href="###">내 서재</a>
	        <% } else { %>
	            <a href="<%=request.getContextPath()%>/member/login">로그인</a>
	        <% } %>
	        <img src="<%=request.getContextPath()%>/resources/images/Image20250904111315.png" alt="로고">
	    	<span>책마루</span>
	    </div>
		
		<!-- 검색창 -->
	    <form class="search-form" action="<%=request.getContextPath()%>/book/searchbook" method="get">
	        <input type="text" name="bookSearchTerm" placeholder="검색어 입력">
	        <button type="submit"><i class="fa fa-search"></i></button>
	    </form>
		
		<!-- 메뉴 -->
	    <nav class="menu">
	        <a href="###">신간도서</a>
	        <a href="###">추천도서</a>
	        <a href="###">내 서재</a>
	    </nav>
	    
	</header>	
</body>
</html>