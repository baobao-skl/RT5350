<html>
<head>
<title>Access Point Status</title>
<link rel="stylesheet" href="../style/normal_ws.css" type="text/css">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javascript" src="/lang/b28n.js"></script>
<META HTTP-EQUIV="refresh" CONTENT="5; URL=./status.asp">
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");
var langtype = "<% getLangType(); %>";
var wanMode = '<% getCfgGeneral(1, "wanConnectionMode"); %>';

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

function showOpMode()
{
	var opmode = 1* <% getCfgZero(1, "OperationMode"); %>;
	if (opmode == 0)
		document.write("Bridge Mode");
	else if (opmode == 1)
		document.write("Gateway Mode");
	else if (opmode == 2)
		document.write("Ethernet Converter Mode");
	else if (opmode == 3)
		document.write("AP Client Mode");
	else
		document.write("Unknown");
}

function showPortStatus()
{
	var str = "<% getPortStatus(); %>";
	var all = new Array();

	if(str == "-1"){
		document.write("not support");
		return ;
	}

	all = str.split(",");
	for(i=0; i< all.length-1; i+=3){
		document.write("<td>");
		if(all[i] == "1"){
			if(all[i+1] == "10")
				document.write("<img src=/graphics/10.gif> ");
			else if(all[i+1] == "100")
				document.write("<img src=/graphics/100.gif> ");

//			if(all[i+2] == "F")
//				document.write("Full ");
//			else(all[i+2] == "H")
//				document.write("Half ");
		}else if(all[i] == "0"){
				document.write("<img src=/graphics/empty.gif> ");
		}
		document.write("</td>");
	}
}

function initTranslation()
{
	var e = document.getElementById("statusTitle");
	e.innerHTML = _("status title");
	e = document.getElementById("statusIntroduction");
	e.innerHTML = _("status introduction");
	
	e = document.getElementById("statusSysInfo");
	e.innerHTML = _("status system information");
	e = document.getElementById("statusSDKVersion");
	e.innerHTML = _("status sdk version");
	e = document.getElementById("statusSysUpTime");
	e.innerHTML = _("status system up time");
	//e = document.getElementById("statusOPMode");
	//e.innerHTML = _("status operate mode");

	e = document.getElementById("statusInternetConfig");
	e.innerHTML = _("status internet config");
	e = document.getElementById("statusConnectedType");
	e.innerHTML = _("status connect type");
	e = document.getElementById("dial3GStatusName");
	e.innerHTML = _("3G Dial Status");
	e = document.getElementById("dial3GStatusName1");
	e.innerHTML = _("3G Dial Status1");
	e = document.getElementById("dial3GStatusName2");
	e.innerHTML = _("3G Dial Status2");
	e = document.getElementById("dial3GStatusName3");
	e.innerHTML = _("3G Dial Status3");
	e = document.getElementById("dial3GStatusName4");
	e.innerHTML = _("3G Dial Status4");
	e = document.getElementById("dial3GStatusName5");
	e.innerHTML = _("3G Dial Status5");
	e = document.getElementById("dial3GStatusName6");
	e.innerHTML = _("3G Dial Status6");
	e = document.getElementById("dial3GStatusValueUP");
	e.innerHTML = _("3G Dial UP");
	e = document.getElementById("dial3GSimCardFail");
	e.innerHTML = _("3G Dial NO SIM");
	e = document.getElementById("dial3gPinFail");
	e.innerHTML = _("3G Pin Fail");
	e = document.getElementById("dial3gPinSuccessful");
	e.innerHTML = _("3G Pin Successful");
	e = document.getElementById("dial3gLinking");
	e.innerHTML = _("3G Dial Linking");
	e = document.getElementById("dial3gDialDown");
	e.innerHTML = _("3G Dial DOWN");
	e = document.getElementById("dial3gSignalLength");
	e.innerHTML = _("3G Dial Signal");
	e = document.getElementById("statusWANIPAddr");
	e.innerHTML = _("status wan ipaddr");
	e = document.getElementById("statusSubnetMask");
	e.innerHTML = _("status subnet mask");
	e = document.getElementById("statusDefaultGW");
	e.innerHTML = _("status default gateway");
	e = document.getElementById("statusPrimaryDNS");
	e.innerHTML = _("status primary dns");
	e = document.getElementById("statusSecondaryDNS");
	e.innerHTML = _("status secondary dns");
	e = document.getElementById("statusWANMAC");
	e.innerHTML = _("status mac");
	e = document.getElementById("dial3gISPProvider");
	e.innerHTML = _("3G Dial ISP Provider");
	
	
	e = document.getElementById("3Gusbmodeminfotitle");
	e.innerHTML = _("3G USB Modem Info Title");
	e = document.getElementById("3Gusbmodemdetected");
	e.innerHTML = _("3G USB Modem Detected");
	e = document.getElementById("3Gusbmodemnotdetected");
	e.innerHTML = _("3G USB Modem Not Detected");
	e = document.getElementById("3Gusbmodemstatus");
	e.innerHTML = _("3G USB Modem Status");
	e = document.getElementById("3Gusbmodemstatus1");
	e.innerHTML = _("3G USB Modem Status1");
	e = document.getElementById("3Gusbmodemstatus2");
	e.innerHTML = _("3G USB Modem Status2");
	e = document.getElementById("3Gusbmodeminfo");
	e.innerHTML = _("3G USB Modem Info");
	e = document.getElementById("3Gusbmodemfirmware");
	e.innerHTML = _("3G USB Modem Firmware");
	e = document.getElementById("3Gsimstatus");
	e.innerHTML = _("3G Sim Status");
	e = document.getElementById("3Gsimstatus1");
	e.innerHTML = _("3G Sim Status1");
	e = document.getElementById("3GsimstatusInsert");
	e.innerHTML = _("3G Sim Status Insert");
	
	e = document.getElementById("statusLocalNet");
	e.innerHTML = _("status local network");
	e = document.getElementById("statusLANIPAddr");
	e.innerHTML = _("status lan ipaddr");
	e = document.getElementById("statusLocalNetmask");
	e.innerHTML = _("status local netmask");
	e = document.getElementById("statusLANMAC");
	e.innerHTML = _("status mac");
}

