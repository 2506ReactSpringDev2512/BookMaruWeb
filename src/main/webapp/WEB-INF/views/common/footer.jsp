<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            background: #2c3e50;
            color: white;
            padding: 60px 0 20px;
            margin-top: auto;
        }

        .footer-content {
            max-width: 1280px;
            margin: 0 auto;
            padding: 0 20px;
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 40px;
            margin-bottom: 40px;
        }

        .footer-brand h3 {
            font-size: 1.8em;
            font-weight: bold;
            margin-bottom: 15px;
            color: #4CAF50;
        }

        .footer-brand p {
            color: #bdc3c7;
            line-height: 1.6;
            margin-bottom: 25px;
            font-size: 14px;
        }

        .social-links {
            display: flex;
            gap: 12px;
        }

        .social-link {
            display: inline-block;
            width: 36px;
            height: 36px;
            background: rgba(76, 175, 80, 0.2);
            color: #4CAF50;
            text-align: center;
            line-height: 36px;
            border-radius: 6px;
            transition: all 0.3s ease;
            text-decoration: none;
            font-size: 14px;
            border: 1px solid rgba(76, 175, 80, 0.3);
        }

        .social-link:hover {
            background: #4CAF50;
            color: white;
            transform: translateY(-2px);
            border-color: #4CAF50;
        }

        .footer-column h4 {
            font-size: 1.1em;
            font-weight: bold;
            margin-bottom: 20px;
            color: white;
        }

        .footer-column ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .footer-column ul li {
            margin-bottom: 12px;
        }

        .footer-column ul li a {
            color: #bdc3c7;
            transition: color 0.3s ease;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
        }

        .footer-column ul li a:hover {
            color: #4CAF50;
        }

        .footer-bottom {
            padding: 20px 0;
            border-top: 1px solid #34495e;
            text-align: center;
            color: #95a5a6;
            font-size: 13px;
        }

        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .footer-content {
                grid-template-columns: 1fr 1fr;
                gap: 30px;
                padding: 0 15px;
            }
            
            #footer {
                padding: 40px 0 15px;
            }
        }

        @media (max-width: 480px) {
            .footer-content {
                grid-template-columns: 1fr;
                text-align: center;
                gap: 25px;
            }

            .social-links {
                justify-content: center;
            }
            
            .footer-brand h3 {
                font-size: 1.5em;
            }
            
            #footer {
                padding: 30px 0 15px;
            }
        }
</style>
</head>

<body>
    <!-- Footer -->
    <footer id="footer">
        <div class="footer-content">
            <div class="footer-brand">
                <h3>BOOKMARU</h3>
                <p>
                    지식과 상상력이 만나는 곳<br>
                    모든 사람이 쉽게 책을 찾고<br>
                    읽을 수 있는 스마트 도서관리 시스템
                </p>
                <div class="social-links">
                    <a href="#" class="social-link">✉</a>
                    <a href="#" class="social-link">☎</a>
                    <a href="#" class="social-link">📚</a>
                    <a href="#" class="social-link">🏢</a>
                </div>
            </div>

            <div class="footer-column">
                <h4>도서 서비스</h4>
                <ul>
                    <li><a href="#">도서 검색</a></li>
                    <li><a href="#">신간 안내</a></li>
                    <li><a href="#">추천 도서</a></li>
                    <li><a href="#">베스트셀러</a></li>
                    <li><a href="#">카테고리별 도서</a></li>
                </ul>
            </div>

            <div class="footer-column">
                <h4>이용 안내</h4>
                <ul>
                    <li><a href="#">대출/반납 안내</a></li>
                    <li><a href="#">회원 가입</a></li>
                    <li><a href="#">이용 규정</a></li>
                    <li><a href="#">자주 묻는 질문</a></li>
                    <li><a href="#">개인정보처리방침</a></li>
                </ul>
            </div>

            <div class="footer-column">
                <h4>고객 지원</h4>
                <ul>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">문의하기</a></li>
                    <li><a href="#">시스템 점검</a></li>
                    <li><a href="#">도움말</a></li>
                    <li><a href="#">서비스 개선</a></li>
                </ul>
            </div>
        </div>

        <div class="footer-bottom">
            <p>&copy; 2024 BOOKMARU. All rights reserved. | 사업자등록번호: 123-45-67890 | 운영: 책마루 운영팀</p>
        </div>
    </footer>
</body>
</html>