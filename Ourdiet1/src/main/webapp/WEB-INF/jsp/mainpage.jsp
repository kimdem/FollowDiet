<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="OurDiet.dietlist" %>
<%@ page import="OurDiet.Diet" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<%
	if (request.getAttribute("insetdiet_err") != null) {
%>
<script>alert(insertdiet_err);</script>
<%}%>
<%
	if (request.getAttribute("dietcomplete") != null) {
%>
<script>alert(dietcomplete);</script>
<%} 
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
%>
<head><title>Ourdiet!</title></head>
<body>
	<h1 style="textalign: center">Ourdiet!!</h1><hr>
	<div>
		<form action="#" method="GET">
			<label>날짜 선택 : </label>
			<select name="year" onChange="this.form.submit()">
				<%
					for(int y = nowyear-10; y <= nowyear; y++) {
				%>
					<option value="<%=y %>" <%= (y==selectedyear ? "selected" : "") %>>
					<%=y%>년</option>
				<%}%>
			</select>
			
			<select name="month" onChange="this.form.submit()">
				<%
					int maxM = (selectedyear == nowyear) ? nowmonth : 12;
					for(int m = 1; m<=maxM; m++) {
				%>
					<option value="<%=m%>" <%=(m==selectedmonth ? "selected" : "") %>>
					<%=m%>월</option>
				<%}%>
			</select>
			
			<select name="day" onChange="this.form.submit()">
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
	<!-- 여기에 DB로 현재 캘린더 보이기 -->
	<div>
		<h1>오늘 몸무게 : </h1>
		<h1>오늘의 식단</h1>
		<h2><a href="/setdiet?level=1&year=<%=selectedyear%>&month=<%=selectedmonth%>&day=<%=selectedday%>">아침 식사</a></h2>
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
			<p>음식 : <%=diet.getFood() %> || 칼로리 : <%=diet.getCalrory()%> Kcal</p>
		<%				
					}
				} else {
		%>
		<p>음식 : 아직 공복이에요!</p>	
		<%
				}
			}
		%>
		<p>아침 식사 칼로리 : <%=Calrorysum1 %></p><hr>
		<h2><a href="/setdiet?level=2&year=<%=selectedyear%>&month=<%=selectedmonth%>&day=<%=selectedday%>">점심 식사</a></h2>
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
			<p>음식 : <%=diet.getFood() %> || 칼로리 : <%=diet.getCalrory()%> Kcal</p>
		<%
					}
				} else {
		%>
			<p> 음식 : 아직 공복이에요!
		<%
				}
			}
		%>
		<p>점심 식사 칼로리 : <%=Calrorysum2 %></p><hr>
		<h2><a href="/setdiet?level=3&year=<%=selectedyear%>&month=<%=selectedmonth%>&day=<%=selectedday%>">저녁 식사</a></h2>
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
			<p>음식 : <%=diet.getFood() %> || 칼로리 : <%=diet.getCalrory()%> Kcal</p>
		<%
					}
				} else {
		%>
			<p>음식 : 아직 공복이에요!</p>
		<%
				}
			}
		%>
		<p>저녁 식사 칼로리 : <%=Calrorysum3 %></p><hr>
		<p>총합 칼로리 : <%= Calrorysum1 + Calrorysum2 + Calrorysum3%> Kcal</p>
		<p>총합 탄수화물 : <%=tan %>g(그램)</p>
		<p>총합 단백질 : <%=dan %>g(그램)<p>
		<P>총합 지방 : <%=ji %>g(그램)<p>
	</div>
</body>
</html>