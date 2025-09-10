<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>BookWeb - 관리자 권한 관리</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/adminpermissions.css">
</head>
<body>
    <div class="page-header">
        <h1 class="page-title">관리자 권한 관리</h1>
        <p class="page-subtitle">회원 권한을 관리할 수 있습니다</p>
    </div>

    <div class="container">
        <div class="table-wrapper">
            <c:choose>
                <c:when test="${not empty mList}">
                    <table class="member-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>이름</th>
                                <th>연락처</th>
                                <th>나이</th>
                                <th>권한 상태</th>
                                <th>권한 관리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="member" items="${mList}">
                                <tr>
                                    <td>${member.memberId}</td>
                                    <td>${member.memberName}</td>
                                    <td>${member.phone}</td>
                                    <td>${member.age}세</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${member.admin == 'Y'}">
                                                <span class="status-badge status-admin">관리자</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-badge status-user">일반회원</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <form method="post" action="<c:url value='/admin/permissions'/>" style="display: inline;">
                                            <input type="hidden" name="memberId" value="${member.memberId}">
                                            <input type="hidden" name="adminYN" value="${member.admin}">
                                            <c:choose>
                                                <c:when test="${member.admin == 'Y'}">
                                                    <button type="submit" class="toggle-btn toggle-btn-admin">
                                                        권한 해제
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="submit" class="toggle-btn toggle-btn-user">
                                                        권한 부여
                                                    </button>
                                                </c:otherwise>
                                            </c:choose>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <div style="font-size: 48px; margin-bottom: 20px;">👥</div>
                        <h3>관리할 회원이 없습니다</h3>
                        <p>등록된 회원이 없거나 모든 회원이 관리자 권한을 가지고 있습니다.</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="back-link">
                <p><a href="<c:url value='/admin/main'/>">관리자 페이지로 돌아가기</a></p>
        </div>
    </div>

    <script>
        // 권한 변경 성공 메시지 (필요시)
        window.addEventListener('load', function() {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('success') === 'true') {
                alert('권한이 성공적으로 변경되었습니다.');
            }
        });
    </script>
</body>
</html>