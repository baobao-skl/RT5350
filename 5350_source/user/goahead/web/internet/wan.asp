<html>
<head>
<title>Wide Area Network (WAN) Settings</title>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript" type="text/javascript">
var http_request = false;
Butterlate.setTextDomain("internet");

function macCloneMacFillSubmit()
{
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
        alert('Cannot create an XMLHTTP instance');
        return false;
    }
    http_request.onreadystatechange = doFillMyMAC;

    http_request.open('POST', '/goform/getMyMAC', true);
    http_request.send('n\a');
}

function doFillMyMAC()
{
    if (http_request.readyState == 4) {
		if (http_request.status == 200) {
			document.getElementById("macCloneMac").value = http_request.responseText;
		} else {
			if(langtype=="zhcn")
    	  alert("无法获得MAC地址");
    	  else
			alert("Can\'t get the mac address.");
		}
	}
}


function macCloneSwitch()
{
	if (document.wanCfg.macCloneEnbl.options.selectedIndex == 1) {
		document.getElementById("macCloneMacRow").style.visibility = "visible";
		document.getElementById("macCloneMacRow").style.display = style_display_on();
	}
	else {
		document.getElementById("macCloneMacRow").style.visibility = "hidden";
		document.getElementById("macCloneMacRow").style.display = "none";
	}
}

function connectionTypeSwitch()
{
	document.getElementById("static").style.visibility = "hidden";
	document.getElementById("static").style.display = "none";
	document.getElementById("dhcp").style.visibility = "hidden";
	document.getElementById("dhcp").style.display = "none";
	document.getElementById("pppoe").style.visibility = "hidden";
	document.getElementById("pppoe").style.display = "none";
	document.getElementById("3G").style.visibility = "hidden";
	document.getElementById("3G").style.display = "none";
	document.getElementById("wwanShow").style.visibility = "hidden";
	document.getElementById("wwanShow").style.display = "none";
	document.getElementById("wwanScanTable").style.visibility = "hidden";
	document.getElementById("wwanScanTable").style.display = "none";	
	
	if (document.wanCfg.connectionType.options.selectedIndex == 0) {
		document.getElementById("static").style.visibility = "visible";
		document.getElementById("static").style.display = "block";
	}
	else if (document.wanCfg.connectionType.options.selectedIndex == 1) {
		document.getElementById("dhcp").style.visibility = "visible";
		document.getElementById("dhcp").style.display = "block";
	}
	else if (document.wanCfg.connectionType.options.selectedIndex == 2) {
		document.getElementById("pppoe").style.visibility = "visible";
		document.getElementById("pppoe").style.display = "block";
		pppoeOPModeSwitch();
	}	
	else if (document.wanCfg.connectionType.options.selectedIndex == 3) {
		document.getElementById("3G").style.visibility = "visible";
		document.getElementById("3G").style.display = "block";
	}
	else if (document.wanCfg.connectionType.options.selectedIndex == 4) {
		document.getElementById("wwanShow").style.visibility = "visible";
		document.getElementById("wwanShow").style.display = "block";
		document.getElementById("wwanScanTable").style.visibility = "visible";
	document.getElementById("wwanScanTable").style.display = "block";
	}
	else {
		document.getElementById("static").style.visibility = "visible";
		document.getElementById("static").style.display = "block";
	}
	
	wwanSecureModeSwitch();
}

/* wwan mode */
function wwaninitvalue()
{
	var auth= "<% getCfgGeneral(1, "ApCliAuthMode"); %>";
	var encry = "<% getCfgGeneral(1, "ApCliEncrypType"); %>";
	var channel="<% getCfgGeneral(1, "ApCliChannel"); %>";
	var defaultkeyid = "<% getCfgGeneral(1, "ApCliDefaultKeyId"); %>";
	
	document.getElementById("wwanChannelValue").value = channel;

	if(encry=="NONE")
		document.getElementById("wwanSecureModeValue").value = "Disable";
	else if(encry=="WEP")
	{
		document.getElementById("wwanSecureModeValue").value = "WEP";
		document.getElementById("wwanWepAuthValue").value = auth;
		document.getElementById("wwanWepKeyIdValue").value = defaultkeyid;
	}
	else
	{
		document.getElementById("wwanSecureModeValue").value = auth;
		document.getElementById("wwanWpaEncryptValue").value = encry;
	}		 
}

function wwanSecureModeSwitch()
{
    if ( document.wanCfg.connectionType.options.selectedIndex != 4 )
    {
        document.getElementById("wwanWepShow").style.visibility = "hidden";
        document.getElementById("wwanWepShow").style.display = "none";
        document.getElementById("wwanWpaPskShow").style.visibility = "hidden";
        document.getElementById("wwanWpaPskShow").style.display = "none";
        document.getElementById("wwanWpaShow").style.visibility = "hidden";
        document.getElementById("wwanWpaShow").style.display = "none";
    }
    else if ( document.getElementById("wwanSecureModeValue").value == "WEP" )
    {
        document.getElementById("wwanWepShow").style.visibility = "visible";
        document.getElementById("wwanWepShow").style.display = "";
        document.getElementById("wwanWpaPskShow").style.visibility = "hidden";
        document.getElementById("wwanWpaPskShow").style.display = "none";
        document.getElementById("wwanWpaShow").style.visibility = "hidden";
        document.getElementById("wwanWpaShow").style.display = "none";
    }
    else if ( document.getElementById("wwanSecureModeValue").value == "WPAPSK" ||
        document.getElementById("wwanSecureModeValue").value == "WPA2PSK"  )
    {
        document.getElementById("wwanWepShow").style.visibility = "hidden";
        document.getElementById("wwanWepShow").style.display = "none";
        document.getElementById("wwanWpaPskShow").style.visibility = "visible";
        document.getElementById("wwanWpaPskShow").style.display = "";
        document.getElementById("wwanWpaShow").style.visibility = "hidden";
        document.getElementById("wwanWpaShow").style.display = "none";
    }
    else
    {
        document.getElementById("wwanWepShow").style.visibility = "hidden";
        document.getElementById("wwanWepShow").style.display = "none";
        document.getElementById("wwanWpaPskShow").style.visibility = "hidden";
        document.getElementById("wwanWpaPskShow").style.display = "none";
        document.getElementById("wwanWpaShow").style.visibility = "hidden";
        document.getElementById("wwanWpaShow").style.display = "none";
    }
}


