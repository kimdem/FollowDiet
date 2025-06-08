<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="OurDiet.dietlist" %>
<%@ page import="OurDiet.Diet" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<%
	LocalDate today = LocalDate.now();
	int nowyear = today.getYear();
	int nowmonth = today.getMonthValue();
	int nowday = today.getDayOfMonth();
	
	String yearP = request.getParameter("year");
    String monthP = request.getParameter("month");
    String dayP = request.getParameter("day");
    int selectedyear = yearP != null ? Integer.parseInt(yearP) : nowyear;
    int selectedmonth = monthP != null ? Integer.parseInt(monthP) : nowmonth;
    int selectedday = dayP!= null ? Integer.parseInt(dayP) : nowday;
    boolean yearok = selectedyear == nowyear;
    boolean monthok = selectedmonth == nowmonth && yearok;
    
    LocalDate Date = LocalDate.of(selectedyear, selectedmonth, selectedday);
    double[] recommend = (double[])request.getAttribute("recommend");
    boolean weight_exists = true;
    if(recommend[0] == 0) {weight_exists = false;}
    Object[] arr = (Object[])request.getAttribute("weights");
    Float WantedWeight = (Float)arr[0];
    Float Today_weight = (Float)arr[1];
    String msg = (String)arr[2];
%>
<head>
	<title>식단 관리</title>
	<link rel="stylesheet" href="/CSS/mainpage.css">
	<link rel="stylesheet" href="/CSS/sidebar.css">
	<link rel="stylesheet" href="/CSS/Modal.css">
	<script>
		function logout() {
			if(window.confirm("정말 로그아웃 하시겠습니까?")) {
				window.location.href="logout";
			}
		}
	</script>
