<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<script src="/js/valid.js"></script>
<% if (request.getAttribute("IDX") != null) { %><script>alert("<%= request.getAttribute("IDX") %>");</script><%}%>
<%if(request.getAttribute("id_valid") != null) {%><script>alert("<%= request.getAttribute("id_valid") %>");</script><%}%>
<%if(request.getAttribute("pwd_valid") != null) {%><script>alert("<%= request.getAttribute("pwd_valid") %>");</script><%}%>
<%if(request.getAttribute("confirmpwd") != null) {%><script>alert("<%= request.getAttribute("confirmpwd") %>");</script><%}%>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/CSS/register.css">
	<title>회원가입</title>
</head>
<body>
	<div class="register-title">회 원 가 입</div>
	<div class="register-mainbox">
		<form action="register_request" method="post" name="register" class="register-form">
			<p>ID</p>
			<input type="text" name="ID" placeholder="ID" required>
			<p>PWD</p>
			<input type="password" name="PWD" placeholder="비밀번호" required>
			<p>비밀번호 재확인</p>
			<input type="password" id="ConfirmPwd" name="ConfirmPwd" placeholder="비밀번호 재확인" required>
			<p>나이</p>
			<input type="number" min="0" step="1" name="Age" placeholder="나이(숫자만)" required>
			<p>성별</p>
			<div class="gender-box">
				<label><input type="radio" name="gender" value="0" required>남성</label>
				<label><input type="radio" name="gender" value="1">여성</label>
			</div>
			<p>키</p>
			<input type="number" min="0" step="0.1" name="Tall" placeholder="키(숫자만)" required>
			<p>현재 체중</p>
			<input type="number" min="0" step="0.1" name="Weight" placeholder="몸 무게(숫자만)" required>
			<p>목표 체중</p>
			<input type="number" min="0" step="0.1" name="WantedWeight" placeholder="목표(숫자만)" required>
			<p>주간 운동량</p>
			<label><input type="radio" name="ex" value="1.2" required>거의 안함</label>
			<label><input type="radio" name="ex" value="1.375" required>가벼운 운동(주 1-3회)</label>
			<label><input type="radio" name="ex" value="1.55" required>중간 운동(주 3-5회)</label>
			<label><input type="radio" name="ex" value="1.725" required>격렬한 운동(주 6-7회)</label>
			<label><input type="radio" name="ex" value="1.9" required>매우 격렬한 운동(주 7회 이상 또는 육체노동자)</label>
			<input type="submit" value="회원가입" class="register-btn">
		</form>
	</div>
	<p>이미 계정이 있으신가요? <a href="./Login" class="register-link_to_login">로그인</a></p>
</body>
</html>