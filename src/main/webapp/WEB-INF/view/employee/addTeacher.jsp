<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>추가</h1>
	<div>${errorMsg}</div>
	<form method="post" action="${pageContext.request.contextPath}/employee/addTeacher">
		<div>
			teacherId :
			<input type="text" name="teacherId"> 
		</div>
		<div>
			teacherPw:
			<input type="password" name="teacherPw"> 
		</div>
		<div>
			teacherName :
			<input type="text" name="teacherName"> 
		</div>
		<div>
			<button type="submit">추가</button>
		</div>
	</form>		
</body>
</html>