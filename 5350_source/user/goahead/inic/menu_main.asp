<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<!-- !!! Dont forget to modify   INIC mode treeapp.asp !!! -->

<head>
<title>menu</title>
<meta http-equiv="content-type" content="text/html;charset=iso-8859-1" />
<script type="text/javascript" src="menu_main/menu_sm.js"></script>
<link href="menu_main/menu_totolink_sm.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/lang/b28n.js"></script>
</head>


<body>
<script language="JavaScript">    
var isFimwareUpload = 0;
Butterlate.setTextDomain("main");

function setUnderFirmwareUpload(flag){
	isFimwareUpload = flag;
}
function go(zz) {
	if(!isFimwareUpload)
		top.view.location=zz;
}
function refresh(){
	window.location.reload(false);
}
</script>

<script type="text/javascript">
var opmode = '<% getCfgZero(1, "OperationMode"); %>';
var dhcpen = '<% getCfgZero(1, "dhcpEnabled"); %>';
var dpbsta = '<% getDpbSta(); %>';
var vpnen = '<% getVPNBuilt(); %>';
var ethconv = '<% getCfgZero(1, "ethConvert"); %>';
var meshb = '<% getMeshBuilt(); %>';
var wdsb = '<% getWDSBuilt(); %>';
var wscb = '<% getWSCBuilt(); %>';
var usbb = '<% getUSBBuilt(); %>';
var storageb = '<% getStorageBuilt(); %>';
var ftpb = '<% getFtpBuilt(); %>';
var smbb = '<% getSmbBuilt(); %>';
var mediab = '<% getMediaBuilt(); %>';
var webcamb = '<% getWebCamBuilt(); %>';
var printersrvb = '<% getPrinterSrvBuilt(); %>';
var usbiNICb = '<% getUSBiNICBuilt(); %>';

var syslogb = '<% getSysLogBuilt(); %>';
var swqos = '<% getSWQoSBuilt(); %>';
var ad = '<% isAntennaDiversityBuilt(); %>';

var a = new Menu('a');

//  nodeID, parent nodeID,  Name,  URL

a.add(200,   0, _("treeapp information"),        "adm/status.asp");
a.add(201,   200, _("treeapp system information"),        "adm/status.asp");
a.add(202,   200, _("treeapp connecting information"),        "adm/statistic.asp");
a.add(203,   200, _("treeapp log"),        "adm/syslog.asp");
a.add(300,   0, _("treeapp internet settings"),     "internet/wan.asp");
if (opmode != '0') {
	a.add(301, 300, _("treeapp wan"),                   "internet/wan.asp");
}
a.add(302, 300, _("treeapp lan"),                   "internet/lan.asp");
if (dhcpen == "1") {
	a.add(303, 300, _("treeapp dhcp clients"),          "internet/dhcpcliinfo.asp");
}
if (vpnen == "1") {
	a.add(304, 300, _("treeapp vpn passthrough"),       "internet/vpnpass.asp");
}
if (opmode != '0') {
	a.add(305, 300, _("treeapp routing"),       "internet/routing.asp");
}

if (swqos == '1') {
	a.add(306, 300, _("treeapp qos"),		"internet/qos.asp");
}

if ((opmode == '0' && dpbsta == '1' && ethconv == '1') || opmode == '2')
{
	a.add(400,   0, _("treeapp wireless settings"),     "station/profile.asp");
	a.add(401, 400, _("treeapp profile"),               "station/profile.asp");
	a.add(402, 400, _("treeapp link status"),           "station/link_status.asp");
	a.add(403, 400, _("treeapp site survey"),           "station/site_survey.asp");
	a.add(404, 400, _("treeapp statistics"),            "station/statistics.asp");
	a.add(405, 400, _("treeapp advance"),               "station/advance.asp");
	a.add(406, 400, _("treeapp qos"),                   "station/qos.asp");
	a.add(407, 400, _("treeapp 11n configurations"),    "station/11n_cfg.asp");
	a.add(408, 400, _("treeapp about"),                 "station/about.asp");
	if (wscb == "1")
		a.add(409, 400, _("treeapp wps"),                   "wps/wps_sta.asp");
}
else
{
	a.add(400,   0, _("treeapp wireless settings"),     "wireless/basic.asp");
	a.add(401, 400, _("treeapp basic"),                 "wireless/basic.asp");
	a.add(402, 400, _("treeapp advanced"),              "wireless/advanced.asp");
	a.add(403, 400, _("treeapp security"),              "wireless/security.asp");
	if (wdsb == "1")
	{
		a.add(404, 400, _("treeapp wds"),                   "wireless/wds.asp");
	}
	if (wscb == "1")
		a.add(405, 400, _("treeapp wps"),                   "wps/wps.asp");
	if (opmode == '3')
		a.add(406, 400, _("treeapp ap client"),     "wireless/apcli.asp");
	a.add(407, 400, _("treeapp station list"),          "wireless/stainfo.asp");
	if (ad == '1')
		a.add(408, 400, "Antenna Diversity",		"wireless/ant_diversity.asp");
	if (meshb == "1")
	{
		a.add(410, 400, _("treeapp mesh settings"),     "wireless/mesh.asp");
	}
}

