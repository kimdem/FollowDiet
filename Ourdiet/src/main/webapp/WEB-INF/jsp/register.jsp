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
			<input type="number" min="0" step="1" name="Age" placeholder="나이(숫자만)" required>
			<p>성별</p>
			<label><input type="radio" name="gender" value="0" required>남성</label>
			<label><input type="radio" name="gender" value="1">여성</label>
			<p>키</p>
			<input type="number" min="0" step="0.1" name="Tall" placeholder="키(숫자만)" required>
			<p>몸 무게</p>
			<input type="number" min="0" step="0.1" name="Weight" placeholder="몸 무게(숫자만)" required>
			<p>목표 체중</p>
			<input type="number" min="0" step="0.1" name="WantedWeight" placeholder="목표(숫자만)" required>
			<p>주간 운동량</p>
			<label><input type="radio" name="ex" value="1.2" required>거의 안함</label>
			<label><input type="radio" name="ex" value="1.375" required>가벼운 운동(주 1-3회)</label>
			<label><input type="radio" name="ex" value="1.55" required>중간 운동(주 3-5회)</label>
			<label><input type="radio" name="ex" value="1.725" required>격렬한 운동(주 6-7회)</label>
			<label><input type="radio" name="ex" value="1.9" required>매우 격렬한 운동(주 7회 이상 또는 육체노동자)</label>
			<input type="submit" value="회원가입">
		</form>
	</div>
	<p>이미 계정이 있으신가요? <a href="./Login" style="color: red">로그인</a></p>
</body>
</html>