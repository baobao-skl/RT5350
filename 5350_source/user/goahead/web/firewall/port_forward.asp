<html>
<head>
<title>Virtual Settings</title>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("firewall");
var MAX_RULES = 32;
var rules_num = <% getPortForwardRuleNumsASP(); %> ;

function deleteClick()
{
    return true;
}

function checkRange(str, num, min, max)
{
    d = atoi(str,num);
    if(d > max || d < min)
        return false;
    return true;
}

function checkIpAddr(field)
{
    if(field.value == ""){
        if(langtype=="zhcn")
    	  alert("出错：IP地址不能为空");
    	  else
        alert("Error. IP address is empty.");
        field.value = field.defaultValue;
        field.focus();
        return false;
    }

    if ( isAllNum(field.value) == 0) {
        if(langtype=="zhcn")
    	  alert("出错：应该在[0-9]范围的数字");
    	  else
        alert('It should be a [0-9] number.');
        field.value = field.defaultValue;
        field.focus();
        return false;
    }

    if( (!checkRange(field.value,1,0,255)) ||
        (!checkRange(field.value,2,0,255)) ||
        (!checkRange(field.value,3,0,255)) ||
        (!checkRange(field.value,4,1,254)) ){
        if(langtype=="zhcn")
    	  alert("IP格式出错");
    	  else
        alert('IP format error.');
        field.value = field.defaultValue;
        field.focus();
        return false;
    }

   return true;
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

function formCheck()
{
	if(rules_num >= (MAX_RULES-1) ){
		if(langtype=="zhcn")
    	  alert("出错：规则数超过最大规则数");
    	  else
		alert("The rule number is exceeded "+ MAX_RULES +".");
		return false;
	}

	if(!document.portForward.portForwardEnabled.options.selectedIndex){
		// user choose disable
		return true;
	}

	if(	document.portForward.ip_address.value == "" &&
		document.portForward.fromPort.value == "" &&
		document.portForward.toPort.value   == "" &&
		document.portForward.comment.value  == "")
		return true;

	// exam IP address
    if(document.portForward.ip_address.value == ""){
        if(langtype=="zhcn")
    	  alert("出错：没有设置IP");
    	  else
        alert("Not set a ip address.");
        document.portForward.ip_address.focus();
        return false;
    }

    if(! checkIpAddr(document.portForward.ip_address) ){
        if(langtype=="zhcn")
    	  alert("IP地址格式错误");
    	  else
        alert("IP address format error.");
        document.portForward.ip_address.focus();
        return false;
    }

    if(isAllNum(document.portForward.ip_address.value) == 0){
        if(langtype=="zhcn")
    	  alert("无效IP地址");
    	  else
        alert("Invalid ip address.");
        document.portForward.ip_address.focus();
        return false;
    }

	// exam Port
	if(document.portForward.fromPort.value == ""){
		if(langtype=="zhcn")
    	  alert("请设置端口范围");
    	  else
		alert("Not set a port range.");
		document.portForward.fromPort.focus();
		return false;
	}

	if(isAllNum( document.portForward.fromPort.value ) == 0){
		if(langtype=="zhcn")
    	  alert("无效端口范围");
    	  else
		alert("Invalid port number.");
		document.portForward.fromPort.focus();
		return false;
	}

	d1 = atoi(document.portForward.fromPort.value, 1);
	if(d1 > 65535 || d1 < 1){
		if(langtype=="zhcn")
    	  alert("无效端口号");
    	  else
		alert("Invalid port number!");
		document.portForward.fromPort.focus();
		return false;
	}
	
	if(document.portForward.toPort.value != ""){
		if(isAllNum( document.portForward.toPort.value ) == 0){
			if(langtype=="zhcn")
    	  alert("无效端口号");
    	  else
			alert("Invalid port number.");
			document.portForward.toPort.focus();
			return false;
		}
		d2 = atoi(document.portForward.toPort.value, 1);
		if(d2 > 65535 || d2 < 1){
			if(langtype=="zhcn")
    	  alert("无效端口号");
    	  else
			alert("Invalid port number.");
			document.portForward.toPort.focus();
			return false;
		}
		if(d1 > d2){
			if(langtype=="zhcn")
    	  alert("无效端口范围）");
    	  else
    	  alert("Invalid port range setting.");
			document.portForward.fromPort.focus();
			return false;
		}
   }
   return true;
}


function display_on()
{
  if(window.XMLHttpRequest){ // Mozilla, Firefox, Safari,...
    return "table-row";
  } else if(window.ActiveXObject){ // IE
    return "block";
  }
}

function disableTextField (field)
{
  if(document.all || document.getElementById)
    field.disabled = true;
  else {
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
	var e = document.getElementById("forwardTitle");
	e.innerHTML = _("forward title");
	e = document.getElementById("forwardIntroduction");
	e.innerHTML = _("forward introduction");
	
	e = document.getElementById("forwardVirtualSrv");
	e.innerHTML = _("forward virtual server");
	e = document.getElementById("forwardVirtualSrvSet");
	e.innerHTML = _("forward virtual server setting");
	e = document.getElementById("forwardVirtualSrvDisable");
	e.innerHTML = _("firewall disable");
	e = document.getElementById("forwardVirtualSrvEnable");
	e.innerHTML = _("firewall enable");
	e = document.getElementById("forwardVirtualSrvIPAddr");
	e.innerHTML = _("forward virtual server ipaddr");
	e = document.getElementById("forwardVirtualSrvPortRange");
	e.innerHTML = _("forward virtual server port range");
	e = document.getElementById("forwardVirtualSrvProtocol");
	e.innerHTML = _("firewall protocol");
	e = document.getElementById("forwardVirtualSrvComment");
	e.innerHTML = _("firewall comment");
	e = document.getElementById("forwardVirtualSrvApply");
	e.value = _("firewall apply");
	e = document.getElementById("forwardVirtualSrvReset");
	e.value = _("firewall reset");

	e = document.getElementById("forwardCurrentVirtualSrv");
	e.innerHTML = _("forward current virtual server");
	e = document.getElementById("forwardCurrentVirtualSrvNo");
	e.innerHTML = _("firewall no");
	e = document.getElementById("forwardCurrentVirtualSrvIP");
	e.innerHTML = _("forward virtual server ipaddr");
	e = document.getElementById("forwardCurrentVirtualSrvPort");
	e.innerHTML = _("forward virtual server port range");
	e = document.getElementById("forwardCurrentVirtualSrvProtocol");
	e.innerHTML = _("firewall protocol");
	e = document.getElementById("forwardCurrentVirtualSrvComment");
	e.innerHTML = _("firewall comment");
	e = document.getElementById("forwardCurrentVirtualSrvDel");
	e.value = _("firewall del select");
	e = document.getElementById("forwardCurrentVirtualSrvReset");
	e.value = _("firewall reset");
}

function updateState()
{
	initTranslation();
    if(! rules_num ){
 		disableTextField(document.portForwardDelete.deleteSelPortForward);
 		disableTextField(document.portForwardDelete.reset);
	}else{
        enableTextField(document.portForwardDelete.deleteSelPortForward);
        enableTextField(document.portForwardDelete.reset);
	}

	if(document.portForward.portForwardEnabled.options.selectedIndex == 1){
		enableTextField(document.portForward.ip_address);
		enableTextField(document.portForward.fromPort);
		enableTextField(document.portForward.toPort);
		enableTextField(document.portForward.protocol);
		enableTextField(document.portForward.comment);
	}else{
		disableTextField(document.portForward.ip_address);
		disableTextField(document.portForward.fromPort);
		disableTextField(document.portForward.toPort);
		disableTextField(document.portForward.protocol);
		disableTextField(document.portForward.comment);
	}
}

</script>
</head>


                         <!--     body      -->
<body onload="updateState()">
<table class="body"><tr><td>
<h1 id="forwardTitle">Virtual Server  Settings </h1>
<% checkIfUnderBridgeModeASP(); %>
<p id="forwardIntroduction"> You may setup Virtual Servers to provide services on Internet.</p>
<form method=post name="portForward" action=/goform/portForward>
<table width="400" border="0" cellpadding="2" cellspacing="1">
<tr>
  <td colspan="2" id="forwardVirtualSrv"  class="title">Virtual Server Settings</td>
</tr>
<tr>
	<td id="forwardVirtualSrvSet" class="head">
		Virtual Server Settings
	</td>
	<td class="content">
	<select onChange="updateState()" name="portForwardEnabled" size="1">
	<option value=0 <% getPortForwardEnableASP(0); %> id="forwardVirtualSrvDisable">Disable</option>
    <option value=1 <% getPortForwardEnableASP(1); %> id="forwardVirtualSrvEnable">Enable</option>
    </select>
    </td>
</tr>


<tr>
	<td id="forwardVirtualSrvIPAddr" class="head">
		IP Address
	</td>
	<td class="content">
  		<input type="text" size="16" name="ip_address">
	</td>
</tr>

<tr>
	<td id="forwardVirtualSrvPortRange" class="head">
		Port Range
	</td>
	<td class="content">
  		<input type="text" size="5" name="fromPort">-<input type="text" size="5" name="toPort"> &nbsp;&nbsp;
	</td>
</tr>

<tr>
	<td id="forwardVirtualSrvProtocol" class="head">
		Protocol
	</td>
	<td class="content">
		<select name="protocol">
   		<option select value="TCP&UDP">TCP&UDP</option>
		<option value="TCP">TCP</option>
   		<option value="UDP">UDP</option>
   		</select>&nbsp;&nbsp;
	</td>
</tr>

<tr>
	<td id="forwardVirtualSrvComment" class="head">
		Comment
	</td>
	<td  class="content">
		<input type="text" name="comment" size="16" maxlength="32">
	</td>
</tr>
<tr>
	<td colspan=2  class="content">
		<input type="submit" value="Apply" id="forwardVirtualSrvApply" name="addFilterPort" onClick="return formCheck()"> &nbsp;&nbsp;
		<input type="reset" value="Reset" id="forwardVirtualSrvReset" name="reset">
	</td>
</tr>
</table>
<!--
<script>
    document.write("(The maximum rule count is "+ MAX_RULES +".)");
</script>
-->
</form>

<!--  delete rules -->
<form action=/goform/portForwardDelete method=POST name="portForwardDelete">

<table width="400" border="1" cellpadding="2" cellspacing="1">	
	<tr>
		<td colspan="5" id="forwardCurrentVirtualSrv">Current Virtual Servers in system: </td>
	</tr>

	<tr>
		<td id="forwardCurrentVirtualSrvNo"> No.</td>
		<td align=center id="forwardCurrentVirtualSrvIP"> IP Address</td>
		<td align=center id="forwardCurrentVirtualSrvPort"> Port Range</td>
		<td align=center id="forwardCurrentVirtualSrvProtocol"> Protocol</td>
		<td align=center id="forwardCurrentVirtualSrvComment"> Comment</td>
	</tr>

	<% showPortForwardRulesASP(); %>
</table>
<br>

<input type="submit" value="Delete Selected" id="forwardCurrentVirtualSrvDel" name="deleteSelPortForward" onClick="return deleteClick()">&nbsp;&nbsp;
<input type="reset" value="Reset" id="forwardCurrentVirtualSrvReset" name="reset">
</form>

</td></tr></table>
</body>
</html>
