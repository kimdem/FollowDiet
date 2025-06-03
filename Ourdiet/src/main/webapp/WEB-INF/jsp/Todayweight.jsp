<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<div id="weight-modal" class="weight-modal" style="display:none;">
	<form action="insertW" method="post" class="modal-box">
		<h2>몸무게 설정</h2>
		<B><span id="weight-modal-date"></span></B>
		<input type="number" id="weight" name="weight" placeholder="오늘의 체중을 적어주세요!" step="0.1" min="0" value="0" required>
		<input type="hidden" id="time" name="time" value="">
		<div class="modal-btn">
			<button type="submit" class="modal-submit">등록</button>
			<button type="button" class="modal-close" onClick="closeWeightModal()">취소</button>
		</div>
	</form> 
</div>
	
