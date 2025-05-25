function Checking() {
	var form = document.forms["register"];
	var id = form.ID.value;
	var pwd = form.PWD.value;
	var Cpwd = form.ConfirmPwd.value;
	var age = form.Age.value;
	var tall = form.Tall.value;
	var weight = form.Weight.value;
	var wantW = form.WantedWeight.value;
	var idreg = /^[a-zA-Z0-9]{4,16}$/;
	var pwdreg = /^(?=.*[a-z])(?=.*\d)(?=.*[!@#$%*?&+])[A-Za-z\d!@#$%*?&+]{8,16}$/;
	var agereg = /^\d+$/;
	var floatreg = /^\d+(\.\d{1})?$/;

	if(!idreg.test(id)) {
		form.ID.focus();
		alert("ID는 영문과 숫자를 조합한 4-16자내로 작성하십시오");
		return false;
	}
	if(!pwdreg.test(pwd)) {
		form.PWD.focus();
		alert("비밀번호는 특수기호 [!@#$%*?&+]를 포함한 영문, 숫자를 조합한 8-16자 이내로 작성하시오");
		return false;
	}
	if(pwd !== Cpwd) {
		form.PWD.focus();
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	if(!agereg.test(age)) {
		form.Age.focus();
		alert("나이는 숫자만 입력하시오.");
		return false;
	}
	if(!floatreg.test(tall)) {
		form.Tall.focus();
		alert("키는 소수점 1자리까지만 작성하세요.");
		return false;
	}
	if(!floatreg.test(weight)) {
		form.Weight.focus();
		alert("몸무게는 소수점 1자리까지만 작성하세요.");
		return false;
	}
	if(!floatreg.test(wantW)) {
		form.WantedWeight.focus();
		alert("목표 체중은 소수점 1자리까지만 작성하세요");
		return false;
	}
	return true;
}