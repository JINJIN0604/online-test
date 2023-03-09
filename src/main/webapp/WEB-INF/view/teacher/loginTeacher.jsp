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
				if($('#teacherId').val() == '') {
					$('#msg').text('아이디를 입력해주세요');
					$('#teacherId').focus();
					return;
				} else {
					$('#msg').text('');
				}
				
				if($('#teacherPw').val() == '') {
					$('#msg').text('비밀번호를 입력해주세요');
					$('#teacherPw').focus();
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




	<!-- 로그인 전 -->
	<c:if test="${loginTeacher == null}">
		<h5>강사로그인</h5>
		<form id="loginForm" method="post" action="${pageContext.request.contextPath}/loginTeacher">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="teacherId"> 
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="teacherPw">
					</td>
				</tr>
			</table>			
			<div>
				<button type="submit">로그인</button>
			</div>
		</form>
	</c:if>
	

</body>
</html>