function PageInit()
{
	var ethtoolb = "<% getETHTOOLBuilt(); %>";
	initTranslation();

	//if (ethtoolb == "1")
	//{
		//document.getElementById("statusEthPortStatus").style.visibility = "visible";
		//document.getElementById("statusEthPortStatus").style.display = style_display_on();
		//document.getElementById("div_ethtool").style.visibility = "visible";
		//document.getElementById("div_ethtool").style.display = style_display_on();
	//}
	//else
	//{
		//document.getElementById("statusEthPortStatus").style.visibility = "hidden";
		//document.getElementById("statusEthPortStatus").style.display = "none";
		//document.getElementById("div_ethtool").style.visibility = "hidden";
		//document.getElementById("div_ethtool").style.display = "none";
	//}
	
	if(wanMode=="3G")
	{
		
		document.getElementById("3GdialstatusRowUp").style.visibility = "hidden";
		document.getElementById("3GdialstatusRowUp").style.display = "none";			
		document.getElementById("3GdialstatusRowNull").style.visibility = "hidden";
		document.getElementById("3GdialstatusRowNull").style.display = "none";
		document.getElementById("3GdialstatusRowNOSIM").style.visibility = "hidden";
		document.getElementById("3GdialstatusRowNOSIM").style.display = "none";
		document.getElementById("3GdialstatusRowPinFail").style.visibility = "hidden";
		document.getElementById("3GdialstatusRowPinFail").style.display = "none";
		document.getElementById("3GdialstatusRowPinSuccessful").style.visibility = "hidden";
		document.getElementById("3GdialstatusRowPinSuccessful").style.display = "none";
		document.getElementById("3GdialstatusRowLinking").style.visibility = "hidden";
		document.getElementById("3GdialstatusRowLinking").style.display = "none";
		document.getElementById("3GdialstatusRowDown").style.visibility = "hidden";
		document.getElementById("3GdialstatusRowDown").style.display = "none";
					
		var dialstatus = "<% getDial3gStatus(); %>";
		if(dialstatus=="UP")
		{
			document.getElementById("3GdialstatusRowUp").style.visibility = "visible";
			document.getElementById("3GdialstatusRowUp").style.display = style_display_on();
			
			document.getElementById("3GdialstatusRowNull").style.visibility = "hidden";
			document.getElementById("3GdialstatusRowNull").style.display = "none";
			document.getElementById("3GdialstatusRowNOSIM").style.visibility = "hidden";
			document.getElementById("3GdialstatusRowNOSIM").style.display = "none";
			document.getElementById("3GdialstatusRowPinFail").style.visibility = "hidden";
			document.getElementById("3GdialstatusRowPinFail").style.display = "none";
			document.getElementById("3GdialstatusRowPinSuccessful").style.visibility = "hidden";
			document.getElementById("3GdialstatusRowPinSuccessful").style.display = "none";
			document.getElementById("3GdialstatusRowLinking").style.visibility = "hidden";
			document.getElementById("3GdialstatusRowLinking").style.display = "none";
			document.getElementById("3GdialstatusRowDown").style.visibility = "hidden";
			document.getElementById("3GdialstatusRowDown").style.display = "none";
		}
		else
		{
			var dial3gsimcard = "<% getDial3gSimCard(); %>";
			if(dial3gsimcard=="")
			{
				document.getElementById("3GdialstatusRowNull").style.visibility = "visible";
				document.getElementById("3GdialstatusRowNull").style.display = style_display_on();
				
				document.getElementById("3GdialstatusRowUp").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowUp").style.display = "none";
				document.getElementById("3GdialstatusRowNOSIM").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowNOSIM").style.display = "none";
				document.getElementById("3GdialstatusRowPinFail").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowPinFail").style.display ="none";
				document.getElementById("3GdialstatusRowPinSuccessful").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowPinSuccessful").style.display = "none";
				document.getElementById("3GdialstatusRowLinking").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowLinking").style.display = "none";
				document.getElementById("3GdialstatusRowDown").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowDown").style.display = "none";
			}
			else if(dial3gsimcard=="failure")
			{
				document.getElementById("3GdialstatusRowNOSIM").style.visibility = "visible";
				document.getElementById("3GdialstatusRowNOSIM").style.display = style_display_on();
				
				document.getElementById("3GdialstatusRowUp").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowUp").style.display = "none";
				document.getElementById("3GdialstatusRowPinFail").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowPinFail").style.display = "none";
				document.getElementById("3GdialstatusRowPinSuccessful").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowPinSuccessful").style.display = "none";
				document.getElementById("3GdialstatusRowLinking").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowLinking").style.display = "none";
				document.getElementById("3GdialstatusRowDown").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowDown").style.display = "none";
				document.getElementById("3GdialstatusRowNull").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowNull").style.display = "none";
			}
			else if (dial3gsimcard == "SIMPINFail")
			{
				document.getElementById("3GdialstatusRowPinFail").style.visibility = "visible";
				document.getElementById("3GdialstatusRowPinFail").style.display = style_display_on();
				
				document.getElementById("3GdialstatusRowUp").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowUp").style.display = "none";
				document.getElementById("3GdialstatusRowNull").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowNull").style.display = "none";
				document.getElementById("3GdialstatusRowPinSuccessful").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowPinSuccessful").style.display = "none";
				document.getElementById("3GdialstatusRowLinking").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowLinking").style.display ="none";
				document.getElementById("3GdialstatusRowDown").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowDown").style.display = "none";
				document.getElementById("3GdialstatusRowNull").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowNull").style.display = "none";
			}
			else if (dial3gsimcard == "successful")
			{
				document.getElementById("3GdialstatusRowPinSuccessful").style.visibility = "visible";
				document.getElementById("3GdialstatusRowPinSuccessful").style.display = style_display_on();
				
				document.getElementById("3GdialstatusRowPinFail").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowPinFail").style.display = "none";
				document.getElementById("3GdialstatusRowUp").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowUp").style.display = "none";
				document.getElementById("3GdialstatusRowNull").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowNull").style.display ="none";
				document.getElementById("3GdialstatusRowLinking").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowLinking").style.display = "none";
				document.getElementById("3GdialstatusRowDown").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowDown").style.display = "none";
				document.getElementById("3GdialstatusRowNull").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowNull").style.display = "none";
			}
			
			var pppdflag = "<% getDial3gPPPDFlag(); %>";
			if(pppdflag=="1")
			{
				document.getElementById("3GdialstatusRowLinking").style.visibility = "visible";
				document.getElementById("3GdialstatusRowLinking").style.display = style_display_on();
				
				document.getElementById("3GdialstatusRowDown").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowDown").style.display = "none";
				document.getElementById("3GdialstatusRowNull").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowNull").style.display = "none";
				document.getElementById("3GdialstatusRowPinSuccessful").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowPinSuccessful").style.display = "none";
				document.getElementById("3GdialstatusRowPinFail").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowPinFail").style.display ="none";
				document.getElementById("3GdialstatusRowUp").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowUp").style.display = "none";
				document.getElementById("3GdialstatusRowNull").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowNull").style.display = "none";
			}
			else
			{
				document.getElementById("3GdialstatusRowDown").style.visibility = "visible";
				document.getElementById("3GdialstatusRowDown").style.display = style_display_on();
				
				document.getElementById("3GdialstatusRowLinking").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowLinking").style.display = "none";
				document.getElementById("3GdialstatusRowNull").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowNull").style.display = "none";
				document.getElementById("3GdialstatusRowPinSuccessful").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowPinSuccessful").style.display = "none";
				document.getElementById("3GdialstatusRowPinFail").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowPinFail").style.display = "none";
				document.getElementById("3GdialstatusRowUp").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowUp").style.display = "none";
				document.getElementById("3GdialstatusRowNull").style.visibility = "hidden";
				document.getElementById("3GdialstatusRowNull").style.display = "none";
			}
		}
		document.getElementById("3GdialSignalRow").style.visibility = "visible";
		document.getElementById("3GdialSignalRow").style.display = style_display_on();
		document.getElementById("3GdialispproviderRow").style.visibility = "visible";
		document.getElementById("3GdialispproviderRow").style.display = style_display_on();
		document.getElementById("USBmodeminfoRow").style.visibility = "visible";
		document.getElementById("USBmodeminfoRow").style.display = style_display_on();
		var info = "<% getDial3gUsbModemInfo(); %>";
		var usbflag = "<% getDial3gUsbModemFlag(); %>";
		if(usbflag=="yes")
		{
			if(info!="")
			{				
				document.getElementById("USBmodemstatusRowinfo").style.visibility = "visible";
				document.getElementById("USBmodemstatusRowinfo").style.display = style_display_on();
				
				document.getElementById("USBmodemstatusRowdetected").style.visibility = "hidden";
				document.getElementById("USBmodemstatusRowdetected").style.display = "none";
				
				document.getElementById("USBmodemstatusRownotdetected").style.visibility = "hidden";
				document.getElementById("USBmodemstatusRownotdetected").style.display = "none";
			
			}
			else
			{				
				document.getElementById("USBmodemstatusRowdetected").style.visibility = "visible";
				document.getElementById("USBmodemstatusRowdetected").style.display = style_display_on();
				
				document.getElementById("USBmodemstatusRowinfo").style.visibility = "hidden";
				document.getElementById("USBmodemstatusRowinfo").style.display = "none";
				
				document.getElementById("USBmodemstatusRownotdetected").style.visibility = "hidden";
				document.getElementById("USBmodemstatusRownotdetected").style.display = "none";
			}
		}
		else
		{
			document.getElementById("USBmodemstatusRownotdetected").style.visibility = "visible";
			document.getElementById("USBmodemstatusRownotdetected").style.display = style_display_on();
			
			document.getElementById("USBmodemstatusRowdetected").style.visibility = "hidden";
			document.getElementById("USBmodemstatusRowdetected").style.display = "none";
			document.getElementById("USBmodemstatusRowinfo").style.visibility = "hidden";
			document.getElementById("USBmodemstatusRowinfo").style.display = "none";			
		}
		document.getElementById("USBmodemfirmwareRow").style.visibility = "visible";
		document.getElementById("USBmodemfirmwareRow").style.display = style_display_on();
		var cimivalue="<% getDial3gCimiValue(); %>";
		if(cimivalue=="")
		{
			document.getElementById("USBsimstatusRowNull").style.visibility = "visible";
			document.getElementById("USBsimstatusRowNull").style.display = style_display_on();
			
			document.getElementById("USBsimstatusRowInsert").style.visibility = "hidden";
			document.getElementById("USBsimstatusRowInsert").style.display = "none";
		}
		else
		{
			document.getElementById("USBsimstatusRowInsert").style.visibility = "visible";
			document.getElementById("USBsimstatusRowInsert").style.display = style_display_on();
			
			document.getElementById("USBsimstatusRowNull").style.visibility = "hidden";
			document.getElementById("USBsimstatusRowNull").style.display = "none";
		}
	}
	else
	{
		document.getElementById("3GdialstatusRowNull").style.visibility = "hidden";
		document.getElementById("3GdialstatusRowNull").style.display = "none";
		document.getElementById("3GdialstatusRowUp").style.visibility = "hidden";
		document.getElementById("3GdialstatusRowUp").style.display = "none";
		document.getElementById("3GdialstatusRowNOSIM").style.visibility = "hidden";
		document.getElementById("3GdialstatusRowNOSIM").style.display = "none";
		document.getElementById("3GdialstatusRowPinFail").style.visibility = "hidden";
		document.getElementById("3GdialstatusRowPinFail").style.display = "none";
		document.getElementById("3GdialstatusRowPinSuccessful").style.visibility = "hidden";
		document.getElementById("3GdialstatusRowPinSuccessful").style.display = "none";
		document.getElementById("3GdialstatusRowLinking").style.visibility = "hidden";
		document.getElementById("3GdialstatusRowLinking").style.display = "none";
		document.getElementById("3GdialstatusRowDown").style.visibility = "hidden";
		document.getElementById("3GdialstatusRowDown").style.display = "none";
		document.getElementById("3GdialSignalRow").style.visibility = "hidden";
		document.getElementById("3GdialSignalRow").style.display = "none";
		document.getElementById("3GdialispproviderRow").style.visibility = "hidden";
		document.getElementById("3GdialispproviderRow").style.display = "none";
		document.getElementById("USBmodeminfoRow").style.visibility = "hidden";
		document.getElementById("USBmodeminfoRow").style.display ="none";
		document.getElementById("USBmodemfirmwareRow").style.visibility = "hidden";
		document.getElementById("USBmodemfirmwareRow").style.display = "none";
		document.getElementById("USBsimstatusRowNull").style.visibility = "hidden";
		document.getElementById("USBsimstatusRowNull").style.display = "none";
		document.getElementById("USBsimstatusRowInsert").style.visibility = "hidden";
		document.getElementById("USBsimstatusRowInsert").style.display = "none";
		document.getElementById("USBmodemstatusRowdetected").style.visibility = "hidden";
		document.getElementById("USBmodemstatusRowdetected").style.display = "none";
		document.getElementById("USBmodemstatusRownotdetected").style.visibility = "hidden";
		document.getElementById("USBmodemstatusRownotdetected").style.display = "none";
		document.getElementById("USBmodemstatusRowinfo").style.visibility = "hidden";
		document.getElementById("USBmodemstatusRowinfo").style.display = "none";
	}	
}
</script>
</head>

