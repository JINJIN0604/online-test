<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	
	<h1>Teacher List</h1>
	<a href="${pageContext.request.contextPath}/employee/addTeacher">강사등록</a>	
	<br><br>
		<table border="1">
			<tr>
				<th>teacherId</th>
				<th>teacherName</th>
				<th>삭제</th>
				
			</tr>
			<c:forEach var="t" items="${list}">
				<tr>
					<td>${t.teacherId}</td>
					<td>${t.teacherName}</td>
					<td><a href="${pageContext.request.contextPath}/employee/removeTeacher?teacherNo=${t.teacherNo}">삭제</a></td>
				</tr>
			</c:forEach>	
		</table>
		<form method="get" action="${pageContext.request.contextPath}/employee/teacherList">
			<input type="text" name="searchWord">
			<button type="submit">이름검색</button>
		</form> 	
		<div>
			<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=1&searchWord=${searchWord}">처음</a>
				<c:if test="${currentPage > 1}">		
					<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
				</c:if>			
				<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
					<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${i}&searchWord=${searchWord}">${i}</a>									
				</c:forEach>
				<c:if test="${currentPage < lastPage}">		
					<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>	
				</c:if>	
			<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a>
		</div>
</body>
</html>