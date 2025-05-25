function dietvalid() {
	var form = document.forms["insertdiet"];
	var food = form.food.value;
	var calrory = form.calrory.value;
	var tan = form.tan.value;
	var dan = form.dan.value;
	var ji = form.ji.value;
	var floatreg = /^\d+(\.\d{1})?$/;
	
	if(food.length > 100) {
		form.food.focus();
		alert("음식 이름이 너무 깁니다.");
		return false;
	}
	if(!floatreg.test(calrory)) {
		form.calrory.focus();
		alert("소수점 1자리까지만 입력하시오");
		return false;
	}
	if(!floatreg.test(tan)) {
			form.tan.focus();
			alert("소수점 1자리까지만 입력하시오");
			return false;
		}
	if(!floatreg.test(dan)) {
			form.calrory.focus();
			alert("소수점 1자리까지만 입력하시오");
			return false;
		}
	if(!floatreg.test(ji)) {
			form.ji.focus();
			alert("소수점 1자리까지만 입력하시오");
			return false;
		}	
	
}