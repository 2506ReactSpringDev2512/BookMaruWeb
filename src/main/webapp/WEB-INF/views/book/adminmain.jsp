<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookWeb - 관리자 페이지</title>
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

        .admin-container {
            background: white;
            border: 3px solid #333;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 100%;
            max-width: 550px;
        }

        /* Header */
        .admin-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .admin-title {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 8px;
            color: #333;
        }

        .admin-subtitle {
            color: #666;
            font-size: 16px;
        }

        /* Button Grid */
        .button-grid {
            display: grid;
            gap: 20px;
            grid-template-columns: 1fr;
        }


        /* Admin Button Styles */
        .admin-button {
            width: 100%;
            height: 60px;
            background: #6b7280;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        .admin-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(107, 114, 128, 0.3);
        }

        .admin-button:active {
            transform: translateY(-1px);
        }

        /* Back Link */
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
            
            .admin-container {
                padding: 30px 20px;
                max-width: 400px;
            }
            
            .button-grid {
                gap: 15px;
            }
            
            .admin-button {
                height: 55px;
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            .admin-container {
                padding: 25px 15px;
            }
            
            .admin-title {
                font-size: 24px;
            }
            
            .admin-subtitle {
                font-size: 14px;
            }
            
            .admin-button {
                height: 50px;
            }
        }
    </style>
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