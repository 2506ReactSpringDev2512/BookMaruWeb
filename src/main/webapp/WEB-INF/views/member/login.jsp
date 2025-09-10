<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>BookWeb - 로그인</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/login.css">
</head>
<body>
    <div class="main-content">
        <div class="login-container">
            <div class="login-header">
                <a href="<c:url value='/'/>" class="logo-link">
                    <img src="<c:url value='/BOOK-IMG/logo2.png'/>" alt="BookWeb 로고">
                </a>
                <h2 class="login-title">로그인</h2>
                <p class="login-subtitle">BookWeb에 오신 것을 환영합니다</p>
            </div>

            <form action="<c:url value='/member/login'/>" method="post">
                <div class="form-group">
                    <label class="form-label">아이디</label>
                    <input type="text" name="memberId" class="form-input" placeholder="아이디를 입력하세요" required>
                </div>
                
                <div class="form-group">
                    <label class="form-label">비밀번호</label>
                    <input type="password" name="memberPwd" class="form-input" placeholder="비밀번호를 입력하세요" required>
                </div>
                
                <div class="form-checkbox">
                    <input type="checkbox" id="remember">
                    <label for="remember">로그인 상태 유지</label>
                </div>
                
                <button type="submit" class="login-button">로그인</button>
            </form>
            
            <div class="signup-link">
                <p>계정이 없으신가요? <a href="<c:url value='/member/signup'/>">회원가입</a></p>
            </div>
            
            <div class="forgot-links">
                <a href="<c:url value='/member/find-id'/>">아이디 찾기</a>
                <span class="divider-text">|</span>
                <a href="<c:url value='/member/change-pw'/>">비밀번호 찾기</a>
            </div>
        </div>
    </div>

    <script>
    </script>
</body>
</html>