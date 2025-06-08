<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
	<title>통계보기</title>
	<link rel="stylesheet" href="/CSS/report.css">
	<link rel="stylesheet" href="/CSS/sidebar.css">
	<link rel="stylesheet" href="/CSS/chart.css">
</head>
<body>
<div class="All-display">
<%@ include file="sidebar.jsp" %>
<div class="totalbox">
	<h1><B>통계</B></h1><hr>
	<div class="aligncenter">
		<div class="date-box">
			<form action="#" method="GET">
			<label for="date" class="date-label">주차선택</label>
			<select name="date" id="date" class="date-select" onchange="this.form.submit()">
				<%
					float[][] week_info = (float[][])request.getAttribute("week_info");
					float[] total = (float[])request.getAttribute("total");
					String[] printweek = {"월", "화", "수", "목", "금", "토", "일"};
					LocalDate jspdate = (LocalDate)request.getAttribute("jspdate");
					List<LocalDate> M_list = (List<LocalDate>)request.getAttribute("M_list");
					for(LocalDate monday : M_list) {
						String select = monday.equals(jspdate) ? "selected" : "";
				%>
				<option value="<%=monday%>" <%=select%>>
					<%=monday%> ~ <%=monday.plusDays(6)%>
				</option>
				<%}%>
			</select>
		</form>
	</div>
	</div>
	<div class="totalcard">
		<%
			for(int i = 0; i<7; i++) {
		%>
		<div class="total-day">
			<div class="total-whatday">
				<%=jspdate.plusDays(i)%> (<%=printweek[i]%>)
			</div>
			<div class="totalinfo">
				<div><span class="total-span">칼로리</span><B><%=week_info[i][0] %></B> Kcal</div>
				<div><span class="total-span">탄수화물</span><B><%=week_info[i][0] %></B> g</div>
				<div><span class="total-span">단백질</span><B><%=week_info[i][0] %></B> g</div>
				<div><span class="total-span">지방</span><B><%=week_info[i][0] %></B> g</div>
			</div>
		</div>
		<%}%>
	</div>
	
	 <div class="chart">차트 분석</div>
	 <div class="aligncenter">
	 	<%@ include file="report_chart.jsp" %>
	 </div>
	<div class="chart">주간 정산</div>
	<table class="analysis">
	<tr>
		<th>주간 섭취량</th>
		<th>칼로리</th>
	    <th>탄수화물</th>
	    <th>단백질</th>
	    <th>지방</th>
	</tr>
	<tr>
		<th>총합</th>
		<th>${total[0]} Kcal</th>
		<th>${total[1]} g</th>
		<th>${total[2]} g</th>
		<th>${total[3]} g</th>
	</tr>
	<tr>
		<th>평균</th>
		<th><%=String.format("%.1f", total[4])%> Kcal</th>
		<th><%=String.format("%.1f", total[5])%> g</th>
		<th><%=String.format("%.1f", total[6])%> g</th>
		<th><%=String.format("%.1f", total[7])%> g</th>
	</tr>
	<tr>
		<th>전주 대비 섭취율</th>
		<%if((total[8] + total[9] + total[10] + total[11]) != 0) {%>
		<th><%=String.format("%.1f", total[8])%> %</th>
		<th><%=String.format("%.1f", total[9])%> %</th>
		<th><%=String.format("%.1f", total[10])%> %</th>
		<th><%=String.format("%.1f", total[11])%> %</th>
		<%}else{%>
		<th colspan="4">전주 데이터 미입력</th>
		<%}%>
	</tr>
	</table>
	</div>
</div>
</body>
</html>