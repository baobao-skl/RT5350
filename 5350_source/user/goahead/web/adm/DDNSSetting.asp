<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="/lang/b28n.js"></script>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<title>DDNS Settings</title>

<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");

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

function isAllNum(str)
{
	for (var i=0; i<str.length; i++){
	    if((str.charAt(i) >= '0' && str.charAt(i) <= '9') || (str.charAt(i) == '.' ))
			continue;
		return 0;
	}
	return 1;
}



function DDNSFormCheck()
{
	if(  document.DDNS.DDNSProvider.value != "none" && 
		(document.DDNS.Account.value == "" ||
		 document.DDNS.Password.value == "" ||
		 document.DDNS.DDNS.value == "")){
		 	if(langtype=="zhcn")
		 	alert("请确定账号，密码和DDNS");
		 	else
		alert("Please specify account, password, and DDNS.");
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

function DDNSupdateState()
{
	if(document.DDNS.DDNSProvider.options.selectedIndex != 0){
		enableTextField(document.DDNS.Account);
		enableTextField(document.DDNS.Password);
		enableTextField(document.DDNS.DDNS);
	}else{
		disableTextField(document.DDNS.Account);
		disableTextField(document.DDNS.Password);
		disableTextField(document.DDNS.DDNS);
	}
}

function initTranslation()
{
	var e = document.getElementById("manDdnsSet");
	e.innerHTML = _("man ddns setting");
	e = document.getElementById("manDdnsIntroduction");
	e.innerHTML = _("man introduction4");
	e = document.getElementById("DdnsProvider");
	e.innerHTML = _("man ddns provider");
	e = document.getElementById("manDdnsNone");
	e.innerHTML = _("man ddns none");
	e = document.getElementById("manDdnsAccount");
	e.innerHTML = _("man ddns account");
	e = document.getElementById("manDdnsPasswd");
	e.innerHTML = _("man ddns passwd");
	e = document.getElementById("manDdns");
	e.innerHTML = _("man ddns");
	e = document.getElementById("manDdnsTitle");
	e.innerHTML = _("man ddns title");
	e = document.getElementById("manDdnsApply");
	e.value = _("admin apply");
	e = document.getElementById("manDdnsCancel");
	e.value = _("admin cancel");
}

function initValue()
{
	var tz = "<% getCfgGeneral(1, "TZ"); %>";
	var ddns_provider = "<% getCfgGeneral(1, "DDNSProvider"); %>";


	var dateb = "<% getDATEBuilt(); %>";
	var ddnsb = "<% getDDNSBuilt(); %>";

	initTranslation();


	

	if (ddnsb == "1")
	{
		document.getElementById("div_ddns").style.visibility = "visible";
		document.getElementById("div_ddns").style.display = style_display_on();
		document.getElementById("div_ddns_submit").style.visibility = "visible";
		document.getElementById("div_ddns_submit").style.display = style_display_on();
		document.DDNS.Account.disabled = false;
		document.DDNS.Password.disabled = false;
		document.DDNS.DDNS.disabled = false;
		if (ddns_provider == "none")
			document.DDNS.DDNSProvider.options.selectedIndex = 0;
		else if (ddns_provider == "dyndns.org")
			document.DDNS.DDNSProvider.options.selectedIndex = 1;
		else if (ddns_provider == "freedns.afraid.org")
			document.DDNS.DDNSProvider.options.selectedIndex = 2;
		else if (ddns_provider == "zoneedit.com")
			document.DDNS.DDNSProvider.options.selectedIndex = 3;
		else if (ddns_provider == "no-ip.com")
			document.DDNS.DDNSProvider.options.selectedIndex = 4;
		else if (ddns_provider == "3322.org")
			document.DDNS.DDNSProvider.options.selectedIndex = 5;
		DDNSupdateState();
	} 
	else
	{
		document.getElementById("div_ddns").style.visibility = "hidden";
		document.getElementById("div_ddns").style.display = "none";
		document.getElementById("div_ddns_submit").style.visibility = "hidden";
		document.getElementById("div_ddns_submit").style.display = "none";
		document.DDNS.Account.disabled = true;
		document.DDNS.Password.disabled = true;
		document.DDNS.DDNS.disabled = true;
	}
}




</script>

</head>
<body onload="initValue()">
<table class="body"><tr><td>
<h1 id="manDdnsSet">DDNS Settings</h1>
<p id="manDdnsIntroduction">You may configure DNS settings here.</p>
<br />
<!-- ================= DDNS  ================= -->
<form method="post" name="DDNS" action="/goform/DDNS">
<table id="div_ddns" width="540" border="0" cellspacing="1" cellpadding="3">
<tbody
	<tr>
  <td colspan="2" id="manDdnsTitle" class="title">settings ddns</td>
</tr>
<tr>
  <td id="DdnsProvider" class="head">Dynamic DNS Provider</td>
  <td class="content">
    <select onChange="DDNSupdateState()" name="DDNSProvider">
      <option value="none" id="manDdnsNone"> None </option>
      <option value="dyndns.org"> Dyndns.org </option>
      <option value="freedns.afraid.org"> freedns.afraid.org </option>
      <option value="zoneedit.com"> www.zoneedit.com </option>
      <option value="no-ip.com"> www.no-ip.com </option>
      <option value="3322.org"> 3322.org </option>
    </select>
  </td>
</tr>
<tr>
  <td id="manDdnsAccount" class="head">Account</td>
  <td class="content"><input size="16" name="Account" value="<% getCfgGeneral(1, "DDNSAccount"); %>" type="text"> </td>
</tr>
<tr>
  <td id="manDdnsPasswd" class="head">Password</td>
  <td class="content"><input size="16" name="Password" value="<% getCfgGeneral(1, "DDNSPassword"); %>" type="password"> </td>
</tr>
<tr>
  <td id="manDdns" class="head">DDNS</td>
  <td class="content"><input size="32" name="DDNS" value="<% getCfgGeneral(1, "DDNS"); %>" type="text"> </td>
</tr>
</tbody></table>

<table id="div_ddns_submit" width="540" border="0" cellpadding="2" cellspacing="1">
  <tr align="left">
    <td class="content">
      <input type=submit style="{width:120px;}" value="Apply" id="manDdnsApply" onClick="return DDNSFormCheck()"> &nbsp; &nbsp;
      <input type=reset  style="{width:120px;}" value="Cancel" id="manDdnsCancel" onClick="window.location.reload()">
    </td>
  </tr>
</table>
</form>


</td></tr></table>
</body></html>
