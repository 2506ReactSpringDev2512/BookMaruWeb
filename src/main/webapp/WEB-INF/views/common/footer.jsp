<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

</head>

<style>
    /* 푸터 전체 */
    .footer {
        background-color: #e1e1e1;
        padding: 15px 30px;
    }

    footer {
        max-width: 1200px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
    }

    /* 연락처 & 주소 */
    .numberaddress ul {
        display: flex;
        list-style-type: none;
        padding: 0;
        margin: 0;
        gap: 20px;
        font-size: 14px;
        color: #333;
    }

    /* 로고 영역 */
    .logo {
        display: flex;
        align-items: center;
        gap: 10px;
        font-weight: bold;
        font-size: 18px;
        color: #222;
    }

    .logo img {
        width: 45px;
        height: 45px;
        border-radius: 50%;
        object-fit: cover;
    }
</style>

<body>

	<div class="footer">
	
	    <footer>
	    
	        <nav class="numberaddress">
	            <ul>
	                <li><i class="fas fa"></i> 010-1234-5678</li>
	                <li><i class="fas f"></i> 서울특별시 어딘가</li>
	            </ul>
	        </nav>
	
	        <div class="logo">
	            <img src="<%=request.getContextPath()%>./Image20250904111315.png" alt="로고">
	            <span>책마루</span>
	        </div>
	        
	    </footer>
    
	</div>
	
</body>
</html>