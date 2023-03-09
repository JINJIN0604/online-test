<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<script>
		$(document).ready(function() {
			// 유효성검사
			$('#loginBtn').click(function() {
				if($('#empId').val() == '') {
					$('#msg').text('아이디를 입력해주세요');
					$('#empId').focus();
					return;
				} else {
					$('#msg').text('');
				}
				
				if($('#empPw').val() == '') {
					$('#msg').text('비밀번호를 입력해주세요');
					$('#empPw').focus();
					return;
				} else {
					$('#msg').text('');
				}
				
				$('#loginForm').submit();
			});
		});
	</script>
</head>
<body>
	<div>
  		<form id="loginForm" role="form"  method="post" action="${pageContext.request.contextPath}/loginEmp">
			<div>
 				<p id="msg" style="color: red;"></p>
			</div>
			<div>
				<input type="text" name="empId" id="empId" value="">
		    </div>
		    <div>
		      <input type="password" name="empPw" id="empPw" value="">
		    </div>
    		<div>
		      <button type="submit" id="loginBtn">로그인</button>
		    </div>
  		</form>
	</div>
</body>
</html>