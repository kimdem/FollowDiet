<%@ page language="java" contentType="text/html;charset=utf-8" %>
<html>
<%
	if (request.getAttribute("failedLogin") != null) {
%>
<script>
	alert("<%=request.getAttribute("failedLogin") %>");
</script><%} %>
	<head><title>로그인</title></head>
	<body>
		<div class="">
			<form action="mainpage" method="post">
				<p>ID</p>
				<input type="text" name="Login_ID" placeholder="ID를 입력하세요" required>
				<p>PWD</p>
				<input type="password" name="Login_PWD" placeholder="비밀번호를 입력하세요" required>
				<input type="submit" value="로그인">
			</form>
		</div>
		<p>아이디가 없으신가요? <a href="./register" style="color: red">회원가입</a></p>
	</body>
</html>