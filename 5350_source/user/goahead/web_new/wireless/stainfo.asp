<!-- Copyright 2004, Ralink Technology Corporation All Rights Reserved. -->
<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="/lang/b28n.js"></script>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<title>Station List</title>

<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("wireless");
var langtype = "<% getLangType(); %>";
function initTranslation()
{
	var e = document.getElementById("stalistTitle");
	e.innerHTML = _("stalist title");
	e = document.getElementById("stalistIntroduction");
	e.innerHTML = _("stalist introduction");
	e = document.getElementById("stalistWirelessNet");
	e.innerHTML = _("stalist wireless network");
	e = document.getElementById("stalistMacAddr");
	e.innerHTML = _("stalist macaddr");
}

function PageInit()
{
	initTranslation();
}
</script>
</head>


<body onLoad="PageInit()">
<table class="body"><tr><td>

<h1 id="stalistTitle">Station List</h1>
<p id="stalistIntroduction"> You could monitor stations which associated to this AP here. </p>

<table width="540" border="0" cellspacing="1" cellpadding="3" bordercolor="#9BABBD" >
  <tr> 
    <td colspan="8" id="stalistWirelessNet" class="title">Wireless Network</td>
  </tr>
  <tr>
    <td id="stalistMacAddr" class="head">MAC Address</td>
    <td class="head">Aid</td>
    <td class="head">PSM</td>
    <td class="head">MimoPS</td>
    <td class="head" >MCS</td>
    <td class="head" >BW</td>
    <td class="head">SGI</td>
    <td class="head" >STBC</td>
  </tr>
  <% getWlanStaInfo(); %>
</table>

</td></tr></table>
</body>
</html>

