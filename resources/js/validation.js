function CheckAddPhone() {

	var phoneId = document.getElementById("phoneId");
	var phoneName = document.getElementById("phoneName");
	var productPrice = document.getElementById("productPrice");
	var availableStock = document.getElementById("availableStock");

	
	
	// 상품아이디 체크
    if (!check(/^PHO[0-9]{1,10}$/, phoneId,
            "[핸드폰 코드]\n첫 글자는 반드시 PHO로 시작해야 합니다."))
        return false;
		
	// 상품명 체크	
	if (phoneName.value.length < 4 || phoneName.value.length > 12) {
		alert("[핸드폰 이름]\n최소 4자에서 최대 50자까지 입력하세요");
		//name.select();
		phoneName.focus();
		return false;
	}
	// 상품 가격 체크
	if (productPrice.value.length == 0 || isNaN(productPrice.value)) {
		alert("[가격]\n숫자만 입력하세요");
		//unitPrice.select();
		productPrice.focus();
		return false;
	}

	if (productPrice.value < 0) {
		alert("[가격]\n음수를 입력할 수 없습니다");
		//unitPrice.select();
		productPrice.focus();
		return false;
	} 

	// 재고 수 체크
	if (isNaN(availableStock.value)) {
		alert("[재고 수]\n숫자만 입력하세요");
		//unitsInStock.select();
		availableStock.focus();
		return false;
	}
	
	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		//e.select();
		e.focus();
		return false;
	}

	 document.newPhone.submit()
}
