<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>BookWeb - 책 추가</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/admininsertbook.css">
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