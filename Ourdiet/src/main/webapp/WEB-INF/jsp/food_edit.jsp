<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="OurDiet.dto.food_fix" %>
<!DOCTYPE html>
<html>
<head>
	<title>식단 정보 수정</title>
	<link rel="stylesheet" href="/CSS/food_edit.css">
	<link rel="stylesheet" href="/CSS/sidebar.css">
</head>
<body>
<%
	food_fix dt = (food_fix)request.getAttribute("diet");
	String meal = "";
	switch (dt.getLevel()) {
	case 1:
		meal = "아침 식단";
		break;
	case 2:
		meal = "점심 식단";
		break;
	case 3:
		meal = "저녁 식단";
		break;
	default:
		break;
	}
%>
	<div class="ALL-display">
	<%@ include file="sidebar.jsp" %>
	<h1><B>식단 수정</B></h1><hr>
	<div class="totalbox">
		<div class="aligncenter">
			<div class="food_edit-box">
			<h1><B><%=meal%></B></h1>
			<p>${diet.diet_date}</p>
				<form action="food_fix" method="POST" class="food_edit-form">
					<input type="hidden" id="diet_id" name="diet_id" value="${diet_id}" required>
					<input type="hidden" id="level" name="level" value="${diet.level}" required>
					<label for="food">음식 이름</label>
					<input type="text" id="food" name="food" value="${diet.food}" placeholder="음식이름" required>
					
					<label for="calrory">칼로리</label>
					<input type="number" id="calrory" name="calrory" min="0" step="0.1" value="${diet.calrory}" placeholder="칼로리" required>
					
					<label for="tan">탄수화물</label>
					<input type="number" id="tan" name="tan" min="0" step="0.1" value="${diet.tan}" placeholder="탄수화물" required>
					
					<label for="dan">단백질</label>
					<input type="number" id="dan" name="dan" min="0" step="0.1" value="${diet.dan}" placeholder="단백질" required> 
					
					<label for="ji">지방</label>
					<input type="number" name="ji" min="0" step="0.1" value="${diet.ji}" placeholder="지방" required>  
					
					<button type="submit" class="diet-submit">등록</button>
     		 		<a href="mainpage">돌아가기</a>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>