<!-- Copyright 2004, Ralink Technology Corporation All Rights Reserved. -->
<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<title>DHCP Client List</title>

<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("internet");
var langtype = "<% getLangType(); %>";
function initValue()
{
	var e = document.getElementById("dTitle");
	e.innerHTML = _("dhcp title");
	e = document.getElementById("dIntroduction");
	e.innerHTML = _("dhcp introduction");
	e = document.getElementById("dClients");
	e.innerHTML = _("dhcp clients");
	e = document.getElementById("dHostname");
	e.innerHTML = _("inet hostname");
	e = document.getElementById("dMac");
	e.innerHTML = _("inet mac");
	e = document.getElementById("dIp");
	e.innerHTML = _("inet ip");
	e = document.getElementById("dExpr");
	e.innerHTML = _("dhcp expire");
}
</script>
</head>


<body onLoad="initValue()">
<table class="body"><tr><td>

<h1 id="dTitle"></h1>
<p id="dIntroduction"></p>

<table width="540" border="0" cellspacing="1" cellpadding="3">
  <tr> 
    <td class="title" colspan="4" id="dClients">DHCP Clients</td>
  </tr>
  <tr>
    <td  id="dHostname" class="head">Hostname</td>
    <td  id="dMac" class="head">MAC Address</td>
    <td  id="dIp" class="head">IP Address</td>
    <td  id="dExpr" class="head">Expires in</td>
  </tr>
  <% getDhcpCliList(); %>
</table>

</td></tr></table>
</body>
</html>


