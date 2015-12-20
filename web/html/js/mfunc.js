function GetObjByID(id) {
	return document.getElementById(id);
}

function GetValueByID(id) {
    var obj = document.getElementById(id);
    if (obj == null) return "";
    return obj.value;
}

function GetCheckBoxStateByID(id) {
    var obj = document.getElementById(id);
    if (obj == null) return false;
    return obj.checked;
}

function findDestHiddenObj(objs, destHidName) {
	var allobjs = objs;
	for (i = 0; i < allobjs.length; i++) {
		if (allobjs[i].type == "hidden" && allobjs[i].name == destHidName) 
			return allobjs[i];
	}
	return null;
}

function dataToHidden() {
	var inputObjs = document.getElementsByTagName("input");
	if (inputObjs == null || inputObjs.length < 1) return -1;
	for (i = 0; i < inputObjs.length; i++) {
		destObj = eval("document.forms[0].h_" + inputObjs[i].name);
		if (destObj == null) continue;
		switch (inputObjs[i].type) {
			case "checkbox":
				destObj.value = (inputObjs[i].checked) ? "1" : "0";
				break;
			case "radio":
				break;
			case "select":
				break;
			default:
				break;
		} 
	}
}

function objAdd(objArr1, objArr2) {
	var newObj = new Array();
	if (objArr1 == null && objArr2 == null) return null;
	if (objArr2 != null) {
		for (i = 0; i < objArr2.length; i++) {
			newObj[i] = objArr2[i];
		}	
	}

	newObjLen = newObj.length;
	for (i = newObjLen; i < newObjLen + objArr1.length; i++) {
		newObj[i] = objArr2[i - newObjLen];
	}
	
	alert(newObj.length);
	return newObj;
}

function inputTOVision() {
	var inputObjs = document.getElementsByTagName("input");
	if (inputObjs == null || inputObjs.length < 1) return -1;
	for (i = 0; i < inputObjs.length; i++) {
		destObj = eval("document.forms[0].h_" + inputObjs[i].name);
		if (destObj == null) continue;
		switch (inputObjs[i].type) {
			case "checkbox":
				inputObjs[i].checked = (destObj.value != "0") ? true : false;
				break;
			case "radio":
				break;
			default:
				break;
		} 
	}
}

function setSelectOptionSelected(select, optValue) {
	for (j = 0; j < select.options.length; j++) {
		if (select.options[j].value == optValue) break;
	}
	if (j < select.options.length) select.options[j].selected = true;	
}

function selectTOVision() {
	var selectOjbs = document.getElementsByTagName("select");
	if (selectOjbs == null || selectOjbs.length < 1) return -1;
	for (i = 0; i < selectOjbs.length; i++) {
		destObj = eval("document.forms[0].h_" + selectOjbs[i].name);
		if (destObj == null || destObj.length < 1) continue;
		setSelectOptionSelected(selectOjbs[i], destObj.value);
	}
}

function dataToVision() {
	inputTOVision();
	selectTOVision();
}