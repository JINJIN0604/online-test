<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h5>Student List</h5>
	<a href="${pageContext.request.contextPath}/employee/addStudent">학생등록</a>	
	<br><br>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>삭제</td>		
			</tr>
			<c:forEach var="s" items="${list}">
				<tr>
					<td>${s.studentId}</td>
					<td>${s.studentName}</td>
					<td><a href="${pageContext.request.contextPath}/employee/removeStudent?studentNo=${s.studentNo}">삭제</a></td>
				</tr>
			</c:forEach>
		
		</table>
		<form method="get" action="${pageContext.request.contextPath}/employee/studentList">
			<input type="text" name="searchWord">
			<button type="submit">이름검색</button>
		</form> 	
		<div>
			<a href="${pageContext.request.contextPath}/employee/studentList?currentPage=1&searchWord=${searchWord}">처음</a>
				<c:if test="${currentPage > 1}">		
					<a href="${pageContext.request.contextPath}/employee/studentList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
				</c:if>			
				<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
					<a href="${pageContext.request.contextPath}/employee/studentList?currentPage=${i}&searchWord=${searchWord}">${i}</a>									
				</c:forEach>
				<c:if test="${currentPage < lastPage}">		
					<a href="${pageContext.request.contextPath}/employee/studentList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>	
				</c:if>	
			<a href="${pageContext.request.contextPath}/employee/studentList?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a>
		</div>
</body>
</html>