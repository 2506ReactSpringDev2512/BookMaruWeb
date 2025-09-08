<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>책 상세보기 - 북마루 도서관리 시스템</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Inria Sans', Arial, sans-serif;
            background-color: #ffffff;
        }
        
        .main-container {
            width: 100%;
            max-width: 1280px;
            margin: 0 auto;
            background-color: #ffffff;
            min-height: 100vh;
            position: relative;
        }
        
        .content-wrapper {
            padding: 90px 20px 40px;
        }
        
        .book-detail-container {
            background-color: #ffffff;
            border: 2px solid #ddd;
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            max-width: 800px;
            margin: 0 auto;
        }
        
        .book-detail-content {
            display: flex;
            gap: 40px;
            margin-bottom: 30px;
        }
        
        .book-image-section {
            flex-shrink: 0;
        }
        
        .book-detail-image {
            width: 250px;
            height: 350px;
            object-fit: contain;
            background-color: #f9f9f9;
            border: 2px solid #ddd;
            border-radius: 8px;
        }
        
        .book-info-section {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        
        .book-detail-title {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            margin: 0;
            line-height: 1.3;
        }
        
        .book-detail-info {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }
        
        .info-row {
            display: flex;
            align-items: center;
        }
        
        .info-label {
            font-weight: bold;
            color: #555;
            width: 100px;
            flex-shrink: 0;
        }
        
        .info-value {
            color: #333;
            flex: 1;
        }
        
        .book-intro-section {
            border-top: 2px solid #eee;
            padding-top: 30px;
        }
        
        .intro-title {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-bottom: 15px;
        }
        
        .intro-content {
            color: #666;
            line-height: 1.6;
            font-size: 16px;
        }
        
        .back-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 30px;
        }
        
        .back-button:hover {
            background-color: #45a049;
        }
        
        .no-book-message {
            text-align: center;
            color: #666;
            font-size: 18px;
            padding: 60px 20px;
        }
        
        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .book-detail-container {
                padding: 20px;
                margin: 0 10px;
            }
            
            .book-detail-content {
                flex-direction: column;
                align-items: center;
                gap: 20px;
            }
            
            .book-detail-image {
                width: 200px;
                height: 280px;
            }
            
            .book-detail-title {
                font-size: 22px;
                text-align: center;
            }
            
            .info-row {
                flex-direction: column;
                align-items: flex-start;
                gap: 5px;
            }
            
            .info-label {
                width: auto;
            }
        }
        
        @media (max-width: 480px) {
            .content-wrapper {
                padding: 90px 10px 20px;
            }
            
            .book-detail-container {
                padding: 15px;
                margin: 0 5px;
            }
            
            .book-detail-image {
                width: 180px;
                height: 250px;
            }
            
            .book-detail-title {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    
    <div class="main-container">
        <div class="content-wrapper">
            <c:choose>
                <c:when test="${not empty bList && bList.size() > 0}">
                    <c:set var="book" value="${bList[0]}" />
                    <div class="book-detail-container">
                        <div class="book-detail-content">
                            <div class="book-image-section">
                                <img src="${pageContext.request.contextPath}/BOOK-IMG/${bNo}.jpg" 
                                     alt="책 이미지" 
                                     class="book-detail-image"
                                     onerror="this.src='${pageContext.request.contextPath}/BOOK-IMG/default.jpg'">
                            </div>
                            
                            <div class="book-info-section">
                                <h1 class="book-detail-title">${book.bookName}</h1>
                                
                                <div class="book-detail-info">
                                    <div class="info-row">
                                        <span class="info-label">저자:</span>
                                        <span class="info-value">${book.author}</span>
                                    </div>
                                    <div class="info-row">
                                        <span class="info-label">출판사:</span>
                                        <span class="info-value">${book.publisher}</span>
                                    </div>
                                    <div class="info-row">
                                        <span class="info-label">카테고리:</span>
                                        <span class="info-value">${book.category}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <c:if test="${not empty book.bookIntroTitle || not empty book.bookIntroContent}">
                            <div class="book-intro-section">
                                <c:if test="${not empty book.bookIntroTitle}">
                                    <h2 class="intro-title">${book.bookIntroTitle}</h2>
                                </c:if>
                                <c:if test="${not empty book.bookIntroContent}">
                                    <div class="intro-content">${book.bookIntroContent}</div>
                                </c:if>
                            </div>
                        </c:if>
                        
                        <button class="back-button" onclick="history.back()">이전 페이지로</button>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="book-detail-container">
                        <div class="no-book-message">
                            <p>책 정보를 찾을 수 없습니다.</p>
                            <button class="back-button" onclick="history.back()">이전 페이지로</button>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>