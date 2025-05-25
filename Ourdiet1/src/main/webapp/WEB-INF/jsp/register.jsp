<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<script src="/js/valid.js"></script>
<% if (request.getAttribute("IDX") != null) { %>
<script>
    alert("<%= request.getAttribute("IDX") %>");
</script>
<% } %>

<script>
	function Valid_data() {
		var validok = Checking();
		if(validok == true) {
			return true;
		} else {
			return false;
		}
	}
</script>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
</head>
<body>
	<div>
		<form action="registercomplete" method="post" name="register" onsubmit="return Valid_data()">
			<p>ID</p>
			<input type="text" name="ID" placeholder="ID" required>
			<p>PWD</p>
			<input type="password" name="PWD" placeholder="비밀번호" required>
			<p>비밀번호 재확인</p>
			<input type="password" name="ConfirmPwd" placeholder="비밀번호 재확인" required>
			<p>나이</p>
			<input type="number" step="1" name="Age" placeholder="나이(숫자만)" required>
			<p>키</p>
			<input type="number" step="0.1" name="Tall" placeholder="키(숫자만)" required>
			<p>몸 무게</p>
			<input type="number" step="0.1" name="Weight" placeholder="몸 무게(숫자만)" required>
			<p>목표 체중</p>
			<input type="number" step="0.1" name="WantedWeight" placeholder="목표(숫자만)" required>
			<input type="submit" value="회원가입">
		</form>
	</div>
	<p>이미 계정이 있으신가요? <a href="./Login" style="color: red">로그인</a></p>
</body>
</html>