function style_display_on()
{
	if (window.ActiveXObject) { // IE
		return "block";
	}
	else if (window.XMLHttpRequest) { // Mozilla, Safari,...
		return "table-row";
	}
}

function pppoeOPModeSwitch()
{
	document.wanCfg.pppoeRedialPeriod.disabled = true;
	document.wanCfg.pppoeIdleTime.disabled = true;
	if (document.wanCfg.pppoeOPMode.options.selectedIndex == 0) 
		document.wanCfg.pppoeRedialPeriod.disabled = false;
	else if (document.wanCfg.pppoeOPMode.options.selectedIndex == 1)
		document.wanCfg.pppoeIdleTime.disabled = false;
}

function atoi(str, num)
{
	i = 1;
	if (num != 1) {
		while (i != num && str.length != 0) {
			if (str.charAt(0) == '.') {
				i++;
			}
			str = str.substring(1);
		}
		if (i != num)
			return -1;
	}

	for (i=0; i<str.length; i++) {
		if (str.charAt(i) == '.') {
			str = str.substring(0, i);
			break;
		}
	}
	if (str.length == 0)
		return -1;
	return parseInt(str, 10);
}

function checkRange(str, num, min, max)
{
	d = atoi(str, num);
	if (d > max || d < min)
		return false;
	return true;
}

function isAllNum(str)
{
	for (var i=0; i<str.length; i++) {
		if ((str.charAt(i) >= '0' && str.charAt(i) <= '9') || (str.charAt(i) == '.' ))
			continue;
		return 0;
	}
	return 1;
}

function checkIpAddr(field, ismask)
{
	if (field.value == "") {
		if(langtype=="zhcn")
    	  alert("出错：IP地址为空");
    	  else
		alert("Error. IP address is empty.");
		field.value = field.defaultValue;
		field.focus();
		return false;
	}

	if (isAllNum(field.value) == 0) {
		if(langtype=="zhcn")
    	  alert("出错：应该为[0-9]范围的数字");
    	  else
    	  	alert('It should be a [0-9] number.');
		field.value = field.defaultValue;
		field.focus();
		return false;
	}

	if (ismask) {
		if ((!checkRange(field.value, 1, 0, 256)) ||
				(!checkRange(field.value, 2, 0, 256)) ||
				(!checkRange(field.value, 3, 0, 256)) ||
				(!checkRange(field.value, 4, 0, 256)))
		{
			if(langtype=="zhcn")
    	  alert("IP地址格式错误");
    	  else
			alert('IP adress format error.');
			field.value = field.defaultValue;
			field.focus();
			return false;
		}
	}
	else {
		if ((!checkRange(field.value, 1, 0, 255)) ||
				(!checkRange(field.value, 2, 0, 255)) ||
				(!checkRange(field.value, 3, 0, 255)) ||
				(!checkRange(field.value, 4, 1, 254)))
		{
			if(langtype=="zhcn")
    	  alert("IP地址格式出错");
    	  else
			alert('IP adress format error.');
			field.value = field.defaultValue;
			field.focus();
			return false;
		}
	}
	return true;
}

function checkMac( mac )  
{  
    var pattern=/[a-fA-F\d]{2}:[a-fA-F\d]{2}:[a-fA-F\d]{2}:[a-fA-F\d]{2}:[a-fA-F\d]{2}:[a-fA-F\d]{2}/;  
    if(!pattern.test(mac))
    {  
        return false;  
    }  
    return true;  
}  

function checkNoEmpty( value ) 
{
    if ( value == "undefined" || value == null ||value == "" )
    {
        return false;
    }
    return true;
}

