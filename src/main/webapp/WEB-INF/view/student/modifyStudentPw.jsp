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
				$('#pwBtn').click(function() {
					console.log('클릭');
					if($('#oldPw').val() == '') {
						$('#msg').text('비밀번호를 입력해주세요');
						$('#oldPw').focus();
						return;
					} else {
						$('#msg').text('');
					}
					
					if($('#newPw').val() == '') {
						$('#msg').text('비밀번호를 입력해주세요');
						$('#newPw').focus();
						return;
					} else {
						$('#msg').text('');
					}
					
					$('#pwForm').submit();
				});
			});
		</script>


</head>
<body>
	<h1>${loginStudent.studentName}님 비밀번호 수정</h1>
	<form method="post" action="${pageContext.request.contextPath}/student/modifyStudnetPw">
		<table border="1">
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="oldPw" name="oldPw"></td>
			</tr>
			<tr>
				<td>새로운 비밀번호</td>
				<td><input type="password" id="newPw" name="newPw"></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>