<body onload="PageInit()">
<table class="body"><tr><td>
<H1 id="statusTitle">Access Point Status</H1>
<P id="statusIntroduction">Let's take a look at the status. </P>

<table width="95%" border="0" cellpadding="3" cellspacing="0">
<!-- ================= System Info ================= -->
<tr>
 <td class="title" colspan="2" id="statusSysInfo">System Info</td>
</tr>
<tr>
  <td id="statusSDKVersion" width="55%" class="head">Firmware Version</td>
  <td class="content"><% getFirmwareVersion(); %></td>
</tr>
<tr>
  <td id="statusSysUpTime" class="head">System Up Time</td>
  <td class="content"><% getSysUptime(); %></td>
</tr>

<!--
<tr>
  <td id="statusOPMode">&nbsp;&nbsp;&nbsp;&nbsp;Operation Mode</td>
  <td><script type="text/javascript">showOpMode();</script></td>
</tr>
-->

<!-- ================= Internet Configurations ================= -->
<tr>
   <td class="title" colspan="2" id="statusInternetConfig">Internet Configurations</td>
</tr>
<tr>
  <td class="head" id="statusConnectedType">Connected Type</td>
  <td class="content"><% getCfgGeneral(1, "wanConnectionMode"); %> </td>
</tr>

<tr id="3GdialstatusRowNull">
<td id="dial3GStatusName" class="head">3G Dial Status</td>
<td class="content">&nbsp;</td>
</tr>
<tr id="3GdialstatusRowUp">
<td id="dial3GStatusName1" class="head">3G Dial Status</td>
<td id="dial3GStatusValueUP" class="content">3G Dial UP</td>
</tr>
<tr id="3GdialstatusRowNOSIM">
<td id="dial3GStatusName2" class="head">3G Dial Status</td>
<td id="dial3GSimCardFail" class="content">3G Dial NO SIM</td>
</tr>
<tr id="3GdialstatusRowPinFail">
<td id="dial3GStatusName3" class="head">3G Dial Status</td>
<td id="dial3gPinFail" class="content">3G Pin Fail"</td>
</tr>
<tr id="3GdialstatusRowPinSuccessful">
<td id="dial3GStatusName4" class="head">3G Dial Status</td>
<td id="dial3gPinSuccessful" class="content">3G Pin Successful"</td>
</tr>
<tr id="3GdialstatusRowLinking">
<td id="dial3GStatusName5" class="head">3G Dial Status</td>
<td id="dial3gLinking" class="content">3G Dial Linking"</td>
</tr>
<tr id="3GdialstatusRowDown">
<td id="dial3GStatusName6" class="head">3G Dial Status</td>
<td id="dial3gDialDown" class="content">3G Dial DOWN"</td>
</tr>