function CheckValue()
{
	if (document.wanCfg.connectionType.selectedIndex == 0) 
	{      //STATIC
		if (!checkIpAddr(document.wanCfg.staticIp, false))
			return false;
		if (!checkIpAddr(document.wanCfg.staticNetmask, true))
			return false;
		if (document.wanCfg.staticGateway.value != "")
			if (!checkIpAddr(document.wanCfg.staticGateway, false))
				return false;
		if (document.wanCfg.staticPriDns.value != "")
			if (!checkIpAddr(document.wanCfg.staticPriDns, false))
				return false;
		if (document.wanCfg.staticSecDns.value != "")
			if (!checkIpAddr(document.wanCfg.staticSecDns, false))
				return false;
	}
	else if (document.wanCfg.connectionType.selectedIndex == 1) 
	{ //DHCP
	}
	else if (document.wanCfg.connectionType.selectedIndex == 2) 
	{ //PPPOE
		if (document.wanCfg.pppoePass.value != document.wanCfg.pppoePass2.value) 
		{
			if(langtype=="zhcn")
    	  alert("密码不匹配");
    	  else
			alert("Password mismatched!");
			return false;
		}
		if (document.wanCfg.pppoeOPMode.options.selectedIndex == 0)
		{
			if (document.wanCfg.pppoeRedialPeriod.value == "")
			{
				if(langtype=="zhcn")
    	  alert("请确定重拨间隔");
    	  else
				alert("Please specify Redial Period");
				document.wanCfg.pppoeRedialPeriod.focus();
				document.wanCfg.pppoeRedialPeriod.select();
				return false;
			}
		}
		else if (document.wanCfg.pppoeOPMode.options.selectedIndex == 1);
		{
			if (document.wanCfg.pppoeIdleTime.value == "")
			{
				if(langtype=="zhcn")
    	  alert("请确定空间时间");
    	  else
				alert("Please specify Idle Time");
				document.wanCfg.pppoeIdleTime.focus();
				document.wanCfg.pppoeIdleTime.select();
				return false;
			}
		}
	}
	else if (document.wanCfg.connectionType.selectedIndex == 3) 
	{ //3G
	}
	else if (document.wanCfg.connectionType.selectedIndex == 4) 
	{ //wifi access
		if ( checkNoEmpty(document.getElementById("wwanSsidValue").value) ==  false )
		{
			alert("ssid is undefined or null");
			document.getElementById("wwanSsidValue").select();
			return false;
		}
		if ( checkNoEmpty(document.getElementById("wwanBssidValue").value) == true && checkMac(document.getElementById("wwanBssidValue").value) == false )
    {
    	alert( "bssid is wrong!" );
      document.getElementById("wwanBssidValue").select();
      return false;
    }
    
    var bssid = emptyToSpace( document.getElementById("wwanBssidValue").value );
    var channel = emptyToIt( document.getElementById("wwanChannelValue").value, "0" );
    var secure_mode = emptyToIt( document.getElementById("wwanSecureModeValue").value, "Disable" );
    if (  "WEP" == secure_mode )
    {
    	var wep_auth = emptyToIt( document.getElementById("wwanWepAuthValue").value, "AUTO" );
    	var wep_key_type = emptyToIt( document.getElementById("wwanWepKeyTypeValue").value, "ASCII" );
    	var wep_key_id = emptyToIt( document.getElementById("wwanWepKeyIdValue").value, "1" );
    	var wep_key1 = emptyToSpace( document.getElementById("wwanWepKey1Value").value );
    	var wep_key2 = emptyToSpace( document.getElementById("wwanWepKey2Value").value );
    	var wep_key3 = emptyToSpace( document.getElementById("wwanWepKey3Value").value );
    	var wep_key4 = emptyToSpace( document.getElementById("wwanWepKey4Value").value );
    	
    	if ( checkNoEmpty( wep_key1 ) == false &&
                checkNoEmpty( wep_key2 ) == false &&
                checkNoEmpty( wep_key3 ) == false &&
                checkNoEmpty( wep_key4 ) == false )
            {
                alert( "wep key is null" );
                document.getElementById("wwanWepKey1Value").select();
                return false;
            }
            
				if ( checkNoEmpty( wep_key1 ) == true 
                && wep_key1.length != 5     /* 64bit ASCII */
                && wep_key1.length != 10    /* 64bit Hex */
                && wep_key1.length != 13    /* 128bit ASCII */
                && wep_key1.length != 26    /* 128bit Hex */
            )
            {
                alert( "wep key1 is Invalid" );
                document.getElementById("wwanWepKey1Value").select();
                return false;
            }
            
        if ( checkNoEmpty( wep_key2 ) == true 
                && wep_key2.length != 5     /* 64bit ASCII */
                && wep_key2.length != 10    /* 64bit Hex */
                && wep_key2.length != 13    /* 128bit ASCII */
                && wep_key2.length != 26    /* 128bit Hex */
            )
            {
                alert( "wep key2 is Invalid" );
                document.getElementById("wwanWepKey2Value").select();
                return false;
            }    
        if ( checkNoEmpty( wep_key3 ) == true 
                && wep_key3.length != 5     /* 64bit ASCII */
                && wep_key3.length != 10    /* 64bit Hex */
                && wep_key3.length != 13    /* 128bit ASCII */
                && wep_key3.length != 26    /* 128bit Hex */
            )
            {
                alert( "wep key3 is Invalid" );
                document.getElementById("wwanWepKey3Value").select();
                return false;
            }
        if ( checkNoEmpty( wep_key4 ) == true 
                && wep_key4.length != 5     /* 64bit ASCII */
                && wep_key4.length != 10    /* 64bit Hex */
                && wep_key4.length != 13    /* 128bit ASCII */
                && wep_key4.length != 26    /* 128bit Hex */
            )
            {
                alert( "wep key4 is Invalid" );
                document.getElementById("wwanWepKey4Value").select();
                return false;
            }                
    }
    else if("WPAPSK" == secure_mode || "WPA2PSK" == secure_mode)
    {
    				var wpa_encrypt = emptyToIt( document.getElementById("wwanWpaEncryptValue").value, "AES" );
    				if ( checkNoEmpty(document.getElementById("wwanWpaKeyValue").value) ==  false )
            {
                alert( "wpa key is null" );
                document.getElementById("wwanWpaKeyValue").select();
                return false;
            }
            if (  document.getElementById("wwanWpaKeyValue").value.length < 8 )
            {
                alert( "wpa key is invalid" );
                document.getElementById("wwanWpaKeyValue").select();
                return false;
            }
    }
	}
	else
		return false;

	if (document.wanCfg.macCloneEnbl.options.selectedIndex == 1) {
		var re = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
		if (document.wanCfg.macCloneMac.value.length == 0) {
			if(langtype=="zhcn")
    	  alert("MAC地址不能为空");
    	  else
			alert("MAC Address should not be empty!");
			document.wanCfg.macCloneMac.focus();
			return false;
		}
		if (!re.test(document.wanCfg.macCloneMac.value)) {
			if(langtype=="zhcn")
    	  alert("MAC地址格式出错（XX:XX:XX:XX:XX:XX)");
    	  else
			alert("Please fill the MAC Address in correct format! (XX:XX:XX:XX:XX:XX)");
			document.wanCfg.macCloneMac.focus();
			return false;
		}
	}
	
	document.wanCfg.submit();
	//return true;
}

