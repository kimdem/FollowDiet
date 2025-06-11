<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
<%
    String cal = "";
	String weight = "";
	float W_weight = (float)request.getAttribute("wanted_weight");
	int goal = (Integer)request.getAttribute("goal");
    float[][] week_info1 = (float[][])request.getAttribute("week_info");
    float[] total1 = (float[])request.getAttribute("total");
    String[] week = {"월", "화", "수", "목", "금", "토", "일"};
    for (int i = 0; i < 7; i++) {
        cal += week_info1[i][0];
        weight += week_info1[i][4];
        if (i < 6) {
            cal+= ",";
            weight += ",";
        }
    } //0이 감량
%>
<div class="chart-box">
	<div class="chart-section">
		<h3>주간 칼로리 섭취량</h3>
		<canvas id="calrory" width="600" height="300"></canvas><br>
		<ul><%
			for (int i=0; i<7; i++) {
				float c = week_info1[i][0];
				if(goal == 0) {
					if(c > total1[4]) {
			%>
				<li><%=week[i]%>요일의 섭취량이 평균치보다 <%=String.format("%.1f",c-total1[4])%>Kcal 만큼 높게 섭취하셨습니다.</li>
		<%
				}
			} else {
				if(c < total1[4]) {
		%>
					<li><%=week[i]%>요일의 섭취량이 평균치보다 <%=String.format("%.1f",total1[4]-c)%>Kcal 만큼 적게 섭취하셨습니다.</li>
		<%			
				}
			}
		}%></ul><br>
	</div>
	
	<div class="chart-section">
		<h3>주간 체중 변화</h3>
		<canvas id="weight" width="600" height="300"></canvas><br>
		<ul><%
			for(int i=0; i<7; i++) {
				float w = week_info1[i][4];
				if(goal == 0) {
					if(w != 0 && w <= W_weight) {
			%>
				<li><%=week[i]%>요일에 목표 체중을 달성하셨습니다! 이대로 유지해주세요</li>
		<%
					}
				}else {
					if(w != 0 && w >= W_weight) {
		%>
				<li><%=week[i]%>요일에 목표 체중을 달성하셨습니다! 이대로 유지해주세요</li>
		<%
				}
			}
		}%></ul>
	</div>
	
	<div class="chart-section">
		<h3>주간 탄 / 단 / 지 섭취율</h3>
		<canvas id="tandanji" width="600" height="300"></canvas><br>
		<%if(total1[1] + total1[2] + total1[3] != 0) {
			if(goal == 0) {
		%>
			<p style="color: #4caf50; font-size: 24	px;">현재 설정된 권장 섭취량은 다음과 같습니다.</p>
			<p><B>탄수화물: 50%</B> | <B>단백질: 30%</B> | <B>지방: 20%</B></p>
		<%}else {%>
			<p>현재 설정된 권장 섭취량은 다음과 같습니다.</p>
			<p><B>탄수화물: 55%</B> | <B>단백질: 15%</B> | <B>지방: 30%</B></p>
		<%}}%>
	</div>
</div>
<script>
const calrory = document.getElementById("calrory").getContext("2d");
const weight = document.getElementById("weight").getContext("2d");
const tandanji = document.getElementById("tandanji").getContext("2d");
const calrory_chart = new Chart(calrory, {
    type: "line",
    data: {
        labels: ["월", "화", "수", "목", "금", "토", "일"],
        datasets: 
            [
            	{ label: "칼로리",   data: [<%=cal%>], borderColor: "rgba(255, 99, 132, 1)", fill: false, tension: 0.2 },
            	{
            		label: "평균치",
            		data: [<%=total1[4]%>,<%=total1[4]%>,<%=total1[4]%>,<%=total1[4]%>,<%=total1[4]%>,<%=total1[4]%>,<%=total1[4]%>],
            		borderColor: "blue", borderWidth: 2, borderDash: [6, 6], pointRadius: 0, fill: false, tension: 0.0
            	}
            ]
    },
    options: {
    	legend: { display: true },
        responsive: false,
        scales: { y: { beginAtZero: true } }
    }
});

const weight_chart = new Chart(weight, {
	type: "line",
	data: {
		labels: ["월", "화", "수", "목", "금", "토", "일"],
		datasets: [
			{label: "체중", data: [<%=weight%>], borderColor: "rgba(155, 89, 182, 1)", fill:false, tension: 0.2},
			{
				label: "목표 체중",
				data: [<%=W_weight%>, <%=W_weight%>, <%=W_weight%>, <%=W_weight%>, <%=W_weight%>, <%=W_weight%>, <%=W_weight%>],
				borderColor: "blue", borderWidth: 2, borderDash: [6, 6], pointRadius: 0, fill: false, tension: 0.0
			}
		]
	},
	options: {
		legend: { display: true },
        responsive: false,
        scales: { y: { beginAtZero: true } }
	}
});


const tandanji_chart = new Chart(tandanji, {
	type: "doughnut",
	data: {
		labels: ["탄수화물", "단백질", "지방"],
		datasets: [{
			data: [<%=total1[1]%>, <%=total1[2]%>, <%=total1[3]%>],
			backgroundColor: ["rgba(54, 162, 235, 0.7)", 'rgba(255, 206, 86, 0.7)', 'rgba(75, 192, 192, 0.7)']
		}]
	},
	// 이부분은 블로그 다수 참고
	options: {
	    cutout: "70%",
	    responsive: false,
	    plugins: {
	        legend: { display: false },
	        tooltip: { enabled: true },
	        datalabels: {//특히 이부분 -> 차트값을 백분율로 만들어서 출력하는 과정 및 char.js의 추가 플러그인 기능
	            formatter: (value, context) => {
	            	if(value===0) {
	            		return "데이터 미입력";
	            	}
	            	const label = context.chart.data.labels[context.dataIndex];
	                const data = context.chart.data.datasets[0].data;
	                const total = data.reduce((a, b) => a + b, 0);
	                const percent = (value / total * 100);
	                return label + "\n" + percent.toFixed(1) + '%';
	            },
	            color: '#222',
	            font: { weight: 'bold', size: 16 }
	        }
	    }
	},
	plugins: [ChartDataLabels]
});
</script>
