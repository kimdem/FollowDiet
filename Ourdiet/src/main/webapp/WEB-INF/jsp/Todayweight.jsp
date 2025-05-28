<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<%
	String STR = (String)request.getAttribute("TODAY");
	LocalDate TODAY = LocalDate.parse(STR);
%>
<head><title>오늘의 몸무게</title></head>
<body>
	<h1>몸무게 설정</h1>
	<p>날짜 : <%=TODAY%>
	<form action="insertW" method="post">
		<input type="number" name="weight" placeholder="오늘의 체중을 적어주세요!" step="0.1" min="0" value="0" required>
		<input type="hidden" name="time" value="<%=TODAY %>">
		<input type="submit" value="설정">
	</form>
</body>
</html>