<tr id="3GdialSignalRow">
<td id="dial3gSignalLength" class="head">3G Dial Signal</td>
<td class="content"><% getDial3gSignalLength(); %>%</td>
</tr>

<tr id="3GdialispproviderRow">
<td id="dial3gISPProvider" class="head">3G ISP Provider</td>
<td class="content"><% getDial3gISPProvider(); %></td>
</tr>


<tr>
  <td id="statusWANIPAddr" class="head">WAN IP Address</td>
  <td class="content"><% getWanIp(); %></td>
</tr>
<tr>
  <td id="statusSubnetMask" class="head">Subnet Mask</td>
  <td class="content"><% getWanNetmask(); %></td>
</tr>
<tr>
  <td id="statusDefaultGW" class="head">Default Gateway</td>
  <td class="content"><% getWanGateway(); %></td>
</tr>
<tr>
  <td id="statusPrimaryDNS" class="head">Primary Domain Name Server</td>
  <td class="content"><% getDns(1); %></td>
</tr>
<tr>
  <td id="statusSecondaryDNS" class="head">Secondary Domain Name Server</td>
  <td class="content"><% getDns(2); %></td>
</tr>
<tr>
  <td id="statusWANMAC" class="head">MAC Address</td>
  <td class="content"><% getWanMac(); %></td>
