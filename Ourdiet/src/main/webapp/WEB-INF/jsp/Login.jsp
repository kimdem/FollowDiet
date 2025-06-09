<%@ page language="java" contentType="text/html;charset=utf-8" %>
<html>
<%if (request.getAttribute("failedLogin") != null) {%><script>alert("<%=request.getAttribute("failedLogin") %>");</script><%}%>
<head>
	<title>로그인</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/CSS/Login.css">
</head>
	<body>
		<div class="login-mainbox">
			<div class="login-title">로 그 인</div>
			<form action="mainpage" method="post" class="login-form">
				<input type="text" name="Login_ID" placeholder="ID를 입력하세요" required>
				<input type="password" name="Login_PWD" placeholder="비밀번호를 입력하세요" required>
				<input type="submit" value="로그인" class="login-btn">
			</form>
			<p>아이디가 없으신가요? <a href="./register" class="login-link_to_register">회원가입</a></p>
		</div>
	</body>
</html>