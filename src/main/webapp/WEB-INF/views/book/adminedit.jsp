<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BookWeb - 책 수정</title>
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

    .book-image-preview {
        text-align: center;
        margin-bottom: 30px;
    }

    .book-image-preview img {
        max-width: 150px;
        max-height: 200px;
        border: 2px solid #ddd;
        border-radius: 8px;
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
                <h2 class="form-title">${bNo} - 책 수정</h2>
            </div>

            <div class="book-image-preview">
                <img src="${pageContext.request.contextPath}/BOOK-IMG/${bNo}.jpg" 
                     alt="책 이미지"
                     onerror="this.src='${pageContext.request.contextPath}/BOOK-IMG/default.jpg'">
            </div>
            
            <form method="post" action="${pageContext.request.contextPath}/admin/edit">
                <input type="hidden" name="bNo" value="${bNo}">
                
                <div class="form-group-inline">
                    <label class="form-label-inline">제목</label>
                    <input type="text" name="bookName" class="form-input" value="${bList[0].bookName}" required>
                </div>

                <div class="form-group-inline">
                    <label class="form-label-inline">작가</label>
                    <input type="text" name="author" class="form-input" value="${bList[0].author}" required>
                </div>
                
                <div class="form-group-inline">
                    <label class="form-label-inline">출판사</label>
                    <input type="text" name="publisher" class="form-input" value="${bList[0].publisher}" required>
                </div>
                
                <div class="form-group-inline">
                    <label class="form-label-inline">카테고리</label>
                    <input type="text" name="category" class="form-input" value="${bList[0].category}" required>
                </div>
                
                <div class="form-group-inline">
                    <label class="form-label-inline">보유권수</label>
                    <input type="number" name="bookCount" class="form-input" value="${bList[0].bookCount}" min="1" required>
                </div>
                
                <div class="form-group">
                    <label class="form-label">소개 제목</label>
                    <input type="text" name="bookIntroTitle" class="form-input" value="${bList[0].bookIntroTitle}" required>
                </div>
                
                <div class="form-group">
                    <label class="form-label">소개 내용</label>
                    <textarea name="bookIntroContent" class="form-textarea" required>${bList[0].bookIntroContent}</textarea>
                </div>
                
                <button type="submit" class="submit-button">책 수정 완료</button>
            </form>
            
            <div class="back-link">
                <p><a href="${pageContext.request.contextPath}/admin/list">도서 목록으로 돌아가기</a></p>
            </div>
        </div>
    </div>
</body>
</html>