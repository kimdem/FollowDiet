<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<script src="/js/dietvalid.js"></script>
<div id="diet-modal" class="diet-modal" style="display: none;">
	<form action="insertdiet" name="insertdiet" method="post" class="modal-diet-box">
		<h2><span id="meal"></span></h2>
		<input type="hidden" id="level" name="level" value="">
		<input type="hidden" id="date" name="date" value="">
	
		<div class="diet-form">
			<label for="food">음식 이름</label>
			<input type="text" id="food" name="food" placeholder="음식이름" required>
		</div>
		<div class="diet-form">
			<label for="calrory">칼로리</label>
			<input type="number" id="calrory" name="calrory" min="0" step="0.1" value="0" placeholder="칼로리" required>
		</div>
		<div class="diet-form">
			<label for="tan">탄수화물</label>
			<input type="number" id="tan" name="tan" min="0" step="0.1" value="0" placeholder="탄수화물" required>
		</div>
		<div class="diet-form">
			<label for="dan">단백질</label>
			<input type="number" id="dan" name="dan" min="0" step="0.1" value="0" placeholder="단백질" required> 
		</div>
		<div class="diet-form">
			<label for="ji">지방</label>
			<input type="number" name="ji" min="0" step="0.1" value="0" placeholder="지방" required>  
		</div>
		<div class="form-btns">
			 <button type="submit" class="diet-submit">등록</button>
     		 <button type="button" class="modal-diet-close" onclick="closeDietModal()">취소</button>
		</div>   
	</form>
</div>

	



