<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	   <!-- SideNav -->
	   <h4>sidenav</h4>
		<c:import url="/WEB-INF/view/inc/sidenav.jsp"></c:import>
		<h4>navbar</h4>
		<!-- Navbar -->
		<c:import url="/WEB-INF/view/inc/navbar.jsp"></c:import>
	<div>
		<h5>Employee List</h5>
		<a href="${pageContext.request.contextPath}/employee/addEmp">사원등록</a>	
		<br><br>
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>이름</td>
					<td>삭제</td>		
				</tr>
				<c:forEach var="e" items="${list}">
					<tr>
						<td>${e.empId}</td>
						<td>${e.empName}</td>
						<td><a href="${pageContext.request.contextPath}/employee/removeEmp?empNo=${e.empNo}">삭제</a></td>
					</tr>
				</c:forEach>		
			</table>
			<form method="get" action="${pageContext.request.contextPath}/employee/empList">
				<input type="text" name="searchWord" placeholder="사원 이름 검색">
				<button type="submit">검색</button>
			</form> 	
			<div>
				<a href="${pageContext.request.contextPath}/employee/empList?currentPage=1&searchWord=${searchWord}">처음</a>
					<c:if test="${currentPage > 1}">		
						<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
					</c:if>			
					<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
						<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${i}&searchWord=${searchWord}">${i}</a>									
					</c:forEach>
					<c:if test="${currentPage < lastPage}">		
						<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>	
					</c:if>	
				<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a>
			</div>	
	</div>
</body>
</html>