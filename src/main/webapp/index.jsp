<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 프로그램</title>
</head>
<body>
	<jsp:include page="WEB-INF/views/common/header.jsp"></jsp:include>
	<c:if test="${memberId ne null}">
		<h1><c:out value="${memberName}"/>님 환영합니다</h1>
	</c:if>
	<c:if test="${memberId ne null}">
		<ul>
			<c:if test="${adminYN eq 'Y'}">
				<li>관리자</li>
			</c:if>
			<c:if test="${adminYN eq 'N'}">
				<li>일반회원</li>
			</c:if>
			
			<li><a href="/member/logout">로그아웃</a></li>
		</ul>
	</c:if>
	<c:if test="${memberId eq null}">
		<ul>
			<li><a href="<c:url value='/member/login'/>">로그인</a></li>
		</ul>
	</c:if>
	<jsp:include page="WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>