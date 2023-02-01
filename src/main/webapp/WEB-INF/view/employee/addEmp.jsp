<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사원추가</h1>
	<div>${errorMsg}</div>
	<form method="post" action="${pageContext.request.contextPath}/employee/addEmp">
		<div>
			empId :
			<input type="text" name="empId"> 
		</div>
		<div>
			empPw:
			<input type="password" name="empPw"> 
		</div>
		<div>
			empName :
			<input type="text" name="empName"> 
		</div>
		<div>
			<button type="submit">추가</button>
		</div>
	</form>		
</body>
</html>