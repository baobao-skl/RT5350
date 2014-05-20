<html>
<head>
<title>System Settings</title>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("firewall");
var langtype = "<% getLangType(); %>";
function initTranslation()
{
	var e = document.getElementById("sysfwTitle");
	e.innerHTML = _("sysfw title");
	e = document.getElementById("sysfwIntroduction");
	e.innerHTML = _("sysfw introduction");
	//e = document.getElementById("sysfwRemoteManagementTitle");
	//e.innerHTML = _("sysfw remote management title");
	e = document.getElementById("sysfwRemoteManagementHead");
	e.innerHTML = _("sysfw remote management head");
	e = document.getElementById("sysfwRemoteManagementEnable");
	e.innerHTML = _("sysfw allow");
	e = document.getElementById("sysfwRemoteManagementDisable");
	e.innerHTML = _("sysfw deny");
		e = document.getElementById("sysfwRemoteAccessPort");
	e.innerHTML = _("sysfw remote access port");
	//e = document.getElementById("sysfwPingFrmWANFilterTitle");
	//e.innerHTML = _("sysfw wanping title");
	e = document.getElementById("sysfwPingFrmWANFilterHead");
	e.innerHTML = _("sysfw wanping head");
	e = document.getElementById("sysfwPingFrmWANFilterEnable");
	e.innerHTML = _("firewall enable");
	e = document.getElementById("sysfwPingFrmWANFilterDisable");
	e.innerHTML = _("firewall disable");
	//e = document.getElementById("sysfwSPIFWTitle");
	//e.innerHTML = _("sysfw spi title");
	e = document.getElementById("sysfwSPIFWHead");
	e.innerHTML = _("sysfw spi head");
	e = document.getElementById("sysfwSPIFWEnable");
	e.innerHTML = _("firewall enable");
	e = document.getElementById("sysfwSPIFWDisable");
	e.innerHTML = _("firewall disable");

	e = document.getElementById("sysfwApply");
	e.value = _("sysfw apply");
	e = document.getElementById("sysfwReset");
	e.value = _("sysfw reset");
}

function updateState()
{
	initTranslation();

	var rm = "<% getCfgGeneral(1, "RemoteManagement"); %>";
	var wpf = "<% getCfgGeneral(1, "WANPingFilter"); %>";
	var spi = "<% getCfgGeneral(1, "SPIFWEnabled"); %>";
	if(rm == "1")
	{
		document.websSysFirewall.remoteManagementEnabled.options.selectedIndex = 1;
		document.getElementById("sysfwPingFrmWANFilterTitleTr").style.display = "block";
	}		
	else
	{
		document.websSysFirewall.remoteManagementEnabled.options.selectedIndex = 0;
		document.getElementById("sysfwPingFrmWANFilterTitleTr").style.display = "none";
	}
	if(wpf == "1")
		document.websSysFirewall.pingFrmWANFilterEnabled.options.selectedIndex = 1;
	else
		document.websSysFirewall.pingFrmWANFilterEnabled.options.selectedIndex = 0;
	if(spi == "1")
		document.websSysFirewall.spiFWEnabled.options.selectedIndex = 1;
	else
		document.websSysFirewall.spiFWEnabled.options.selectedIndex = 0;
}

function changeWANFilter()
{
	var WAN=document.getElementById("remoteManagementEnabled").value;
	if(WAN==0){
		document.getElementById("sysfwPingFrmWANFilterTitleTr").style.display = "none";
	}else{
		document.getElementById("sysfwPingFrmWANFilterTitleTr").style.display = "block";
	}
}
</script>
</head>


<!--     body      -->
<body onload="updateState()">
<table class="body"><tr><td>
<h1 id="sysfwTitle"> System Firewall Settings </h1>
<% checkIfUnderBridgeModeASP(); %>
<p id="sysfwIntroduction"> You may configure the system firewall to protect itself from attacking.</p>

<form method=post name="websSysFirewall" action=/goform/websSysFirewall>
<table width="400" border="0" cellpadding="2" cellspacing="1">
<!--
<tr>
	<td colspan="2" id="sysfwRemoteManagementTitle"  class="borderStyle1">Remote management</td>
</tr>
-->
<tr>
	<td id="sysfwRemoteManagementHead"  class="head">
		Remote management (via WAN)
	</td>
	<td  class="content">
		<select name="remoteManagementEnabled" size="1" onChange="changeWANFilter()">
	<option value=0 id="sysfwRemoteManagementDisable">Disable</option>
	<option value=1 id="sysfwRemoteManagementEnable">Enable</option>
	</select>
	</td>
</tr>
<tr id="sysfwPingFrmWANFilterTitleTr" style="display = 'none';">
	<td id="sysfwRemoteAccessPort"  class="head">
		Remote Access Port
	</td>
	<td  class="content">
		<input typ="text" size="18" name="sysfwRemotePortValue" value=<% getRemoteAccessPort(); %> >
	</td>
</tr>
<tr>
	<td id="sysfwPingFrmWANFilterHead"  class="head">
	Ping form WAN Filter
	</td>
	<td  class="content">
	<select name="pingFrmWANFilterEnabled" size="1">
	<option value=0 id="sysfwPingFrmWANFilterDisable">Disable</option>
	<option value=1 id="sysfwPingFrmWANFilterEnable">Enable</option>
	</select>
	</td>
</tr>
<!--
<tr>
	<td colspan="2" id="sysfwSPIFWTitle"  class="borderStyle1">Stateful Packet Inspection (SPI) Firewall</td>
</tr>
-->
<tr>
	<td id="sysfwSPIFWHead" class="head">
	SPI Firewall
	</td>
	<td  class="content">
	<select name="spiFWEnabled" size="1">
	<option value=0 id="sysfwSPIFWDisable">Disable</option>
	<option value=1 id="sysfwSPIFWEnable" selected>Enable</option>
	</select>
	</td>
</tr>
<tr>
	<td colspan=2  class="content">
		<input type="submit" value="Apply" id="sysfwApply" name="sysfwApply" > &nbsp;&nbsp;
		<input type="reset" value="Reset" id="sysfwReset" name="sysfwReset">
	</td>
</tr>
</table>
	
</form>


</tr></td></table>
</body>
</html>
