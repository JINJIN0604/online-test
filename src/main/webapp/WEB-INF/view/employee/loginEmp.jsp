<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<form method="post" action="${pageContext.request.contextPath}/employee/loginEmp">
		<div>
			empId :
			<input type="text" name="empId"> 
		</div>
		<div>
			empPw :
			<input type="password" name="empPw"> 
		</div>
		<div>
			<button type="submit">로그인</button>
		</div>
	</form>
</body>
</html>