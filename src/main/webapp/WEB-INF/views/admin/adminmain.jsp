<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>BookWeb - 관리자 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/adminmain.css">
</head>
<body>
    <div class="main-content">
        <div class="admin-container">
            <div class="admin-header">
                <h2 class="admin-title">관리자 페이지</h2>
                <p class="admin-subtitle">도서 관리 시스템</p>
            </div>

            <div class="button-grid">
                <button type="button" class="admin-button" onclick="location.href='<c:url value="/admin/insert-book"/>'">
                    책 추가
                </button>
                
                <button type="button" class="admin-button" onclick="location.href='<c:url value="/admin/list"/>'">
                    책 수정
                </button>
                
                <!-- adminYN이 Y가 아닌 경우에만 권한부여 버튼 표시 -->
                <c:if test="${sessionScope.adminYN != 'Y'}">
                    <button type="button" class="admin-button" onclick="location.href='<c:url value="/admin/permissions"/>'">
                        권한 부여
                    </button>
                </c:if>
            </div>
            
            <div class="back-link">
                <a href="<c:url value='/member/logout'/>">로그아웃</a>
            </div>
        </div>
    </div>

    <script>
    </script>
</body>
</html>