<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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

    /* Button Styles */
    .button-group {
        display: flex;
        gap: 15px;
        margin-bottom: 25px;
    }

    .submit-button {
        flex: 1;
        height: 50px;
        background: #6b7280;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .submit-button:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(107, 114, 128, 0.3);
    }

    .submit-button:active {
        transform: translateY(0);
    }

    .delete-button {
        flex: 1;
        height: 50px;
        background: #dc2626;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .delete-button:hover {
        background: #b91c1c;
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(220, 38, 38, 0.3);
    }

    .delete-button:active {
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
            
            <form method="post" action="${pageContext.request.contextPath}/admin/edit" enctype="multipart/form-data">
                <input type="hidden" name="bNo" value="${bNo}">
                
                <div class="form-group-inline">
                    <label class="form-label-inline">이미지 변경</label>
                    <input type="file" name="bookImage" class="file-input" accept="image/*">
                </div>
                
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
                
                <div class="button-group">
                    <button type="submit" class="submit-button">책 수정 완료</button>
                    <button type="button" class="delete-button" onclick="deleteBook('${bNo}')">책 삭제</button>
                </div>
            </form>
            
            <div class="back-link">
                <p><a href="${pageContext.request.contextPath}/admin/list">도서 목록으로 돌아가기</a></p>
            </div>
        </div>
    </div>

    <script>
        function deleteBook(bNo) {
            if (confirm('정말로 "' + bNo + '" 도서를 삭제하시겠습니까?\n\n이 작업은 되돌릴 수 없습니다.')) {
                // 삭제 요청을 위한 form 동적 생성
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = '${pageContext.request.contextPath}/admin/delete';
                
                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'bNo';
                input.value = bNo;
                
                form.appendChild(input);
                document.body.appendChild(form);
                form.submit();
            }
        }
    </script>
</body>
</html>