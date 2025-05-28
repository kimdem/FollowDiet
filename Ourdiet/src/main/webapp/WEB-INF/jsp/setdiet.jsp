<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<script src="/js/dietvalid.js"></script>
<head><title>식단 등록</title></head>
<body>
	<%
		String A = (String)request.getAttribute("level");
		String B = "";
		String STR = (String)request.getAttribute("selectedDate");
		LocalDate selectedDate = LocalDate.parse(STR);
		int level = Integer.parseInt(A);
		switch(level) {
		case 1:
			B = "아침 식단";
			break;
		case 2:
			B = "점심 식단";
			break;
		case 3:
			B = "저녁 식단";
			break;
		default:
			B = "오류";
			break;
		}
	%>

	<h1>오늘의 식단</h1><hr>
	<form action="insertdiet" name="insertdiet" method="post">
		<h1><%=B%></h1>
		<input type="hidden" name="level" value="<%=level%>">
		<input type="hidden" name="date" value="<%=selectedDate%>">
		<p>음식 이름
		<input type="text" name="food" placeholder="음식이름" required>
		<p>칼로리
		<input type="number" name="calrory" min="0" step="0.1" value="0" placeholder="칼로리" required>
		<p>탄수화물
		<input type="number" name="tan" min="0" step="0.1" value="0" placeholder="탄수화물" required>    
		<p>단백질
		<input type="number" name="dan" min="0" step="0.1" value="0" placeholder="단백질" required>    
		<p>지방
		<input type="number" name="ji" min="0" step="0.1" value="0" placeholder="지방" required>  
		<input type="submit" value="등록">
	</form>
</body>
</html>