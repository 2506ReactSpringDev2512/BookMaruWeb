<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>BookWeb - 관리자 권한 관리</title>
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
            padding: 20px;
            min-width: 1240px;
            overflow-x: auto;
        }

        /* Header */
        .page-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .page-title {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 8px;
            color: #333;
        }

        .page-subtitle {
            color: #666;
            font-size: 16px;
        }

        /* Container */
        .container {
            width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        /* Table Styles */
        .table-wrapper {
            overflow-x: auto;
        }

        .member-table {
            width: 100%;
            border-collapse: collapse;
        }

        .member-table th,
        .member-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e5e5e5;
        }

        .member-table th {
            background-color: #f8f9fa;
            font-weight: bold;
            color: #333;
        }

        .member-table tbody tr:hover {
            background-color: #f8f9fa;
        }

        /* Status Badge */
        .status-badge {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .status-admin {
            background-color: #e3f2fd;
            color: #1976d2;
        }

        .status-user {
            background-color: #f3e5f5;
            color: #7b1fa2;
        }
        /* Back Link */
	    .back-link {
	        text-align: center;
	        margin-top: 15px;
	        margin-bottom: 15px;
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

        /* Action Button */
        .toggle-btn {
            padding: 8px 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .toggle-btn-admin {
            background-color: #ff5722;
            color: white;
        }

        .toggle-btn-admin:hover {
            background-color: #e64a19;
            transform: translateY(-2px);
        }

        .toggle-btn-user {
            background-color: #4caf50;
            color: white;
        }

        .toggle-btn-user:hover {
            background-color: #45a049;
            transform: translateY(-2px);
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #666;
        }

        .empty-state i {
            font-size: 48px;
            margin-bottom: 20px;
            color: #ccc;
        }

    </style>
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