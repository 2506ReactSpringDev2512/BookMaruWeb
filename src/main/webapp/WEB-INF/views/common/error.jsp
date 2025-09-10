<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
<style>
body {
    min-width: 500px;
    overflow-x: auto;
    font-family: Arial, sans-serif;
    padding: 40px;
    text-align: center;
    background-color: #f5f5f5;
}
.error-container {
    width: 600px;
    margin: 0 auto;
    background: white;
    padding: 40px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}
h1, h2, h3 {
    color: #333;
    margin-bottom: 20px;
}
a {
    color: #4CAF50;
    text-decoration: none;
    font-weight: bold;
    padding: 10px 20px;
    border: 2px solid #4CAF50;
    border-radius: 5px;
    display: inline-block;
    margin-top: 20px;
    transition: all 0.3s ease;
}
a:hover {
    background-color: #4CAF50;
    color: white;
}
</style>
</head>
<body>
	<div class="error-container">
		<h1>에러 페이지</h1>
		<h2>에러가 발생하였습니다! 확인해주시기 바랍니다.</h2>
		<h3>${errorMsg}</h3>
		<a href="/">메인페이지로 이동</a>
	</div>
</body>
</html>