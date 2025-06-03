function dietvalid() {
	var form = document.forms["insertdiet"];
	var food = form.food.value;
	
	if(food.length > 100) {
		form.food.focus();
		alert("음식 이름이 너무 깁니다.");
		return false;
	}		
}