</tr>
<!-- ================= Local Network ================= -->
<tr>
  <td colspan="2" id="statusLocalNet"  class="title">Local Network</td>
</tr>
<tr>
  <td class="head" id="statusLANIPAddr">Local IP Address</td>
  <td  class="content"><% getLanIp(); %></td>
</tr>
<tr>
  <td class="head" id="statusLocalNetmask">Local Netmask</td>
  <td  class="content"><% getLanNetmask(); %></td>
</tr>
<tr>
  <td class="head" id="statusLANMAC">MAC Address</td>
  <td  class="content"><% getLanMac(); %></td>
</tr>
<tr id="USBmodeminfoRow">
  <td colspan="2" id="3Gusbmodeminfotitle"  class="title">USB Modem Info</td>
</tr>
<tr id="USBmodemstatusRowdetected">
  <td id="3Gusbmodemstatus"  class="head">USB Modem Status</td>
  <td id="3Gusbmodemdetected" class="content">Detected</td>
</tr>
<tr id="USBmodemstatusRownotdetected">
  <td id="3Gusbmodemstatus1"  class="head">USB Modem Status</td>
  <td id="3Gusbmodemnotdetected" class="content">Not Detected</td>
</tr>
<tr id="USBmodemstatusRowinfo">
  <td id="3Gusbmodemstatus2"  class="head">USB Modem Status</td>
  <td><font id="3Gusbmodeminfo" class="content">Detected:</font><% getDial3gUsbModemInfo(); %></td>
</tr>
<tr id="USBmodemfirmwareRow">
  <td id="3Gusbmodemfirmware"  class="head">USB Modem Firmware</td>
  <td class="content"><% getDial3gUsbModemFirmware(); %></td>
</tr>
<tr id="USBsimstatusRowNull">
  <td id="3Gsimstatus"  class="head">SIM Status</td>
  <td class="content"></td>
</tr>
<tr id="USBsimstatusRowInsert">
  <td id="3Gsimstatus1"  class="head">SIM Status</td>
  <td  class="content"><font id="3GsimstatusInsert">Inserted</font><% getDial3gCimiValue(); %></td>
</tr>

<!-- ================= Other Information ================= -->
</table>

<!--
<table border="0" id="div_ethtool">
<tr>
  <td>
    <H1 id="statusEthPortStatus">Ethernet Port Status</H1>
  </td>
</tr>
<tr>
  <td>
    <script type="text/javascript">showPortStatus();</script>
  </td>
</tr>
</table>

</td></tr></table>-->
</body>
</html>
