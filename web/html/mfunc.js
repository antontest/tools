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