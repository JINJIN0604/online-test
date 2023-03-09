<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>선생님추가</h1>
	<div>
		<input type="text" id="id">
		<button type="button" id="idck">중복검사</button>
	</div>
	<form method="post" action="${pageContext.request.contextPath}/employee/addTeacher">
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
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="teacherName"> 
				</td>
			</tr>
		</table>
	</form>	
</body>
<script>
	$('#idck').click(function() {
		console.log($('#id').val());
		
		$.ajax({
			url:'http://localhost/online-test/employee/idCheck'
			, type:'get'
			, data:{id:$('#id').val()}
			, success:function(model) { //model -> yes/no
				console.log(model)
				if(model =='YES') {
					// 사용가능
					  $('#teacherId').val($('#id').val());
				} else {
					// 사용불가능
					alert($('#id').val()+'는 사용중인 아이디입니다.');
				}
			}
		})
	});
</script>
</html>