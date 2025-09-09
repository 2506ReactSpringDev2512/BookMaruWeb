<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Inria Sans', Arial, sans-serif;
            background-color: #ffffff;
        }

        /* Footer */
        #footer {
        	max-width: 1300px;
        	margin: 0 auto;
            background: #d7d7d7;
            color: white;
            padding: 25px 0;
            margin-top: 5px;
            position: relative;
            padding-bottom: 30px;
        }

        .footer-container {
            max-width: 1280px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .footer-brand {
            flex: 1;
        }

        .footer-brand h3 {
            font-size: 24px;
            font-weight: bold;
            margin: 0 0 5px 0;
        }

        .footer-brand h3 a {
            color: #4CAF50;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-brand h3 a:hover {
            color: #45a049;
        }

        .footer-brand p {
            color: black;
            font-size: 14px;
            margin: 0;
            line-height: 1.4;
        }

        .footer-links {
            display: flex;
            gap: 30px;
            flex-wrap: wrap;
        }

        .footer-link {
            color: black;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        .footer-link:hover {
            color: #4CAF50;
        }

        .footer-copyright {
            position: absolute;
            bottom: 8px;
            left: 50%;
            transform: translateX(-50%);
            color: black;
            font-size: 12px;
            margin: 0;
        }

        #footer {
            position: relative;
            padding-bottom: 30px;
        }

</style>
</head>

<body>
    <!-- Footer -->
    <footer id="footer">
        <div class="footer-container">
            <div class="footer-brand">
                <h3><a href="/">BOOKMARU</a></h3>
                <p>지식과 상상력이 만나는 곳 · 스마트 도서관리 시스템</p>
            </div>

            <div class="footer-links">
                <a href="/book/searchbook?searchType=all&bookSearchTerm=" class="footer-link">도서 검색</a>
                <a href="/book/recentbooks" class="footer-link">신간 안내</a>
                <a href="/book/recommendedbooks" class="footer-link">추천 도서</a>
                <a href="/member/signup" class="footer-link">회원 가입</a>
            </div>
            
            <p class="footer-copyright">&copy; 2025 BOOKMARU. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