function creat_http_request()
{
    var http_request = false;
    
    if (window.XMLHttpRequest) 
    { // Mozilla, Safari,...
        http_request = new XMLHttpRequest();
        if (http_request.overrideMimeType) 
        {
            http_request.overrideMimeType('text/xml');
        }
    } 
    else if (window.ActiveXObject) 
    { // IE
        try 
        {
            http_request = new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (e) 
        {
            try 
            {
                http_request = new ActiveXObject("Microsoft.XMLHTTP");
            } 
            catch (e) 
            {
                alert('Cannot create an XMLHTTP instance'); 
            }
        }
    }
    if (!http_request)
    {
        alert('Cannot create an XMLHTTP instance');
        return false;
    }
    return http_request;
 }

var imtScanRequest = false;
function ScanSubmit()
{
		//document.wanCfg.wwanScanButton.disabled=true;
		document.wifiscan.submit();
		
		//var url = "/goform/scannet";
    //imtScanRequest = creat_http_request();
    //imtScanRequest.open("GET", url, true);
    //imtScanRequest.onreadystatechange = imtScanCallback;
    //imtScanRequest.setRequestHeader("If-Modified-Since","0");
    //imtScanRequest.send(null);
}

function initTranslation()
{
	var e = document.getElementById("wTitle");
	e.innerHTML = _("wan title");
	e = document.getElementById("wIntroduction");
	e.innerHTML = _("wan introduction");

	e = document.getElementById("wConnectionType");
	e.innerHTML = _("wan connection type");
	e = document.getElementById("wConnTypeStatic");
	e.innerHTML = _("wan connection type static");
	e = document.getElementById("wConnTypeDhcp");
	e.innerHTML = _("wan connection type dhcp");
	e = document.getElementById("wConnTypePppoe");
	e.innerHTML = _("wan connection type pppoe");
	//e = document.getElementById("wConnTypeL2tp");
	//e.innerHTML = _("wan connection type l2tp");
	//e = document.getElementById("wConnTypePptp");
	//e.innerHTML = _("wan connection type pptp");

	e = document.getElementById("wStaticMode");
	e.innerHTML = _("wan static mode");
	e = document.getElementById("wStaticIp");
	e.innerHTML = _("inet ip");
	e = document.getElementById("wStaticNetmask");
	e.innerHTML = _("inet netmask");
	e = document.getElementById("wStaticGateway");
	e.innerHTML = _("inet gateway");
	e = document.getElementById("wStaticPriDns");
	e.innerHTML = _("inet pri dns");
	e = document.getElementById("wStaticSecDns");
	e.innerHTML = _("inet sec dns");

	e = document.getElementById("wDhcpMode");
	e.innerHTML = _("wan dhcp mode");
	e = document.getElementById("wDhcpHost");
	e.innerHTML = _("inet hostname");

	e = document.getElementById("wPppoeMode");
	e.innerHTML = _("wan pppoe mode");
	e = document.getElementById("wPppoeUser");
	e.innerHTML = _("inet user");
	e = document.getElementById("wPppoePassword");
	e.innerHTML = _("inet password");
	e = document.getElementById("wPppoePass2");
	e.innerHTML = _("inet pass2");
	e = document.getElementById("wPppoeOPMode");
	e.innerHTML = _("wan protocol opmode");
	e = document.getElementById("wPppoeKeepAlive");
	e.innerHTML = _("wan protocol opmode keepalive");
	e = document.getElementById("wPppoeOnDemand");
	e.innerHTML = _("wan protocol opmode ondemand");
	e = document.getElementById("wPppoeManual");
	e.innerHTML = _("wan protocol opmode manual");

	//e = document.getElementById("w3GMode");
	//e.innerHTML = _("wan 3G mode");
	//e = document.getElementById("w3GDev");
	//e.innerHTML = _("wan 3G modem");

	e = document.getElementById("wMacClone");
	e.innerHTML = _("wan mac clone");
	e = document.getElementById("wMacCloneD");
	e.innerHTML = _("inet disable");
	e = document.getElementById("wMacCloneE");
	e.innerHTML = _("inet enable");
	e = document.getElementById("wMacCloneAddr");
	e.innerHTML = _("inet mac");
	
	
	e = document.getElementById("wpKeepAliveMode");
	e.innerHTML = _("keep alive mode");
	e = document.getElementById("wpKeepAliveModeTime");
	e.innerHTML = _("keep alive mode time");
	e = document.getElementById("wpOndemandMode");
	e.innerHTML = _("on demand mode");
	e = document.getElementById("wpOndemandModeTime");
	e.innerHTML = _("on demand mode time");

	e = document.getElementById("wApply");
	e.value = _("inet apply");
	e = document.getElementById("wCancel");
	e.value = _("inet cancel");
	
	e = document.getElementById("macCloneMacFill");
	e.value = _("mac clone mac fill");
	
	e = document.getElementById("3GTitle");
	e.innerHTML = _("3G title");
	e = document.getElementById("3GContent");
	e.innerHTML = _("3G Content");
	e = document.getElementById("3GContent1");
	e.innerHTML = _("3G Content1");
	e = document.getElementById("3GsimPin");
	e.innerHTML = _("3G sim pin");
	e = document.getElementById("3GAuto");
	e.innerHTML = _("3G auto");
	e = document.getElementById("3GManual");
	e.innerHTML = _("3G manual");
	e = document.getElementById("3GdialNumber");
	e.innerHTML = _("3G dial number");
	e = document.getElementById("3Gusername");
	e.innerHTML = _("3G user name");
	e = document.getElementById("3GpassWord");
	e.innerHTML = _("3G pass Word");
	e = document.getElementById("3Gapn");
	e.innerHTML = _("3G apn");
	
	e = document.getElementById("WifiAccessTitle");
	e.innerHTML = _("wifiaccess title");
	e = document.getElementById("wwanScanButton");
	e.value = _("wwan scan button");
	e = document.getElementById("wwanChannel");
	e.innerHTML = _("wwan channel");
	e = document.getElementById("wwanSecureMode");
	e.innerHTML = _("wwan secure mode");
	e = document.getElementById("wwanSecureMode_DISABLE");
	e.innerHTML = _("wwan secure disable");
	e = document.getElementById("wwanWepAuth");
	e.innerHTML = _("wwan wep auth");
	e = document.getElementById("wwanWepKeyType");
	e.innerHTML = _("wwan key type");
	e = document.getElementById("wwanWepKeyType");
	e.innerHTML = _("wwan key type");
	e = document.getElementById("wwanWepKeyId");
	e.innerHTML = _("wwan default key id");
	e = document.getElementById("wwanWepKeyId");
	e.innerHTML = _("wwan default key id");
	e = document.getElementById("wwanWpaEncrypt");
	e.innerHTML = _("wwan wpa encrypt");
	e = document.getElementById("wwanscanChannel");
	e.innerHTML = _("wwan scan channel");
	e = document.getElementById("wwanscanSecurity");
	e.innerHTML = _("wwan scan security");
	e = document.getElementById("wwanscanEncrypt");
	e.innerHTML = _("wwan scan encrypt");
	e = document.getElementById("wwanscanSignal");
	e.innerHTML = _("wwan scan signal");
	e = document.getElementById("wwanscanMode");
	e.innerHTML = _("wwan scan mode");
}

function initValue()
{
	var mode = "<% getCfgGeneral(1, "wanConnectionMode"); %>";
	var pptpMode = <% getCfgZero(1, "wan_pptp_mode"); %>;
	var clone = <% getCfgZero(1, "macCloneEnabled"); %>;

	initTranslation();
	if (mode == "STATIC") {
		document.wanCfg.connectionType.options.selectedIndex = 0;
	}
	else if (mode == "DHCP") {
		document.wanCfg.connectionType.options.selectedIndex = 1;
	}
	else if (mode == "PPPOE") {
		var pppoe_opmode = "<% getCfgGeneral(1, "wan_pppoe_opmode"); %>";
		var pppoe_optime = "<% getCfgGeneral(1, "wan_pppoe_optime"); %>";

		document.wanCfg.connectionType.options.selectedIndex = 2;
		if (pppoe_opmode == "Manual")
		{
			document.wanCfg.pppoeOPMode.options.selectedIndex = 2;
		}
		else if (pppoe_opmode == "OnDemand")
		{
			document.wanCfg.pppoeOPMode.options.selectedIndex = 1;
			if (pppoe_optime != "")
				document.wanCfg.pppoeIdleTime.value = pppoe_optime;
		}
		else if (pppoe_opmode == "KeepAlive")
		{
			document.wanCfg.pppoeOPMode.options.selectedIndex = 0;
			if (pppoe_optime != "")
				document.wanCfg.pppoeRedialPeriod.value = pppoe_optime;
		}

		pppoeOPModeSwitch();
	}
	else if (mode == "3G") {
		var dev_3g = "<% getCfgGeneral(1, "wan_3g_dev"); %>";

		document.wanCfg.connectionType.options.selectedIndex = 3;		
	}
	else if (mode == "WifiAccess") {
		document.wanCfg.connectionType.options.selectedIndex = 4;
		wwaninitvalue();		
	}
	else {
		document.wanCfg.connectionType.options.selectedIndex = 0;
	}
	connectionTypeSwitch();

	if (clone == 1)
		document.wanCfg.macCloneEnbl.options.selectedIndex = 1;
	else
		document.wanCfg.macCloneEnbl.options.selectedIndex = 0;
	macCloneSwitch();
	
	var choicetype="<% getCfgGeneral(1, "dial3gchoicetype"); %>";
	var selectS=document.getElementsByName("3GChoicetype");
	for(var i=0;i<selectS.length;i++){
		if(selectS[i].value==choicetype){
			selectS[i].checked=true;
			break;
		}
	}
	
}

function emptyToSpace( value ) 
{
    if ( value == "undefined" || value == null ||value == "")
    {
        return "";
    }
    return value;
}

function emptyToIt( value, exp ) 
{
    if ( value == "undefined" || value == null ||value == "" )
    {
        return exp;
    }
    return value;
}

function wwanSsidSelectCall()
{
    var auth;
    var encry;
    var wwanScanTable = document.getElementById("wwanScanTable");
    var ssidSelectTarget = document.getElementsByName("ssidSelectTarget");
    var rowCount = wwanScanTable.rows.length;

    for ( var r = rowCount-1; r > 0; r -- )
    {
        if ( ssidSelectTarget[r-1].checked )
        {
            document.getElementById("wwanSsidValue").value = wwanScanTable.rows[r].cells[2].innerHTML;
            document.getElementById("wwanBssidValue").value = wwanScanTable.rows[r].cells[3].innerHTML;
            document.getElementById("wwanChannelValue").value = wwanScanTable.rows[r].cells[4].innerHTML;
            auth = wwanScanTable.rows[r].cells[5].innerHTML;
            encry = wwanScanTable.rows[r].cells[6].innerHTML;
            if ( auth.indexOf("WPAPSK") != -1 || auth.indexOf("WPA2PSK") != -1 )
            {
                if ( auth.indexOf("WPA2PSK") != -1 )
                {
                    document.getElementById("wwanSecureModeValue").value = "WPA2PSK";
                }
                else
                {
                    document.getElementById("wwanSecureModeValue").value = auth;
                }                
                if ( encry == "TKIPAES" || encry == "AESTKIP" || encry == "AUTO" )
                {
                    document.getElementById("wwanWpaEncryptValue").value = "AES";
                }
                else
                {   
                    document.getElementById("wwanWpaEncryptValue").value = encry;                    
                }
            }
            else if ( encry.indexOf("WEP") != -1 )
            {
                document.getElementById("wwanSecureModeValue").value = encry;
                document.getElementById("wwanWepAuthValue").value = "OPEN";
            }
            else
            {
                document.getElementById("wwanSecureModeValue").value = "Disable";
            }
            wwanSecureModeSwitch();
            break;
        }        
    }
}

function show(){
	document.getElementById("3GtxtDialNumber").readOnly=true;
	document.getElementById("3GtxtUserName").readOnly=true;
	document.getElementById("3GtxtPassWord").readOnly=true;
	document.getElementById("3GtxtAPN").readOnly=true;
}

function noShow(){
	document.getElementById("3GtxtDialNumber").readOnly=false;
	document.getElementById("3GtxtUserName").readOnly=false;
	document.getElementById("3GtxtPassWord").readOnly=false;
	document.getElementById("3GtxtAPN").readOnly=false;
}
</script>
</head>

<body onLoad="initValue()">
<table class="body"><tr><td>

<h1 id="wTitle"></h1>
<p id="wIntroduction"></p>

<form method=post name="wanCfg" action="/goform/setWan">
<table width="540" cellpadding="2" cellspacing="1" border="0">
<tr align="center">
  <td align="left"><b id="wConnectionType"></b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  <td>
    <select name="connectionType" size="1" onChange="connectionTypeSwitch();">
      <option value="STATIC" id="wConnTypeStatic">Static Mode (fixed IP)</option>
      <option value="DHCP" id="wConnTypeDhcp">DHCP (Auto Config)</option>
      <option value="PPPOE" id="wConnTypePppoe">PPPOE (ADSL)</option>
      <option value="3G" id="wConnType3G">3G</option>
      <option value="WifiAccess" id="connectMode_wwan">Wifi Access</option> 
    </select>
  </td>
</tr>
</table>

<!-- ================= STATIC Mode ================= -->
<table id="static" width="540" border="0" cellpadding="2" cellspacing="1">
<tr>
  <td colspan="2" id="wStaticMode" class="title">Static Mode</td>
</tr>
<tr>
  <td id="wStaticIp" class="head">IP Address</td>
  <td class="content"><input name="staticIp" maxlength=15 value="<% getWanIp(); %>"></td>
</tr>
<tr>
  <td id="wStaticNetmask" class="head">Subnet Mask</td>
  <td class="content"><input name="staticNetmask" maxlength=15 value="<% getWanNetmask(); %>">
  </td>
</tr>
<tr>
  <td id="wStaticGateway" class="head">Default Gateway</td>
  <td class="content"><input name="staticGateway" maxlength=15 value="<% getWanGateway(); %>">
  </td>
</tr>
<tr>
  <td id="wStaticPriDns" class="head">Primary DNS Server</td>
  <td class="content"><input name="staticPriDns" maxlength=15 value="<% getDns(1); %>"></td>
</tr>
<tr>
  <td id="wStaticSecDns" class="head">Secondary DNS Server</td>
  <td class="content"><input name="staticSecDns" maxlength=15 value="<% getDns(2); %>"></td>
</tr>
</table>

<!-- ================= DHCP Mode ================= -->
<table id="dhcp" width="540" border="0" cellpadding="2" cellspacing="1">
<tr>
  <td  class="title" colspan="2" id="wDhcpMode">DHCP Mode</td>
</tr>
<tr>
  <td class="head"><div id="wDhcpHost">Host Name</div> (optional)</td>
  <td class="content"><input type=text name="hostname" size=28 maxlength=32 value=""></td>
</tr>
</table>

<!-- ================= PPPOE Mode ================= -->
<table id="pppoe" width="540" border="0" cellpadding="2" cellspacing="1">
<tr>
  <td  class="title" colspan="2" id="wPppoeMode">PPPoE Mode</td>
</tr>
<tr>
  <td id="wPppoeUser" class="head">User Name</td>
  <td class="content"><input name="pppoeUser" maxlength=32 size=32
             value="<% getCfgGeneral(1, "wan_pppoe_user"); %>"></td>
</tr>
<tr>
  <td id="wPppoePassword" class="head">Password</td>
  <td class="content"><input type="password" name="pppoePass" maxlength=32 size=32
             value="<% getCfgGeneral(1, "wan_pppoe_pass"); %>"></td>
</tr>
<tr>
  <td id="wPppoePass2" class="head">Verify Password</td>
  <td class="content"><input type="password" name="pppoePass2" maxlength=32 size=32
             value="<% getCfgGeneral(1, "wan_pppoe_pass"); %>"></td>
</tr>
<tr style="display:none">
  <td rowspan="2" id="wPppoeOPMode" class="head">Operation Mode</td>
  <td class="content">
    <select name="pppoeOPMode" size="1" onChange="pppoeOPModeSwitch()">
      <option value="KeepAlive" id="wPppoeKeepAlive">Keep Alive</option>
      <option value="OnDemand" id="wPppoeOnDemand">On Demand</option>
      <option value="Manual" id="wPppoeManual">Manual</option>
    </select>
  </td>
</tr>
<tr style="display:none">
  <td  class="content">
    <span id="wpKeepAliveMode">Keep Alive Mode: Redial Period</span>
    <input type="text" name="pppoeRedialPeriod" maxlength="5" size="3" value="60">
    <span id="wpKeepAliveModeTime">senconds</span>
    <br />
    <span id="wpOndemandMode">On demand Mode:  Idle Time</span>
    <input type="text" name="pppoeIdleTime" maxlength="3" size="2" value="5">
    <span id="wpOndemandModeTime">minutes</span>
  </td>
</tr>
</table>

<!-- =========== 3G Modular =========== -->
<table id="3G" width="540" border="0" cellpadding="2" cellspacing="1">
  <tr>
    <td colspan="2"  class="title"><Strong id="3GTitle">3G Dial Configuration Setup</Strong></td>
  </tr>
  <tr>
    <td  height="57" colspan="2" valign="top"><label id="3GContent">Setup 3G dial information, auto or manua</label>
    <br><label id="3GContent1">(Auto: Get dial parameters auto base on the sim card; Manual: By the client to set dial parameters)</label>
    </td>
  </tr>
  <tr>
    <td width="67" id="3GsimPin" class="head">SIM PIN:</td>
    <td width="301" class="content">
      <input type="text" name="3GtxtSimPin" id="3GtxtSimPin" value="<% getCfgGeneral(1, "dial3gsimpin"); %>">
   </td>
  </tr>
  <tr>
    <td colspan="2" class="head"><br>
      <input type="radio" name="3GChoicetype" onchange="show()" value="AUTO" id="3GChoicetype1">
    <label id="3GAuto">Auto</label><br>
    <input type="radio" name="3GChoicetype" onchange="noShow()" value="MANUAL" id="3GChoicetype2"> 
    <label id="3GManual">Manual</label></td>
  </tr>
  <tr>
    <td id="3GdialNumber" class="head">Dial Number:</td>
    <td class="content"><input type="text" name="3GtxtDialNumber" id="3GtxtDialNumber" readOnly value="<% getCfgGeneral(1, "dial3gnum"); %>"></td>
  </tr>
  <tr>
    <td id="3Gusername" class="head">User Name:</td>
    <td class="content"><input type="text" name="3GtxtUserName" id="3GtxtUserName" readOnly value="<% getCfgGeneral(1, "dial3gusername"); %>"></td>
  </tr>
  <tr>
    <td id="3GpassWord" class="head">PassWord:</td>
    <td class="content"><input type="text" name="3GtxtPassWord" id="3GtxtPassWord" readOnly value="<% getCfgGeneral(1, "dial3gpassword"); %>"></td>
  </tr>
  <tr>
    <td id="3Gapn" class="head">APN:</td>
    <td class="content"><input type="text" name="3GtxtAPN" id="3GtxtAPN" readOnly value="<% getCfgGeneral(1, "dial3gapn"); %>"></td>
  </tr>
</table>

<!-- =========== WIFI =========== -->
<table id="wwanShow" width="540" border="0" cellpadding="2" cellspacing="1">
	<tr>
    <td colspan="2"  class="title"><Strong id="WifiAccessTitle">Wifi Access</Strong></td>
  </tr>
  					<tr>
                <td id="wwanSsid" class="head">SSID</td>
                <td>
                    <input type="text" id="wwanSsidValue" name="wwanSsidValue" value="<% getCfgGeneral(1, "ApCliSsid"); %>" maxlength=64/>
                    <!--<input type=button style="{width:120px;}" value="Scan" id="wwanScanButton" name="wwanScan" onClick="ScanSubmit()">-->
                    <input type=submit style="{width:120px;}" value="Scan" id="wwanScanButton" name="wwanScan">
                </td>
            </tr>
            <tr>
                <td id="wwanBssid" class="head">BSSID</td>
                <td>
                    <input type="text" id="wwanBssidValue" name="wwanBssidValue" value="<% getCfgGeneral(1, "ApCliBssid"); %>" maxlength=17/>
                </td>
            </tr>
            <tr>
                <td id="wwanChannel" class="head">Channel</td>
                <td >
                    <select id="wwanChannelValue" name="wwanChannelValue">
                        <option value="0">AUTO</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td id="wwanSecureMode" class="head">Security Mode</td>
                <td >
                    <select id="wwanSecureModeValue"  name="wwanSecureModeValue" onChange="wwanSecureModeSwitch();" >
                        <option value="Disable" id="wwanSecureMode_DISABLE">DISABLE</option>
                        <option value="WEP" id="wwanSecureMode_WEP">WEP</option>
                        <option value="WPAPSK" id="wwanSecureMode_WPAPSK">WPAPSK</option>
                        <option value="WPA2PSK" id="wwanSecureMode_WPA2PSK">WPA2PSK</option>
                    </select>
                </td>
            </tr>
            
            <!--<div id="wwanWepShow"  style="display:none;visibility = hidden" >
                <table style="width:100%;" >-->
            <table id="wwanWepShow" width="540" border="0" cellpadding="2" cellspacing="1">    	                
                    <tr>
                        <td id="wwanWepAuth" class="head">WEP Auth;</td>
                        <td >
                            <select id="wwanWepAuthValue" name="wwanWepAuthValue">
                                <option value="AUTO" id="wwanWepAuth_AUTO">AUTO</option>
                                <option value="OPEN" id="wwanWepAuth_OPEN">OPEN</option>
                                <option value="SHARED" id="wwanWepAuth_SHARED">SHARED</option>
                            </select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td id="wwanWepKeyType">WEP Key Type</td>
                        <td >
                            <select id="wwanWepKeyTypeValue" name="wwanWepKeyTypeValue">                                
                                <option value="0" id="wwanWepKeyType_HEX">HEX</option>
                                <option value="1" id="wwanWepKeyType_ASCII">ASCII</option>
                            </select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td id="wwanWepKeyId">WEP Key ID</td>
                        <td >
                            <select id="wwanWepKeyIdValue" name="wwanWepKeyIdValue">
                                <option value="1" >1</option>
                                <option value="2" >2</option>
                                <option value="3" >3</option>
                                <option value="4" >4</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td id="wwanWepKey1">WEP Key 1</td>
                        <td>
                            <input type="password" id="wwanWepKey1Value" name="wwanWepKey1Value" value="" maxlength=128/>
                        </td>
                    </tr>
                    <tr>
                        <td id="wwanWepKey2">WEP Key 2</td>
                        <td>
                            <input type="password" id="wwanWepKey2Value" name="wwanWepKey2Value" value="" maxlength=128/>
                        </td>
                    </tr>
                    <tr>
                        <td id="wwanWepKey3">WEP Key 3</td>
                        <td>
                            <input type="password" id="wwanWepKey3Value" name="wwanWepKey3Value" value="" maxlength=128/>
                        </td>
                    </tr>
                    <tr>
                        <td id="wwanWepKey4">WEP Key 4</td>
                        <td>
                            <input type="password" id="wwanWepKey4Value" name="wwanWepKey4Value" value="" maxlength=128/>
                        </td>
                    </tr>                    
                </table>
            <!--</div>-->

						<!--
            <div id="wwanWpaPskShow"  style="display:none;visibility = hidden" >
                <table style="width:100%;" >-->
            <table id="wwanWpaPskShow" width="540" border="0" cellpadding="2" cellspacing="1">    
                    <tr>
                        <td id="wwanWpaEncrypt">WPA Algorithms</td>
                        <td >
                            <select id="wwanWpaEncryptValue" name="wwanWpaEncryptValue">
                                <option value="TKIP" id="wwanWpaEncrypt_TKIP">TKIP</option>
                                <option value="AES" id="wwanWpaEncrypt_AES">AES</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td id="wwanWpaKey">WPA Key</td>
                        <td>
                            <input type="password" id="wwanWpaKeyValue" name="wwanWpaKeyValue" value="" maxlength=128/>
                        </td>
                    </tr>
                    
                </table>
            <!--</div>-->
            
            <!--
            <div id="wwanWpaShow"  style="display:none;visibility = hidden" >
            </div>
            -->
            <table id="wwanWpaShow" width="540" border="0" cellpadding="2" cellspacing="1">
          	</table>
          	
          	<table id="wwanScanTable" width="540" border="1" cellpadding="2" cellspacing="1">	
							<tr>
								<td align=center></td>
								<td align=center id="wwanscanNo"> No.</td>
								<td align=center id="wwanscanSSID">SSID</td>
								<td align=center id="wwanscanBSSID">BSSID</td>
								<td align=center id="wwanscanChannel">Channel</td>
								<td align=center id="wwanscanSecurity">Security</td>
								<td align=center id="wwanscanEncrypt">Encrypt</td>
								<td align=center id="wwanscanSignal">Signal(%)</td>
								<td align=center id="wwanscanMode">Mode</td>
							</tr>
						<% showScanResultASP(); %>
					</table>
</table>                        

<br>

<!-- =========== MAC Clone =========== -->
<table width="540" border="0" cellpadding="2" cellspacing="1">
<tr>
  <td id="wMacClone" class="head">MAC Address Clone</td>
  <td class="content">
    <select name="macCloneEnbl" size="1" onChange="macCloneSwitch()">
      <option value="0" id="wMacCloneD">Disable</option>
      <option value="1" id="wMacCloneE">Enable</option>
    </select>
  </td>
</tr>
<tr id="macCloneMacRow">
  <td id="wMacCloneAddr" class="head">MAC Address</td>
  <td class="content">
	<input name="macCloneMac" id="macCloneMac" maxlength=17 value="<% getCfgGeneral(1, "macCloneMac"); %>">
	<input type="button" name="macCloneMacFill" id="macCloneMacFill" value="Fill my MAC" onclick="macCloneMacFillSubmit();" >
 </td>
</tr>
</table>

<table width="540" cellpadding="2" cellspacing="1" border="0">
<tr align="center">
  <td class="content">
    <input type=button style="{width:120px;}" value="Apply" id="wApply" onClick="CheckValue()">&nbsp;&nbsp;
    <input type=reset  style="{width:120px;}" value="Cancel" id="wCancel" onClick="window.location.reload()">
  </td>
</tr>
</table>
</form>

</td></tr></table>
</body>
</html>

