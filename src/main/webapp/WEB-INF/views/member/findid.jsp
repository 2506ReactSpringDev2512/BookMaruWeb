<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookWeb - 아이디 찾기</title>
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

        /* Result Box Styles */
        .result-box {
            background: #dcfce7;
            border: 2px solid #16a34a;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            margin-bottom: 25px;
            color: #16a34a;
        }

        .result-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .found-id {
            font-size: 24px;
            font-weight: bold;
            background: white;
            padding: 15px;
            border-radius: 6px;
            border: 1px solid #16a34a;
            color: #333;
            letter-spacing: 2px;
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
                    <div class="link-buttons">
                        <a href="<c:url value='/member/login'/>" class="link-btn">로그인</a>
                        <span class="divider-text">|</span>
                        <a href="<c:url value='/member/signup'/>" class="link-btn">회원가입</a>
                    </div>
                </div>
            </c:if>
        </div>
    </div>

    <script>
    </script>
</body>
</html>