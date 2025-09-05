<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookWeb - 회원가입</title>
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

        /* 회원가입 컨테이너는 조금 더 크게 */
        .signup-container {
            max-width: 500px;
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

        /* Radio Button Styles */
        .radio-group {
            display: flex;
            gap: 20px;
            margin-top: 5px;
        }

        .radio-label {
            display: flex;
            align-items: center;
            cursor: pointer;
            font-size: 16px;
            position: relative;
            padding-left: 30px;
        }

        .radio-label input[type="radio"] {
            position: absolute;
            opacity: 0;
            cursor: pointer;
        }

        .radio-custom {
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            height: 20px;
            width: 20px;
            background-color: #fff;
            border: 2px solid #e5e7eb;
            border-radius: 50%;
            transition: all 0.3s ease;
        }

        .radio-label input[type="radio"]:checked ~ .radio-custom {
            background-color: #4f46e5;
            border-color: #4f46e5;
        }

        .radio-label input[type="radio"]:checked ~ .radio-custom:after {
            content: "";
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: white;
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
            color: #4f46e5;
            text-decoration: none;
            font-weight: bold;
        }

        .signup-link a:hover {
            text-decoration: underline;
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
            
            .signup-container {
                max-width: 400px;
            }
            
            .radio-group {
                flex-direction: column;
                gap: 10px;
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
        <div class="login-container signup-container">
            <div class="login-header">
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