<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>BookWeb - 로그인</title>
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
            min-width: 500px;
            overflow-x: auto;
        }

        /* Main Content */
        .main-content {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
            min-width: 500px;
        }

        .login-container {
            background: white;
            border: 3px solid #333;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 450px;
            min-width: 450px;
        }

        /* Header */
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo-link {
            display: inline-block;
            margin-bottom: 0px;
            margin-left: 50px;
        }

        .logo-link img {
            height: 80px;
            width: auto;
            object-fit: contain;
            transition: opacity 0.3s ease;
        }

        .logo-link:hover img {
            opacity: 0.8;
        }

        .login-title {
            font-size: 28px;
            font-weight: bold;
            margin-top: -25px;
            margin-bottom: 8px;
            color: #333;
        }

        .login-subtitle {
            color: #666;
            font-size: 16px;
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

        /* Checkbox Styles */
        .form-checkbox {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 25px;
        }

        .form-checkbox input[type="checkbox"] {
            width: 16px;
            height: 16px;
            cursor: pointer;
        }

        .form-checkbox label {
            font-size: 14px;
            color: #666;
            cursor: pointer;
        }

        /* Button Styles */
		.login-button {
		width: 100%;
		height: 50px;
		background: linear-gradient(135deg, #4caf50, #66bb6a);
		color: #2c3e50;
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
		box-shadow: 0 5px 15px rgba(44, 62, 80, 0.3);
		}
		
		.login-button:active {
		transform: translateY(0);
		}
        /* Link Styles */
        .signup-link {
            text-align: center;
            margin-top: 15px;
        }

        .signup-link p {
            color: #666;
            font-size: 14px;
        }

        .signup-link a {
            color: #4caf50;
            text-decoration: none;
            font-weight: bold;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }

        .forgot-links {
            text-align: center;
            margin-top: 15px;
            display: flex;
            justify-content: center;
            gap: 10px;
            align-items: center;
        }

        .forgot-links a {
            color: #666;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        .forgot-links a:hover {
            color: #4caf50;
        }

        .divider-text {
            color: #ccc;
            font-size: 12px;
        }
    </style>
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