if (opmode != '0') {
	a.add(700,   0, _("treeapp firewall"),              "firewall/port_filtering.asp");
	a.add(701, 700, _("treeapp ip/port filtering"),     "firewall/port_filtering.asp");
	a.add(703, 700, _("treeapp port forwarding"),       "firewall/port_forward.asp");
	a.add(704, 700, _("treeapp dmz"),                   "firewall/DMZ.asp");
	a.add(705, 700, _("treeapp system firewall"),       "firewall/system_firewall.asp");
	a.add(706, 700, _("treeapp content filtering"),     "firewall/content_filtering.asp");
}

if (usbb == "1")
{
	
	if (webcamb == "1")
	{
	    a.add(800,   0, _("treeapp usb"),		"usb/UVCwebcam.asp");
		a.add(801, 800, _("treeapp webcam"),		"usb/UVCwebcam.asp");
	}
	if (printersrvb == "1")
	{
	    a.add(800,   0, _("treeapp usb"),		"usb/P910NDprintersrv.asp");
		a.add(802, 800, _("treeapp printersrv"),	"usb/P910NDprintersrv.asp");
	}
	if (usbiNICb == "1")
	{
	    a.add(800,   0, _("treeapp usb"),		"usb/INICusb_inic.asp");
		a.add(803, 800, _("treeapp usbinic"),		"usb/INICusb_inic.asp");
	}
	
	//if (itunesb == "1")
	//{
		//a.add(800,   0, _("treeapp usb"),		"usb/iTunesServer.asp");
		//a.add(804, 800, _("treeapp itunes"),		"usb/iTunesServer.asp");
	//}
	
	/*
	if (storageb == "1")
	{
		a.add(850,   0, _("treeapp storage"),		"usb/STORAGEuser_admin.asp");
		a.add(851, 850, _("treeapp useradmin"),	"usb/STORAGEuser_admin.asp");
		//a.add(852, 850, _("treeapp disk"),		"usb/STORAGEdisk_admin.asp");
		if (ftpb == "1")
			a.add(853, 850, _("treeapp ftpsrv"),		"usb/FTPftpsrv.asp");
		if (smbb == "1")
			a.add(854, 850, _("treeapp sambasrv"),		"usb/SAMBAsmbsrv.asp");
		if (mediab == "1")
			a.add(855, 850, _("treeapp mediasrv"),		"usb/USHAREmediasrv.asp");
	}
	*/
}

a.add(900,   0, _("treeapp administration"),        "adm/langaugeSettings.asp");
a.add(901, 900, _("overview select language"),            "adm/langaugeSettings.asp");
a.add(902, 900, _("treeapp account"),       "adm/admSettings.asp");
a.add(903, 900, _("treeapp NTP"),   "adm/NTPSettings.asp");
a.add(904, 900, _("treeapp DDNS"),                "adm/DDNSSetting.asp");
a.add(905, 900, _("treeapp upgrade"),            "adm/upload_firmware.asp");
a.add(906, 900, _("treeapp parameter"),        "adm/settings.asp");
//if (syslogb == "1")
//{
	//a.add(908, 900, _("treeapp system log"),            "adm/syslog.asp");
//}
//a.add(907, 900, _("treeapp sdk history"),           "cgi-bin/history.sh");
document.write(a);
</script>

</body>
	
 </html>
