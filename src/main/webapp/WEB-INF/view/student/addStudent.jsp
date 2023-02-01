<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>학생추가</h1>
	<div>${errorMsg}</div>
	<form method="post" action="${pageContext.request.contextPath}/student/addStudent">
		<div>
			studentId :
			<input type="text" name="studentId"> 
		</div>
		<div>
			studentPw:
			<input type="password" name="studentPw"> 
		</div>
		<div>
			studentName :
			<input type="text" name="studentName"> 
		</div>
		<div>
			<button type="submit">추가</button>
		</div>
	</form>		
</body>
</html>