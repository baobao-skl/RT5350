<head>
<title>VPN Setup</title>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");


function openWindow(url, windowName, wide, high) {
	if (document.all)
		var xMax = screen.width, yMax = screen.height;
	else if (document.layers)
		var xMax = window.outerWidth, yMax = window.outerHeight;
	else
	   var xMax = 640, yMax=500;
	var xOffset = (xMax - wide)/2;
	var yOffset = (yMax - high)/3;

	var settings = 'width='+wide+',height='+high+',screenX='+xOffset+',screenY='+yOffset+',top='+yOffset+',left='+xOffset+', resizable=yes, toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes';

	return window.open( url, windowName, settings );
}

function showRsaKey(url) 
{
	openWindow(url, 'VPNLog', 700, 300);
}

function deleteClick()
{
  if ( !confirm('是否删除选中的选项?') ) {
	return false;
  }
  else
	return true;
}

function initTranslation()
{
	var e = document.getElementById("VPNTitle");
	e.innerHTML = _("vpn title");
	e = document.getElementById("VPNIntroduction");
	e.innerHTML = _("vpn introduction");
	//e = document.getElementById("VPNRSAKey");
	//e.innerHTML = _("vpn rsa key");
	e = document.getElementById("VPNGenerateRSAKey");
	e.value = _("generate rsa key");
	e = document.getElementById("VPNShowRSAKey");
	e.value = _("show rsa key");
	e = document.getElementById("VPNCurrentSrv");
	e.innerHTML = _("vpn current srv");
	e = document.getElementById("VPNSrvNo");
	e.innerHTML = _("vpn no");
	e = document.getElementById("VPNName");
	e.innerHTML = _("vpn conn name");
	e = document.getElementById("VPNLocalAddr");
	e.innerHTML = _("vpn local addr");
	e = document.getElementById("VPNRemoteAddr");
	e.innerHTML = _("vpn remote addr");
	e = document.getElementById("VPNRemoteGW");
	e.innerHTML = _("vpn remote gateway");
	e = document.getElementById("VPNConnStatus");
	e.innerHTML = _("vpn status");
	e = document.getElementById("VPNSrvDel");
	e.value = _("vpn delete");
	e = document.getElementById("VPNSrvReset");
	e.value = _("vpn reset");
	e = document.getElementById("VPNSrvEdit");
	e.value = _("vpn edit");
}

function updateState()
{
	initTranslation(); 	
}

</SCRIPT>
</head>

<body onload="updateState()">
<table class="body"><tr><td>
<h1 id="VPNTitle">VPN Settings </h1>
<p id="VPNIntroduction"> You may configure VPN parameter here.</p>

<form action=/goform/VPNGenRsaKey method=POST name="vpnrsakey">
<table width="600" border="0" cellpadding="2" cellspacing="1">
	<tr>
  	<td colspan="2" id="VPNRSAKey" class="title">RSA</td>
	</tr>
	<td><b><input type="submit" value="generate rsa key" id="VPNGenerateRSAKey" name="rsakey"></b></td>
	<td><b><input type="button" value="show rsa key" id="VPNShowRSAKey" onClick="showRsaKey('rsakey.asp')" name="showKey"></b></td>
</table>		
</form>

<!--  delete rules -->
<form action=/goform/ipsecDelete method=POST name="ipsecVPNDelete">

<table width="600" border="1" cellpadding="2" cellspacing="1">	
	<tr>
		<td colspan="7" id="VPNCurrentSrv" class="title">Current VPN servers in system: </td>
	</tr>

	<tr>
		<td><p><b></b></p></td>
		<td id="VPNSrvNo"> No.</td>
		<td align=center id="VPNName">Local Address</td>
		<td align=center id="VPNLocalAddr">Local Address</td>
		<td align=center id="VPNRemoteAddr">Remote Address</td>
		<td align=center id="VPNRemoteGW">Remote Gateway</td>
		<td align=center id="VPNConnStatus">Status</td>
	</tr>

	<% ipsecRulesASP(); %>
</table>
<br>

<input type="submit" value="Edit" id="VPNSrvEdit" name="editVpn" >&nbsp;&nbsp;
<input type="submit" value="Delete Selected" id="VPNSrvDel" name="delete" onClick="return deleteClick()">&nbsp;&nbsp;
<input type="reset" value="Reset" id="VPNSrvReset" name="reset">
</form>

</td></tr></table>
</body>
</html>