</head>
<body>
<h1 style="text-align: center; color: #388e3c"><B>식단 관리</B></h1><hr><br>
<div class="All-display">
	<%@ include file="sidebar.jsp" %>
	<div class="diet-box">
		<div class="date-box">
			<form action="#" method="GET">
			<label class="date-label">날짜 선택 : </label>
			<select class="date-select" name="year" onChange="this.form.submit()">
				<%
					for(int y = nowyear-10; y <= nowyear; y++) {
				%>
					<option value="<%=y %>" <%= (y==selectedyear ? "selected" : "") %>>
					<%=y%>년</option>
				<%}%>
			</select>
			
			<select class="date-select" name="month" onChange="this.form.submit()">
				<%
					int maxM = (selectedyear == nowyear) ? nowmonth : 12;
					for(int m = 1; m<=maxM; m++) {
				%>
					<option value="<%=m%>" <%=(m==selectedmonth ? "selected" : "") %>>
					<%=m%>월</option>
				<%}%>
			</select>
			
			<select class="date-select" name="day" onChange="this.form.submit()">
				<%
					int maxD = 31;
					if(selectedmonth == 2) {
						maxD = 28;
					} else if(selectedmonth == 4 || selectedmonth == 6 || selectedmonth == 9 || selectedmonth == 11) {
						maxD = 30;
					}
					if(monthok) {
						maxD = nowday;
					}
					for(int d = 1; d <=maxD; d++) {
				%>
					<option value="<%=d%>" <%=(d==selectedday ? "selected" : "")%>><%=d%>일</option> 
				<%}%>
			</select>
		</form> 
		</div>
	
	<div class="weight-box">
		<h2><a href="#" onClick="openWeightModal('<%=Date.toString()%>')">오늘 몸무게</a></h2>
		<div class="weight-info">
		<%
			if(Today_weight == 0.0) {%>미입력 / <span style="color: #388e3c; text-weight: bold;"><%=WantedWeight%> KG</span><%
			}else {%> <%=Today_weight%> KG / <span style="color: #388e3c; text-weight: bold;"><%=WantedWeight%> KG</span>
		<div class="weight-msg"><%=msg%></div><%}%>
		</div>
	</div>
	<div class="food-3">
	<div class="food-card">
		<h2><a href="#" onClick="openDietModal('<%=Date.toString()%>', 1)">아침</a></h2>
		<ul class="food-list">
		<%
			float Calrorysum1 = 0, Calrorysum2 = 0, Calrorysum3 = 0;
			float tan = 0, dan = 0, ji = 0;
			OurDiet.dietlist todaylist = (OurDiet.dietlist)request.getAttribute("dietlist");
			if(todaylist != null) {
				List<OurDiet.Diet> breakfastList = todaylist.getBreakfastList();
				if (breakfastList != null && !breakfastList.isEmpty()) {
					for (Diet diet : breakfastList) {
						Calrorysum1 += diet.getCalrory();
						tan += diet.getTan();
						dan += diet.getDan();
						ji += diet.getJi();
		%>
			<li class="food-li">
				<span><%=diet.getFood()%></span>
				<span><%=diet.getCalrory()%> Kcal</span>
			</li>		
		<%				
					}
				} else {
		%>
		<li class="food-li food-null">아직 공복이에요!</li>	
		<%
				}
			}
		%>
		</ul>
		<div class="food-cal">아침 식사 칼로리 : <%=Calrorysum1 %></div>
	</div>
	
	<div class="food-card">
		<h2><a href="#" onClick="openDietModal('<%=Date.toString()%>', 2)">점심</a></h2>
		<ul class="food-list">
		<%	
			if(todaylist != null) {
				List<OurDiet.Diet> lunchList = todaylist.getLunchList();
				if (lunchList != null && !lunchList.isEmpty()) {
					for (Diet diet : lunchList) {
						Calrorysum2 += diet.getCalrory();
						tan += diet.getTan();
						dan += diet.getDan();
						ji += diet.getJi();
		%>
			<li class="food-li">
				<span>음식 : <%=diet.getFood() %></span>
				<span><%=diet.getCalrory()%> Kcal</span>
			</li>
		<%
					}
				} else {
		%>
			<li class="food-li food-null">아직 공복이에요!</li>
		<%
				}
			}
		%>
		</ul>
		<div class="food-cal">점심 식사 칼로리 : <%=Calrorysum2 %></div>
	</div>
	
	<div class="food-card">
		<h2><a href="#" onClick="openDietModal('<%=Date.toString()%>', 3)">저녁</a></h2>
		<ul class="food-list">
		<%
			if(todaylist != null) {
				List<OurDiet.Diet> dinnerList = todaylist.getDinnerList();
				if(dinnerList != null && !dinnerList.isEmpty()) {
					for (Diet diet : dinnerList) {
						Calrorysum3 += diet.getCalrory();
						tan += diet.getTan();
						dan += diet.getDan();
						ji += diet.getJi();
		%>
			<li class="food-li">
				<span><%=diet.getFood() %></span>
				<span><%=diet.getCalrory()%> Kcal</span>
			</li>
		<%
					}
				} else {
		%>
			<li class="food-null">아직 공복이에요!</li>
		<%
				}
			}
		%>
		</ul>
		<div class="food-cal">저녁 식사 칼로리 : <%=Calrorysum3 %></div>
	</div>
	</div>
	<div class="total-box">
		<div class="total-item">
			<span class="total-label">총합 칼로리</span>
			<span class="total-value"><%= Calrorysum1 + Calrorysum2 + Calrorysum3%> Kcal</span>
			<span class="total-recommend">권장량 <%if(weight_exists==true){%> <%=String.format("%.1f", recommend[0])%> Kcal<%}else{%>(몸무게 미입력)<%}%></span>
		</div>
		<div class="gaugebar-box">
			<div class="gaugebar-total">
				<div class="gaugebar-fill"style="width:<%=weight_exists ? ((Calrorysum1+Calrorysum2+Calrorysum3)/recommend[0]*100) : 0%>%"></div>
			</div>
			<span class="gaugebar-percent"><%=weight_exists ? String.format("%.0f", (Calrorysum1+Calrorysum2+Calrorysum3)/recommend[0]*100) : 0%>%</span>
		</div>
		
		<div class="total-item">
			<span class="total-label">총합 탄수화물</span>
			<span class="total-value"><%=tan %> g</span>
			<span class="total-recommend">권장량 <%if(weight_exists==true){%> <%=String.format("%.1f", recommend[1])%> g<%}else{%>(몸무게 미입력)<%}%></span>
		</div>
		<div class="gaugebar-box">
			<div class="gaugebar-total">
				<div class="gaugebar-fill" style="width:<%=weight_exists ? (tan/recommend[1]*100) : 0%>%"></div>
			</div>
			<span class="gaugebar-percent"><%=weight_exists ? String.format("%.0f", tan/recommend[1]*100) : 0%>%</span>
		</div>
		
		<div class="total-item">
			<span class="total-label">총합 단백질</span>
			<span class="total-value"><%=dan %> g</span>
			<span class="total-recommend">권장량 <%if(weight_exists==true){%> <%=String.format("%.1f", recommend[2])%> g<%}else{%>(몸무게 미입력)<%}%></span>
		</div>
		<div class="gaugebar-box">
			<div class="gaugebar-total">
				<div class="gaugebar-fill" style="width:<%=weight_exists ? (dan/recommend[2]*100) : 0%>%"></div>
			</div>
			<span class="gaugebar-percent"><%=weight_exists ? String.format("%.0f", dan/recommend[2]*100) : 0%>%</span>
		</div>
		
		<div class="total-item">
			<span class="total-label">총합 지방</span>
			<span class="total-value"><%=ji %> g</span>
			<span class="total-recommend">권장량 <%if(weight_exists==true){%> <%=String.format("%.1f", recommend[3])%> g<%}else{%>(몸무게 미입력)<%}%></span>
		</div>
		<div class="gaugebar-box">
			<div class="gaugebar-total">
				<div class="gaugebar-fill" style="width:<%=weight_exists ? (ji/recommend[3]*100) : 0%>%"></div>
			</div>
			<span class="gaugebar-percent"><%=weight_exists ? String.format("%.0f", ji/recommend[3]*100) : 0%>%</span>
		</div>
	</div>
	</div>
</div>
<script>
	function openWeightModal(date) {
		document.getElementById("weight-modal").style.display = "block";
		document.getElementById("weight-modal-date").innerText = date;
		document.getElementById("time").value = date;
	}
	function closeWeightModal() {
		document.getElementById('weight-modal').style.display = 'none';
	}
	
	function openDietModal(date, level) {
		var meal = "";
		switch (level) {
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
		document.getElementById("diet-modal").style.display = "block";
		document.getElementById("meal").innerText = meal;
		document.getElementById("level").value = level;
		document.getElementById("date").value = date;
	}
	
	function closeDietModal() {
		document.getElementById("diet-modal").style.display = "none";
	}
</script>
<%@ include file="Todayweight.jsp" %>
<%@ include file="setdiet.jsp" %>
</body>
</html>