<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>BookWeb - 책 수정</title> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/adminedit.css">
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