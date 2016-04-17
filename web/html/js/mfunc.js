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

function sleep(d){
  for(var t = Date.now();Date.now() - t <= d;);
}

function add_hidden_iframe() {
	var h_frame = document.getElementById("h_frame");
	if (h_frame) return h_frame;
	
	var h_div = document.createElement("DIV");
	h_div.id = "h_frame_div";
	h_div.name = "h_frame_div";
	h_div.innerHTML= "<iframe id=\"h_frame\" name=\"h_frame\" width=\"1px\" height=\"1px\" style=\"display:none\"></iframe>";
	document.body.appendChild(h_div);
}

function add_hidden_todo_input(form_id) {
	if (document.getElementById("h_todo_div")) return true;
	var form = document.getElementById(form_id);
	if (form == null) return null;
	
	var h_div = document.createElement("DIV");
	h_div.id = "h_todo_div";
	h_div.name = "h_todo_div";
	h_div.innerHTML= "<input id=\"todo\" name=\"todo\" width=\"1px\" height=\"1px\" style=\"display:none\" \>";
	form.appendChild(h_div);
	
	return true;
}

function html_btn_cgi(from_id, todo_value) {
	if (from_id == '') return false;
	var formObj = document.getElementById(from_id);
	if (formObj == null) return false;
	formObj.target = "h_frame";
	add_hidden_iframe();
	
	var todoObj = document.getElementById("todo");
	if (todoObj == null) return false;
	todoObj.value = todo_value;
	
	formObj.submit();

}

function get_elements_by_class_and_tag(class_name, tag) {
    if (class_name == '') return null;
    var classObj = document.getElementsByTagName(tag);
    if (classObj == null) return null;
    
    var classElements = new Array();
    var classElementsNum = 0;
    for (i = 0; i < classObj.length; i++) {
        if (classObj[i].className != class_name) continue;
        classElements[classElementsNum++] = classObj[i];
    }
    
    if (classElementsNum < 1) return null;
    return classElements;
}

function href_click(e) {
    var targ;
    if (!e) var e = window.event;
    if (e.target) targ = e.target;
    else if (e.srcElement) targ = e.srcElement;
    
    if (targ.nodeType == 3) // defeat Safari bug
       targ = targ.parentNode;
       
    var tname;
    tname=targ.tagName;
    var dir_path = targ.href.substring(targ.href.indexOf("download"));
    if (dir_path == '') return false;
    targ.href = "setup.cgi?next_file=ftp.htm&next_path=" + dir_path;
    return true;
}

function add_event_to_href() {
    var objs = get_elements_by_class_and_tag("dir", "a");
    if (objs.length < 1) return false;
    
    for (i = 0; i< objs.length; i++) {
        objs[i].onclick = function (event) {
            href_click(event);
        }
    }
}
