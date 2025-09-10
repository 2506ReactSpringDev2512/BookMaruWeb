<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>BookWeb - 아이디 찾기</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/findid.css">
</head>
<body>
    <div class="main-content">
        <div class="login-container">
            <div class="login-header">
                <a href="<c:url value='/'/> " class="logo-link">
                    <img src="<c:url value='/BOOK-IMG/logo2.png'/>" alt="BookWeb 로고">
                </a>
                <h2 class="login-title">아이디 찾기</h2>
                <p class="login-subtitle">이름과 전화번호로 아이디를 찾을 수 있습니다</p>
            </div>

            <!-- 결과 표시 영역 -->
            <c:if test="${not empty foundId}">
                <div class="result-box">
                    <div class="result-title">아이디 찾기 성공!</div>
                    <div class="found-id"><c:out value="${foundId}"/></div>
                </div>
                
                <div class="link-section">
                    <p>아이디를 찾았습니다.</p>
                    <div class="link-buttons">
                        <a href="<c:url value='/member/login'/>" class="link-btn">로그인하기</a>
                        <a href="<c:url value='/member/find-id'/>" class="link-btn">다시 찾기</a>
                    </div>
                </div>
            </c:if>
            <c:if test="${empty foundId}">
                <!-- 입력 폼 -->
                <form action="<c:url value='/member/find-id'/>" method="post">
                    <div class="form-group">
                        <label class="form-label">이름</label>
                        <input type="text" name="memberName" class="form-input" placeholder="이름을 입력하세요" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">전화번호</label>
                        <input type="text" name="Phone" class="form-input" placeholder="010-1234-5678" required>
                    </div>
                    
                    <button type="submit" class="login-button">아이디 찾기</button>
                </form>
                
                <div class="link-section">
                    <p>다른 옵션을 원하시나요?</p>
                    <div class="forgot-links">
		                <a href="<c:url value='/member/login'/>">로그인</a>
		                <span class="divider-text">|</span>
		                <a href="<c:url value='/member/signup'/>">회원가입</a>
		            </div>
                </div>
            </c:if>
        </div>
    </div>

    <script>
    </script>
</body>
</html>