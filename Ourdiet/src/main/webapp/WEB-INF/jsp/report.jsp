<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head><title>통계보기</title></head>
<body>
	<h1>통계</h1><hr>
	<a href="mainpage">뒤로</a> 
	<form action="#" method="GET">
		<label for="date">주차선택 </label><br>
		<select name="date" id="date" onchange="this.form.submit()">
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
	<%
		for(int i = 0; i<7; i++) {
	%>
		<h1><%=jspdate.plusDays(i)%> (<%=printweek[i]%>)</h1>
	<table border="1">
		<tr>
			<th></th>
			<th>칼로리</th>
			<th>탄수화물</th>
			<th>단백질</th>
			<th>지방</th>
		</tr>
		<tr>
			<th>총합</th>
			<th><%=week_info[i][0]%> Kcal</th>
			<th><%=week_info[i][1]%> g</th>
			<th><%=week_info[i][2]%> g</th>
			<th><%=week_info[i][3]%> g</th>
		</tr>
	</table><br><br>
	<%}%>
	<p>차트분석
	<%@ include file="report_chart.jsp" %>
	
	
	<hr><br>
	<h1>주간 정산</h1><br><br>
	<table border="1">
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
	<% %>
</body>
</html>