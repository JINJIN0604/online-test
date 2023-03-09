<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<a href="${pageContext.request.contextPath}/main">main</a>
	        
	<!-- 학생 -->
	<c:choose>
		<c:when test="${loginStudent != null}">
			<a href="${pageContext.request.contextPath}/test/testListByStudent">testListByStudent</a>	
			<a href="${pageContext.request.contextPath}/student/modifyStudentPw">modifyStudentPw</a>
		</c:when>
		<c:when test="${loginStudent == null}">
			<a href="${pageContext.request.contextPath}/test/testListByStudent">testListByStudent</a>
		</c:when>
	</c:choose>

	<!-- 강사 -->
	<c:choose>
		<c:when test="${loginTeacher != null}">	
			<a href="${pageContext.request.contextPath}/test/testList">testList</a>
			<a href="${pageContext.request.contextPath}/teacher/modifyTeacherPw">modifyTeacherPw</a>			
		</c:when>
		<c:when test="${loginTeacher == null}">
			<a href="${pageContext.request.contextPath}/test/testList">testList</a>
		</c:when>
	</c:choose>
		
		<!-- 직원 -->
	<c:choose>
		<c:when test="${loginEmp != null}">	
			<a href="${pageContext.request.contextPath}/employee/empList">empList</a>
			<a  href="${pageContext.request.contextPath}/employee/teacherList">teacherList</a>
			<a  href="${pageContext.request.contextPath}/employee/studentList">studentList</a>
			<a  href="${pageContext.request.contextPath}/employee/modifyEmpPw">modifyEmpPw</a>
		</c:when>
		<c:when test="${loginEmp == null}">
			<a href="${pageContext.request.contextPath}/employee/empList">empList</a>
		</c:when>
	</c:choose>
</body>
</html>