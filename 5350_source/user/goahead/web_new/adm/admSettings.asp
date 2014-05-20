<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="/lang/b28n.js"></script>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<title>Administrator Settings</title>

<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");
var langtype = "<% getLangType(); %>";
var greenapb = '<% getGAPBuilt(); %>';
var http_request = false;

function style_display_on()
{
	if (window.ActiveXObject)
	{ // IE
		return "block";
	}
	else if (window.XMLHttpRequest)
	{ // Mozilla, Safari,...
		return "table-row";
	}
}

function makeRequest(url, content) {
    http_request = false;
    if (window.XMLHttpRequest) { // Mozilla, Safari,...
        http_request = new XMLHttpRequest();
        if (http_request.overrideMimeType) {
            http_request.overrideMimeType('text/xml');
        }
    } else if (window.ActiveXObject) { // IE
        try {
            http_request = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
            http_request = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {}
        }
    }
    if (!http_request) {
    	  if(langtype=="zhcn")
    	  alert("失败");
    	  else
        alert('Giving up :( Cannot create an XMLHTTP instance');
        return false;
    }
    http_request.onreadystatechange = alertContents;
    http_request.open('POST', url, true);
    http_request.send(content);
}

function alertContents() {
    if (http_request.readyState == 4) {
        if (http_request.status == 200) {
			// refresh
			window.location.reload();
        } else {
        	if(langtype=="zhcn")
        	  alert("请示出错");
        	else
            alert('There was a problem with the request.');
        }
    }
}



function atoi(str, num)
{
    i=1;
    if(num != 1 ){
        while (i != num && str.length != 0){
            if(str.charAt(0) == '.'){
                i++;
            }
            str = str.substring(1);
        }
        if(i != num )
            return -1;
    }

    for(i=0; i<str.length; i++){
        if(str.charAt(i) == '.'){
            str = str.substring(0, i);
            break;
        }
    }
    if(str.length == 0)
        return -1;
    return parseInt(str, 10);
}

function isAllNum(str)
{
	for (var i=0; i<str.length; i++){
	    if((str.charAt(i) >= '0' && str.charAt(i) <= '9') || (str.charAt(i) == '.' ))
			continue;
		return 0;
	}
	return 1;
}

function AdmFormCheck()
{
	if (document.Adm.admuser.value == "") {
		if(langtype=="zhcn")
		alert("请确定用户名");
		else
		alert("Please specify the administrator account.");
		return false;
	}
	if (document.Adm.admpass.value == "") {
		if(langtype=="zhcn")
		alert("请确定密码");
		else
		alert("Please specify the administrator password.");
		return false;
	}
	return true;
}



function disableTextField (field)
{
  if(document.all || document.getElementById){
    field.disabled = true;
  }else {
    field.oldOnFocus = field.onfocus;
    field.onfocus = skip;
  }
}

function enableTextField (field)
{
  if(document.all || document.getElementById)
    field.disabled = false;
  else {
    field.onfocus = field.oldOnFocus;
  }
}



function initTranslation()
{
	var e = document.getElementById("manAdmSet");
	e.innerHTML = _("man admin setting");
	e = document.getElementById("mannAdmIntroduction");
	e.innerHTML = _("man introduction2");
	e = document.getElementById("manAdmAccount");
	e.innerHTML = _("man admin account");
	e = document.getElementById("manAdmPasswd");
	e.innerHTML = _("man admin passwd");
	e = document.getElementById("manAdmPasswdTitle");
	e.innerHTML = _("man admin passwd title");
	e = document.getElementById("manAdmApply");
	e.value = _("admin apply");
	e = document.getElementById("manAdmCancel");
	e.value = _("admin cancel");	
}

function initValue()
{
	var tz = "<% getCfgGeneral(1, "TZ"); %>";
	var ddns_provider = "<% getCfgGeneral(1, "DDNSProvider"); %>";


	var dateb = "<% getDATEBuilt(); %>";
	var ddnsb = "<% getDDNSBuilt(); %>";

	initTranslation();

	
}

