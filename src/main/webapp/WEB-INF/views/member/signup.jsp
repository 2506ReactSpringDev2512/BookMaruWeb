<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>BookWeb - 회원가입</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/signup.css">
</head>
<body>
    <div class="main-content">
        <div class="login-container signup-container">
            <div class="login-header">
                <a href="<c:url value='/'/> " class="logo-link">
                    <img src="<c:url value='/BOOK-IMG/logo2.png'/>" alt="BookWeb 로고">
                </a>
                <h2 class="login-title">회원가입</h2>
                <p class="login-subtitle">새로운 독서 여정을 시작하세요</p>
            </div>

            <form action="<c:url value='/member/signup'/>" method="post">
                <div class="form-group">
                    <label class="form-label">아이디</label>
                    <input type="text" name="memberId" class="form-input" placeholder="아이디를 입력하세요" required>
                </div>
                
                <div class="form-group">
                    <label class="form-label">비밀번호</label>
                    <input type="password" name="memberPwd" class="form-input" placeholder="비밀번호를 입력하세요" required>
                </div>
                
                <div class="form-group">
                    <label class="form-label">이름</label>
                    <input type="text" name="memberName" class="form-input" placeholder="이름을 입력하세요" required>
                </div>

                <div class="form-group">
                    <label class="form-label">전화번호</label>
                    <input type="text" name="Phone" class="form-input" placeholder="010-1234-5678" required>
                </div>
                
                <div class="form-group">
                    <label class="form-label">성별</label>
                    <div class="radio-group">
                        <label class="radio-label">
                            <input type="radio" name="Gender" value="M" required>
                            <span class="radio-custom"></span>
                            남성
                        </label>
                        <label class="radio-label">
                            <input type="radio" name="Gender" value="F" required>
                            <span class="radio-custom"></span>
                            여성
                        </label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="form-label">나이</label>
                    <input type="number" name="Age" class="form-input" placeholder="나이를 입력하세요" required>
                </div>
                
                <div class="form-checkbox">
                    <input type="checkbox" id="agree" required>
                    <label for="agree">이용약관 및 개인정보처리방침에 동의합니다</label>
                </div>
                
                <button type="submit" class="login-button">회원가입</button>
            </form>
            
            <div class="signup-link">
                <p>이미 계정이 있으신가요? <a href="<c:url value='/member/login'/>">로그인</a></p>
            </div>
        </div>
    </div>

    <script>
    </script>
</body>
</html>