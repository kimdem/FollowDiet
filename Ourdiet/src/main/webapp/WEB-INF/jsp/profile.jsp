<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%if (request.getAttribute("pwd") != null) {%> <script>alert("<%=request.getAttribute("pwd")%>");</script><%}%>
<%if (request.getAttribute("edit_complete") != null) {%> <script>alert("<%=request.getAttribute("edit_complete")%>");</script><%}%>
<head>
	<title>프로필</title>
	<link rel="stylesheet" href="/CSS/profile.css">
	<link rel="stylesheet" href="/CSS/sidebar.css">
	<link rel="stylesheet" href="/CSS/profile-modal.css">
</head>
<body>
<div class="All-display">
	<%@ include file="sidebar.jsp" %>
<div class="totalbox">
	<h1><B>내 프로필</B></h1><hr>
	<div class="profile-box">
		<form action="profile_edit" method="POST" class="profile-formtag">
			<div class="form-label">
				<label>ID : </label><span>${info.id}</span>
			</div>
			<div class="form-label">
				<label>PWD : </label><span><button type="button" onclick="openmodal()">비밀번호 변경하기</button></span>
			</div>
			<div class="form-label">
				<label>나이 : </label><input type="number" name="age" step="1" min="0" value="${info.age}" placeholder="나이를 입력하세요">
			</div>
			<div class="form-label">
				<label>성별 : </label><span>${gender}</span>
			</div>
			<div class="form-label">
				<label>키 : </label><input type="number" name="tall" step="0.1" min="0" value="${info.tall}" placeholder="키를 입력하세요">
			</div>
			<div class="form-label">
				<label>현재 몸무게 : </label><input type="number" name="weight" step="0.1" min="0" value="${info.weight}" placeholder="현재 몸무게를 입력하세요" required>
			</div>
			<div class="form-label">
				<label>목표 몸무게 : </label><input type="number" name="wantedweight" step="0.1" min="0" value="${info.wantedweight}" placeholder="키를 입력하세요" required>
			</div>
			<div class="form-radio">
				<span >주간 운동량</span>
				<label><input type="radio" name="ex" value="1.2" required>거의 안함</label>
				<label><input type="radio" name="ex" value="1.375" required>가벼운 운동(주 1-3회)</label>
				<label><input type="radio" name="ex" value="1.55" required>중간 운동(주 3-5회)</label>
				<label><input type="radio" name="ex" value="1.725" required>격렬한 운동(주 6-7회)</label>
				<label><input type="radio" name="ex" value="1.9" required>매우 격렬한 운동(주 7회 이상 또는 육체노동자)</label>
			</div>
			<input type="submit" value="수정하기">
		</form>
	</div>
</div>
</div>	
<script>
	function openmodal() {
		 document.getElementById('profile-modal').style.display = "block";
	}
	function closemodal() {
		 document.getElementById('profile-modal').style.display = "none";
	}
</script>
<%@ include file="profile-modal.jsp" %>
</body>
</html>
