<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookWeb - 비밀번호 찾기</title>
    <style>
        /* BookWeb - 공통 스타일 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', 'Noto Sans KR', sans-serif;
            background: #f5f5f5;
            color: #333;
            min-height: 100vh;
        }

        /* Main Content */
        .main-content {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
        }

        .login-container {
            background: white;
            border: 3px solid #333;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 100%;
            max-width: 450px;
        }

        /* Header */
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-title {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 8px;
            color: #333;
        }

        .login-subtitle {
            color: #666;
            font-size: 16px;
        }

        /* Step Indicator */
        .step-indicator {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }

        .step {
            display: flex;
            align-items: center;
            font-size: 14px;
            color: #666;
        }

        .step-number {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            font-weight: bold;
            border: 2px solid #e5e7eb;
            background: white;
        }

        .step.active .step-number {
            background: #4f46e5;
            color: white;
            border-color: #4f46e5;
        }

        .step.completed .step-number {
            background: #10b981;
            color: white;
            border-color: #10b981;
        }

        .step-divider {
            width: 50px;
            height: 2px;
            background: #e5e7eb;
            margin: 0 15px;
            margin-top: -20px;
        }

        /* Form Styles */
        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            font-size: 14px;
            color: #333;
        }

        .form-input {
            width: 100%;
            height: 45px;
            border: 2px solid #e5e7eb;
            border-radius: 8px;
            padding: 12px 15px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        .form-input:focus {
            outline: none;
            border-color: #4f46e5;
            background-color: #f9fafb;
        }

        .form-input::placeholder {
            color: #9ca3af;
        }

        /* Button Styles */
        .login-button {
            width: 100%;
            height: 50px;
            background: linear-gradient(135deg, #4f46e5, #6366f1);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-bottom: 25px;
        }

        .login-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(79, 70, 229, 0.3);
        }

        .login-button:active {
            transform: translateY(0);
        }

        /* Success Box Styles */
        .success-box {
            background: #dcfce7;
            border: 2px solid #16a34a;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            margin-bottom: 25px;
            color: #16a34a;
        }

        .success-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .success-message {
            font-size: 14px;
            margin-bottom: 15px;
        }

        /* Link Styles */
        .link-section {
            text-align: center;
            margin-top: 15px;
        }

        .link-section p {
            color: #666;
            font-size: 14px;
            margin-bottom: 15px;
        }

        .link-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        .link-btn {
            padding: 8px 16px;
            color: #4f46e5;
            text-decoration: none;
            font-size: 14px;
            border: 1px solid #4f46e5;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        .link-btn:hover {
            background-color: #4f46e5;
            color: white;
            text-decoration: none;
        }

        .divider-text {
            color: #ccc;
            margin: 0 10px;
            font-size: 12px;
        }


        /* 모바일 반응형 */
        @media (max-width: 768px) {
            .main-content {
                padding: 20px;
            }
            
            .login-container {
                padding: 30px 20px;
                max-width: 350px;
            }
            
            .link-buttons {
                flex-direction: column;
                gap: 8px;
            }

            .step {
                font-size: 12px;
            }

            .step-divider {
                width: 30px;
            }
        }

        @media (max-width: 480px) {
            .login-container {
                padding: 25px 15px;
            }
            
            .login-title {
                font-size: 24px;
            }
            
            .login-subtitle {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="main-content">
        <div class="login-container">
            <div class="login-header">
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
                    <div class="link-buttons">
                        <a href="<c:url value='/member/login'/>" class="link-btn">로그인</a>
                        <span class="divider-text">|</span>
                        <a href="<c:url value='/member/find-id'/>" class="link-btn">아이디 찾기</a>
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