<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>BookWeb - 비밀번호 찾기</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/changepw.css">
</head>
<body>
    <div class="main-content">
        <div class="login-container">
            <div class="login-header">
                <a href="<c:url value='/'/> " class="logo-link">
                    <img src="<c:url value='/BOOK-IMG/logo2.png'/>" alt="BookWeb 로고">
                </a>
                <h2 class="login-title">비밀번호 찾기</h2>
                <p class="login-subtitle">본인 확인 후 새 비밀번호를 설정하세요</p>
            </div>

            <!-- Step Indicator -->
            <div class="step-indicator">
                <div class="step <c:choose><c:when test='${empty verified}'>active</c:when><c:otherwise>completed</c:otherwise></c:choose>">
                    <div class="step-number">1</div>
                    본인 확인
                </div>
                <div class="step-divider"></div>
                <div class="step <c:if test='${not empty verified}'>active</c:if>">
                    <div class="step-number">2</div>
                    비밀번호 설정
                </div>
            </div>

            <c:if test="${empty verified}">
                <!-- 1단계: 본인 확인 폼 -->
                <form action="<c:url value='/member/change-pw'/>" method="post">
                    <input type="hidden" name="check" value="verify">
                    
                    <div class="form-group">
                        <label class="form-label">아이디</label>
                        <input type="text" name="memberId" class="form-input" placeholder="아이디를 입력하세요" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">이름</label>
                        <input type="text" name="memberName" class="form-input" placeholder="이름을 입력하세요" required>
                    </div>
                    
                    <button type="submit" class="login-button">본인 확인</button>
                </form>
                
                <div class="link-section">
                    <p>다른 옵션을 원하시나요?</p>
                    <div class="forgot-links">
		                <a href="<c:url value='/member/login'/>">로그인</a>
		                <span class="divider-text">|</span>
		                <a href="<c:url value='/member/find-id'/>">아이디 찾기</a>
		            </div>
                    

                </div>
            </c:if>
            <c:if test="${not empty verified}">
                <!-- 2단계: 새 비밀번호 설정 폼 -->
                <div class="success-box">
                    <div class="success-title">본인 확인 완료!</div>
                    <div class="success-message">새로운 비밀번호를 설정해주세요.</div>
                </div>
                
                <form action="<c:url value='/member/change-pw'/>" method="post">
                    <input type="hidden" name="step" value="change">
                    <input type="hidden" name="memberId" value="<c:out value='${memberId}'/>">
                    
                    <div class="form-group">
                        <label class="form-label">새 비밀번호</label>
                        <input type="password" name="newPassword" class="form-input" placeholder="새 비밀번호를 입력하세요" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">새 비밀번호 확인</label>
                        <input type="password" name="confirmPassword" class="form-input" placeholder="새 비밀번호를 다시 입력하세요" required>
                    </div>
                    
                    <button type="submit" class="login-button" onclick="return validatePassword()">비밀번호 변경</button>
                </form>
                
                <div class="link-section">
                    <p>비밀번호 변경을 취소하시겠습니까?</p>
                    <div class="link-buttons">
                        <a href="<c:url value='/member/login'/>" class="link-btn">로그인으로 돌아가기</a>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
    <script>
        // 비밀번호 일치 검증
        function validatePassword() {
            const newPassword = document.querySelector('input[name="newPassword"]').value;
            const confirmPassword = document.querySelector('input[name="confirmPassword"]').value;
            
            if (newPassword !== confirmPassword) {
                alert('비밀번호가 일치하지 않습니다. 다시 확인해주세요.');
                return false;
            }
            return true;
        }
    </script>
</body>
</html>