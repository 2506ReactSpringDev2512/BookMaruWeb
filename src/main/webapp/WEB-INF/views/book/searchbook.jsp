<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	// SearchServlet에서 request.setAttribute("memberName", memberName)로 전달됨
	String bookSearchTerm = (String) request.getAttribute("bookSearchTerm");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 검색</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<h1>책 검색</h1>
	
	<form action="<%=request.getContextPath()%>/book/searchbook" method="get">
	
		<select name="searchType">
			<option value="all">전체</option>
	        <option value="name">서명</option>
	        <option value="author">저자</option>
    	</select>
	
    	<input type="text" name="bookSearchTerm" value="<%= (bookSearchTerm != null ? bookSearchTerm : "") %>">
    	<input type="submit" value="검색">
    	
	</form>
	
	<c:if test="${not empty bookList}">
	    <h3>"${bookSearchTerm}" 검색 결과</h3>
	    <table border="1">
	        <tr>
	            <th>책 이름</th>
	            <th>저자</th>
	            <th>발행자</th>
	            <th>카테고리</th>
	            <th>권수</th>
	            <th>책 제목 소개</th>
	            <th>책 내용 소개</th>
	        </tr>
	        <c:forEach var="b" items="${bookList}">
	            <tr>
	                <td>
	                	${b.bookName}
	                </td>
	                <td>
						${b.author}
	                </td>
	                <td>
	                	${b.publisher}
	                </td>
	                <td>
	                	${b.category}
	                </td>
	                <td>
	                	${b.bookCount}
	                </td>
	                <td>
	                	${b.bookIntroTitle}
	                </td>
	                <td>
	                	${b.bookIntroContent}
	                </td>
	            </tr>
	        </c:forEach>
	    </table>
	</c:if>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>