function num_p() {
	document.form_info.ea.value = parseInt(document.form_info.ea.value) + 1;
}

function num_m() {

	if(document.form_info.ea.value > 1) {
		document.form_info.ea.value = parseInt(document.form_info.ea.value) -1;
	}else {
		document.form_info.ea.value = 1;
		alert("\n1개 이상 선택하셔야 합니다    ");
		return;
	}
}
