<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="OurDiet.dto.dietlist" %>
<%@ page import="OurDiet.dto.Diet" %>
<%@ page import="OurDiet.dto.Diet_fix_data" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<%if(request.getAttribute("too_long_name") != null) {%><script>alert("<%=request.getAttribute("too_long_name")%>")</script><%}%>
<%if(request.getAttribute("food_update_complete") != null) {%><script>alert("<%=request.getAttribute("food_update_complete")%>")</script><%}%>
<%
	String date_req = request.getParameter("date");
    LocalDate Date;
    if(date_req != null) {
    	Date = LocalDate.parse(date_req);
    } else {
    	Date = LocalDate.now();
    }
   
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
</head>
<body>
<h1 style="text-align: center; color: #388e3c"><B>식단 관리</B></h1><hr><br>
<div class="All-display">
	<%@ include file="sidebar.jsp" %>
	<div class="diet-box">
		<div class="date-box">
			 <form action="#" method="GET">
			  <label class="date-label">날짜 선택 : </label>
			  <input type="date" name="date" value="<%=Date.toString()%>" max="<%=LocalDate.now().toString()%>" onchange="this.form.submit()" class="date-input" required>
			</form>
		</div>
	
	<div class="weight-box">
		<h2><a href="#" onClick="openWeightModal('<%=Date.toString()%>')">오늘 몸무게</a></h2>
		<div class="weight-info">
		<%
		if(Today_weight == 0.0) {
		%>미입력 / <span style="color: #388e3c; text-weight: bold;"><%=WantedWeight%> KG</span><%
		}else {
		%> <%=Today_weight%> KG / <span style="color: #388e3c; text-weight: bold;"><%=WantedWeight%> KG</span>
		<div class="weight-msg"><%=msg%></div><%
		}
		%>
		</div>
	</div>
	<div class="food-3">
	<div class="food-card">
		<h2><a href="#" onClick="openDietModal('<%=Date.toString()%>', 1)">아침</a></h2>
		<ul class="food-list">
		<%
		float Calrorysum1 = 0, Calrorysum2 = 0, Calrorysum3 = 0;
			float tan = 0, dan = 0, ji = 0;
			OurDiet.dto.dietlist todaylist = (OurDiet.dto.dietlist)request.getAttribute("dietlist");
			if(todaylist != null) {
				List<OurDiet.dto.Diet_fix_data> breakfastList = todaylist.getBreakfastList();
				if (breakfastList != null && !breakfastList.isEmpty()) {
					for (Diet_fix_data diet : breakfastList) {
						Calrorysum1 += diet.getCalrory();
						tan += diet.getTan();
						dan += diet.getDan();
						ji += diet.getJi();
		%>
			<li class="food-li">
			<a href="food_edit?diet_id=<%=diet.getDiet_id()%>"><span><%=diet.getFood()%></span></a>
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
		<div class="food-cal">아침 식사 칼로리 : <%=Calrorysum1%></div>
	</div>
	
	<div class="food-card">
		<h2><a href="#" onClick="openDietModal('<%=Date.toString()%>', 2)">점심</a></h2>
		<ul class="food-list">
		<%
		if(todaylist != null) {
				List<OurDiet.dto.Diet_fix_data> lunchList = todaylist.getLunchList();
				if (lunchList != null && !lunchList.isEmpty()) {
					for (Diet_fix_data diet : lunchList) {
						Calrorysum2 += diet.getCalrory();
						tan += diet.getTan();
						dan += diet.getDan();
						ji += diet.getJi();
		%>
			<li class="food-li">
			<a href="food_edit?diet_id=<%=diet.getDiet_id()%>"><span><%=diet.getFood()%></span></a>
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
		<div class="food-cal">점심 식사 칼로리 : <%=Calrorysum2%></div>
	</div>
	
	<div class="food-card">
		<h2><a href="#" onClick="openDietModal('<%=Date.toString()%>', 3)">저녁</a></h2>
		<ul class="food-list">
		<%
		if(todaylist != null) {
				List<OurDiet.dto.Diet_fix_data> dinnerList = todaylist.getDinnerList();
				if(dinnerList != null && !dinnerList.isEmpty()) {
					for (Diet_fix_data diet : dinnerList) {
						Calrorysum3 += diet.getCalrory();
						tan += diet.getTan();
						dan += diet.getDan();
						ji += diet.getJi();
		%>
			<li class="food-li">
			<a href="food_edit?diet_id=<%=diet.getDiet_id()%>"><span><%=diet.getFood()%></span></a>
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