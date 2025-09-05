<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookWeb - 책 추가</title>
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

        .form-container {
            background: white;
            border: 3px solid #333;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 100%;
            max-width: 600px;
        }

        /* Header */
        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-title {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 8px;
            color: #333;
        }

        .form-subtitle {
            color: #666;
            font-size: 16px;
        }

        /* Form Styles */
        .form-group {
            margin-bottom: 20px;
        }

        .form-group-inline {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            font-size: 14px;
            color: #333;
        }

        .form-label-inline {
            font-weight: bold;
            font-size: 14px;
            color: #333;
            min-width: 80px;
            margin: 0;
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
            border-color: #6b7280;
            background-color: #f9fafb;
        }

        .form-input::placeholder {
            color: #9ca3af;
        }

        /* Textarea Styles */
        .form-textarea {
            width: 100%;
            min-height: 100px;
            border: 2px solid #e5e7eb;
            border-radius: 8px;
            padding: 12px 15px;
            font-size: 16px;
            transition: border-color 0.3s ease;
            resize: vertical;
            font-family: inherit;
        }

        .form-textarea:focus {
            outline: none;
            border-color: #6b7280;
            background-color: #f9fafb;
        }

        /* File Input Styles */
        .file-input {
            width: 100%;
            height: 45px;
            border: none;
            border-radius: 8px;
            padding: 10px 15px;
            font-size: 16px;
            background: transparent;
            cursor: pointer;
        }

        .file-input:focus {
            outline: none;
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
            background-color: #6b7280;
            border-color: #6b7280;
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

        /* Button Styles */
        .submit-button {
            width: 100%;
            height: 50px;
            background: #6b7280;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-bottom: 25px;
        }

        .submit-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(107, 114, 128, 0.3);
        }

        .submit-button:active {
            transform: translateY(0);
        }

        /* Link Styles */
        .back-link {
            text-align: center;
            margin-top: 15px;
        }

        .back-link p {
            color: #666;
            font-size: 14px;
        }

        .back-link a {
            color: #6b7280;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link a:hover {
            text-decoration: underline;
        }

        /* 모바일 반응형 */
        @media (max-width: 768px) {
            .main-content {
                padding: 20px;
            }
            
            .form-container {
                padding: 30px 20px;
                max-width: 450px;
            }
            
            .radio-group {
                flex-direction: column;
                gap: 10px;
            }
        }

        @media (max-width: 480px) {
            .form-container {
                padding: 25px 15px;
            }
            
            .form-title {
                font-size: 24px;
            }
            
            .form-subtitle {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="main-content">
        <div class="form-container">
            <div class="form-header">
                <h2 class="form-title">책 추가</h2>
                <p class="form-subtitle">새로운 도서를 등록하세요</p>
            </div>

            <form action="/admin/insert-book" method="post" enctype="multipart/form-data">
                <div class="form-group-inline">
                    <label class="form-label-inline">책 이미지</label>
                    <input type="file" name="bookImage" class="file-input" accept="image/*" required>
                </div>
                
                <div class="form-group-inline">
                    <label class="form-label-inline">책 번호</label>
                    <input type="text" name="BOOK_NO" class="form-input" placeholder="책 번호를 입력하세요" required>
                </div>
                
                <div class="form-group-inline">
                    <label class="form-label-inline">제목</label>
                    <input type="text" name="BOOK_NAME" class="form-input" placeholder="책 제목을 입력하세요" required>
                </div>

                <div class="form-group-inline">
                    <label class="form-label-inline">작가</label>
                    <input type="text" name="AUTHOR" class="form-input" placeholder="작가명을 입력하세요" required>
                </div>
                
                <div class="form-group-inline">
                    <label class="form-label-inline">출판사</label>
                    <input type="text" name="PUBLISHER" class="form-input" placeholder="출판사명을 입력하세요" required>
                </div>
                
                <div class="form-group-inline">
                    <label class="form-label-inline">카테고리</label>
                    <input type="text" name="CATEGORY" class="form-input" placeholder="카테고리를 입력하세요" required>
                </div>
                
                <div class="form-group-inline">
                    <label class="form-label-inline">보유권수</label>
                    <input type="number" name="BOOK_COUNT" class="form-input" placeholder="보유권수를 입력하세요" min="1" required>
                </div>
                
                <div class="form-group">
                    <label class="form-label">소개 제목</label>
                    <input type="text" name="BOOK_INTRO_TITLE" class="form-input" placeholder="소개 제목을 입력하세요" required>
                </div>
                
                <div class="form-group">
                    <label class="form-label">소개 내용</label>
                    <textarea name="BOOK_INTRO_CONTENT" class="form-textarea" placeholder="책에 대한 상세한 소개를 작성하세요" required></textarea>
                </div>
                
                <div class="form-group">
                    <label class="form-label">추천여부</label>
                    <div class="radio-group">
                        <label class="radio-label">
                            <input type="radio" name="RECOMMENDED_YN" value="Y" required>
                            <span class="radio-custom"></span>
                            추천
                        </label>
                        <label class="radio-label">
                            <input type="radio" name="RECOMMENDED_YN" value="N" required>
                            <span class="radio-custom"></span>
                            일반
                        </label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="form-label">광고여부</label>
                    <div class="radio-group">
                        <label class="radio-label">
                            <input type="radio" name="ADVERTISE_YN" value="Y" required>
                            <span class="radio-custom"></span>
                            광고
                        </label>
                        <label class="radio-label">
                            <input type="radio" name="ADVERTISE_YN" value="N" required>
                            <span class="radio-custom"></span>
                            일반
                        </label>
                    </div>
                </div>
                
                <button type="submit" class="submit-button">책 추가</button>
            </form>
            
            <div class="back-link">
                <p><a href="<c:url value='/admin/main'/>">관리자 페이지로 돌아가기</a></p>
            </div>
        </div>
    </div>

    <script>
    </script>
</body>
</html>