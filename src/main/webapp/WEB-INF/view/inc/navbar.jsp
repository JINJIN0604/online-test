<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<c:choose>
		<c:when test="${loginEmp != null}">
			Employee
		</c:when>
		<c:when test="${loginTeacher != null}">
			Teacher
		</c:when>
		<c:when test="${loginStudent != null}">
			Student
		</c:when>
	</c:choose>
	
	<c:choose>
		<c:when test="${loginStudent != null || loginTeacher != null || loginEmp != null}">
			<c:choose>
				<c:when test="${loginEmp != null}">
					<span>${loginEmp.empName}님</span>
				</c:when>
				<c:when test="${loginTeacher != null}">
					<span>${loginTeacher.teacherName}님</span>
				</c:when>
				<c:when test="${loginStudent != null}">
					<span>${loginStudent.studentName}님</span>
				</c:when>
			</c:choose>	
			<a href="${pageContext.request.contextPath}/logout">Logout</a>
		</c:when>
		<c:when test="${loginStudent == null && loginTeacher == null && loginEmp == null}">
			<a href="${pageContext.request.contextPath}/loginEmp" >Employee</a>
			<a href="${pageContext.request.contextPath}/loginTeacher">Teacher</a>
			<a href="${pageContext.request.contextPath}/loginStudent">Student</a>
		</c:when>
	</c:choose>
</body>
</html>