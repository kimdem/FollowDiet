<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<aside class="sidebar">
<script>
		function logout() {
			if(window.confirm("정말 로그아웃 하시겠습니까?")) {
				window.location.href="logout";
			}
		}
</script>
	<div class="sidebar-title">Follow Diet</div>
		<nav class="sidebar-menu">
	      <a href="mainpage" class="sidebar-link">식단 관리</a>
	      <a href="report" class="sidebar-link">통계</a>
	      <a href="profile" class="sidebar-link">내 정보</a>
	      <a href="#" class="sidebar-link logout-link" onclick="logout()">로그아웃</a>
    	</nav>
</aside>