function set_greenap()
{
	var ntp_server = "<% getCfgGeneral(1, "NTPServerIP"); %>";

	for(var j=1;j<=4;j++)
	{
	    var shour_e = eval("document.GreenAP.GAPSHour"+j);
	    var sminute_e = eval("document.GreenAP.GAPSMinute"+j);
	    var ehour_e = eval("document.GreenAP.GAPEHour"+j);
	    var eminute_e = eval("document.GreenAP.GAPEMinute"+j);
	    var action_e = eval("document.GreenAP.GAPAction"+j);

	    shour_e.disabled = true;
	    sminute_e.disabled = true;
	    ehour_e.disabled = true;
	    eminute_e.disabled = true;
	    action_e.disabled = true;
	    if (ntp_server != "" && greenapb == "1")
	    {
		action_e.disabled = false;
		switch(j)
		{
		case 1:
		    var action = "<% getCfgGeneral(1, "GreenAPAction1"); %>";
		    var time = "<% getCfgGeneral(1, "GreenAPStart1"); %>";
		    var stimeArray = time.split(" ");
		    time = "<% getCfgGeneral(1, "GreenAPEnd1"); %>";
		    var etimeArray = time.split(" ");
		    break;
		case 2:
		    var action = "<% getCfgGeneral(1, "GreenAPAction2"); %>";
		    var time = "<% getCfgGeneral(1, "GreenAPStart2"); %>";
		    var stimeArray = time.split(" ");
		    time = "<% getCfgGeneral(1, "GreenAPEnd2"); %>";
		    var etimeArray = time.split(" ");
		    break;
		case 3:
		    var action = "<% getCfgGeneral(1, "GreenAPAction3"); %>";
		    var time = "<% getCfgGeneral(1, "GreenAPStart3"); %>";
		    var stimeArray = time.split(" ");
		    time = "<% getCfgGeneral(1, "GreenAPEnd3"); %>";
		    var etimeArray = time.split(" ");
		    break;
		case 4:
		    var action = "<% getCfgGeneral(1, "GreenAPAction4"); %>";
		    var time = "<% getCfgGeneral(1, "GreenAPStart4"); %>";
		    var stimeArray = time.split(" ");
		    time = "<% getCfgGeneral(1, "GreenAPEnd4"); %>";
		    var etimeArray = time.split(" ");
		    break;
		}
		if (action == "Disable")
		    action_e.options.selectedIndex = 0;
		else if (action == "WiFiOFF")
		    action_e.options.selectedIndex = 1;
		else if (action == "TX25")
		    action_e.options.selectedIndex = 2;
		else if (action == "TX50")
		    action_e.options.selectedIndex = 3;
		else if (action == "TX75")
		    action_e.options.selectedIndex = 4;
		greenap_action_switch(j);
		if (action != "" && action != "Disable")
		{
		    shour_e.options.selectedIndex = stimeArray[1];
		    sminute_e.options.selectedIndex = stimeArray[0];
		    ehour_e.options.selectedIndex = etimeArray[1];
		    eminute_e.options.selectedIndex = etimeArray[0];
		}
	    }
	}
}


function syncWithHost()
{
	var currentTime = new Date();

	var seconds = currentTime.getSeconds();
	var minutes = currentTime.getMinutes();
	var hours = currentTime.getHours();
	var month = currentTime.getMonth() + 1;
	var day = currentTime.getDate();
	var year = currentTime.getFullYear();

	var seconds_str = " ";
	var minutes_str = " ";
	var hours_str = " ";
	var month_str = " ";
	var day_str = " ";
	var year_str = " ";

	if(seconds < 10)
		seconds_str = "0" + seconds;
	else
		seconds_str = ""+seconds;

	if(minutes < 10)
		minutes_str = "0" + minutes;
	else
		minutes_str = ""+minutes;

	if(hours < 10)
		hours_str = "0" + hours;
	else
		hours_str = ""+hours;

	if(month < 10)
		month_str = "0" + month;
	else
		month_str = ""+month;

	if(day < 10)
		day_str = "0" + day;
	else
		day_str = day;

	var tmp = month_str + day_str + hours_str + minutes_str + year + " ";
	makeRequest("/goform/NTPSyncWithHost", tmp);
}


</script>

</head>
<body onload="initValue()">
<table class="body"><tr><td>
<h1 id="manAdmSet">Administrator Settings</h1>
<p id="mannAdmIntroduction">You may configure administrator account and password settings here.</p>
<br/>
<!-- ================= Adm Settings ================= -->
<form method="post" name="Adm" action="/goform/setSysAdm">
<table width="540" border="0" cellspacing="1" cellpadding="3">
	<tr>
  <td colspan="2" id="manAdmPasswdTitle" class="title">settings administrator account and password</td>
</tr>
  <tr>
    <td id="manAdmAccount" class="head">Account</td>
    <td class="content"><input type="text" name="admuser" size="16" maxlength="16" value="<% getCfgGeneral(1, "Login"); %>"></td>
  </tr>
  <tr>
    <td id="manAdmPasswd" class="head">Password</td>
    <td class="content"><input type="password" name="admpass" size="16" maxlength="32" value="<% getCfgGeneral(1, "Password"); %>"></td>
  </tr>
</table>
<table width="540" border="0" cellpadding="2" cellspacing="1">
  <tr align="left">
    <td class="content">
      <input type=submit style="{width:120px;}" value="Apply" id="manAdmApply" onClick="return AdmFormCheck()"> &nbsp; &nbsp;
      <input type=reset  style="{width:120px;}" value="Cancel" id="manAdmCancel" onClick="window.location.reload()">
    </td>
  </tr>
</table>
</form>
</td></tr></table>
</body></html>
