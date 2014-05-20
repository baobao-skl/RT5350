<html><head><title>QoS/Bandwidth Management Settings</title>

<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("internet");

function initTranslation()
{
	var e;

	e = document.getElementById("QoSTitleStr");
	e.innerHTML = _("qos title");
	e = document.getElementById("QoSIntroStr");
	e.innerHTML = _("qos intro");
	e = document.getElementById("QoSSetupStr");
	e.innerHTML = _("qos setup");
	
	e = document.getElementById("QoSUploadBandWidth");
	e.innerHTML = _("qos upload band width");
	e = document.getElementById("QoSDownloadBandWidth");
	e.innerHTML = _("qos download band width");
	e = document.getElementById("QoSStartIp");
	e.innerHTML = _("qos start ip");
	e = document.getElementById("QoSEndIp");
	e.innerHTML = _("qos end ip");
	e = document.getElementById("QoSDirection");
	e.innerHTML = _("qos direction");
	e = document.getElementById("QoSMinStreamRate");
	e.innerHTML = _("qos min stream rate");
	e = document.getElementById("QoSMaxStreamRate");
	e.innerHTML = _("qos max stream rate");
	
	e = document.getElementById("DownDirec");
	e.innerHTML = _("qos down direction");
	e = document.getElementById("UpDirec");
	e.innerHTML = _("qos up direction");
	
	e = document.getElementById("QosCurrentFilter");
	e.innerHTML = _("qos current filter");
	e = document.getElementById("QosCurrentFilterNo");
	e.innerHTML = _("qos current filter no");
	e = document.getElementById("QosUploadBandWidthShow");
	e.innerHTML = _("qos upload band width show");
	e = document.getElementById("QosDownloadBandWidthShow");
	e.innerHTML = _("qos download band width show");
	e = document.getElementById("QosStartIpShow");
	e.innerHTML = _("qos start ip show");
	e = document.getElementById("QosEndIpShow");
	e.innerHTML = _("qos end ip show");
	e = document.getElementById("QosDirectionShow");
	e.innerHTML = _("qos direction show");
	e = document.getElementById("QosMaxStreamRateShow");
	e.innerHTML = _("qos max stream rate show");
	e = document.getElementById("QosMinStreamRateShow");
	e.innerHTML = _("qos min stream rate show");
	
	e = document.getElementById("portCurrentFilterDel");
	e.value = _("qos del select");
	e = document.getElementById("portCurrentFilterReset");
	e.value = _("qos reset");
	
	if(document.getElementById("portCurrentFilterDefaultDrop")){
		e = document.getElementById("portCurrentFilterDefaultDrop");
		e.innerHTML = _("firewall default drop");
	}
	if(document.getElementById("portCurrentFilterDefaultAccept")){
		e = document.getElementById("portCurrentFilterDefaultAccept");
		e.innerHTML = _("firewall default accept");
	}
	
	e = document.getElementById("QoSSetupSubmitStr");
	e.value = _("qos setup submit");
}

function onInit()
{
	initTranslation();
}

function isMatchIpAddress(startaddr,endaddr)
{
	var i = 0;

	var addrParts_1 = startaddr.split('.');
	var addrParts_2 = endaddr.split('.');

	for(i=0; i<3; i++)
	{
		var num_1 = parseInt(addrParts_1[i]);
		var num_2 = parseInt(addrParts_2[i]);
		if(num_1 != num_2)
			return false;
	}

	var num_1 = parseInt(addrParts_1[3]);
	var num_2 = parseInt(addrParts_2[3]);

	if(num_1>num_2)
		return false;

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

function checkRange(str, num, min, max)
{
	d = atoi(str, num);
	if (d > max || d < min)
		return false;
	return true;
}

function deleteClick()
{
    return true;
}
function isAllNum(str)
{
	for (var i=0; i<str.length; i++){
	    if((str.charAt(i) >= '0' && str.charAt(i) <= '9') || (str.charAt(i) == '.'))
			continue;
		return 0;
	}
	return 1;
}

function isNumOnly(str)
{
	for (var i=0; i<str.length; i++){
	    if((str.charAt(i) >= '0' && str.charAt(i) <= '9') )
			continue;
		return 0;
	}
	return 1;
}

function isAllNumAndSlash(str)
{
	for (var i=0; i<str.length; i++){
	    if( (str.charAt(i) >= '0' && str.charAt(i) <= '9') || (str.charAt(i) == '.') || (str.charAt(i) == '/'))
			continue;
		return 0;
	}
	return 1;
}

function checkIpAddr(field)
{
	if(field.value == "")
		return false;

	if (isAllNumAndSlash(field.value) == 0){
		return false;
	}

	var ip_pair = new Array();
	ip_pair = field.value.split("/");

	if(ip_pair.length > 2){
		return false;
	}

	if(ip_pair.length == 2){
		// sub mask
		if(!ip_pair[1].length)
			return false;
		if(!isNumOnly(ip_pair[1])){
			return false;
		}
		tmp = parseInt(ip_pair[1], 10);
		if(tmp < 0 || tmp > 32){
			return false;
		}
	}

    if( (!checkRange(ip_pair[0],1,0,255)) ||
		(!checkRange(ip_pair[0],2,0,255)) ||
		(!checkRange(ip_pair[0],3,0,255)) ||
		(!checkRange(ip_pair[0],4,0,254)) ){
		return false;
    }
	return true;
}

function QoSSetupCheck(){
       with ( document.forms[0] ) {  

    		var upwidth = parseInt(upband.value); 
    		if( isNaN(upwidth) || (0==upwidth)) 
    		{ 
    			if (document.cookie.length > 0) {
					var s = document.cookie.indexOf("language=");
					var e = document.cookie.indexOf(";", s);
					var lang = "en";
					var i;
			
					if (s != -1) {
						if (e == -1)
							lang = document.cookie.substring(s+9);
						else
							lang = document.cookie.substring(s+9, e);
					}
						if(lang == "zhcn"){
							alert('上传带宽 \"' + upband.value + '\" 无效.'); 
						}
						else
							alert('Upload BandWidth \"' + upband.value + '\" unvalid.'); 
					}
    			return false; 
    		}  
    		var downwidth = parseInt(downband.value); 
    		if(isNaN(downwidth)||(0==downwidth)) 
    		{ 
    			if (document.cookie.length > 0) {
					var s = document.cookie.indexOf("language=");
					var e = document.cookie.indexOf(";", s);
					var lang = "en";
					var i;
			
					if (s != -1) {
						if (e == -1)
							lang = document.cookie.substring(s+9);
						else
							lang = document.cookie.substring(s+9, e);
					}
						if(lang == "zhcn"){
							alert('下载带宽 \"' + downband.value + '\" 无效.'); 
						}
						else
							alert('Download BandWidth \"' + downband.value + '\" unvalid.'); 
					}
    			
    			return false; 
    		}  


   
       if ( (checkIpAddr(srcIp) == false) ) 
       { 
       	if (document.cookie.length > 0) {
					var s = document.cookie.indexOf("language=");
					var e = document.cookie.indexOf(";", s);
					var lang = "en";
					var i;
			
					if (s != -1) {
						if (e == -1)
							lang = document.cookie.substring(s+9);
						else
							lang = document.cookie.substring(s+9, e);
					}
						if(lang == "zhcn"){
							alert('起始Ip \"' + srcIp.value + '\" 是不可用的 IP地址');  
						}
						else
							alert('Start Ip \"' + srcIp.value + '\" is invalid IP address.');
					}
       		
       		return false; 
       } 
       if ( (checkIpAddr(destIp) == false) ) 
       { 
       	
       	if (document.cookie.length > 0) {
					var s = document.cookie.indexOf("language=");
					var e = document.cookie.indexOf(";", s);
					var lang = "en";
					var i;
			
					if (s != -1) {
						if (e == -1)
							lang = document.cookie.substring(s+9);
						else
							lang = document.cookie.substring(s+9, e);
					}
						if(lang == "zhcn"){
							alert('结束Ip \"' + destIp.value + '\" 是不可用的 IP 地址.');  
						}
						else
							alert('End Ip \"' + destIp.value + '\" is invalid IP address.');
					}
       		
       		return false; 
       } 



    		if(isMatchIpAddress(srcIp.value, destIp.value) == false) 
    		{ 
    			if (document.cookie.length > 0) {
					var s = document.cookie.indexOf("language=");
					var e = document.cookie.indexOf(";", s);
					var lang = "en";
					var i;
			
					if (s != -1) {
						if (e == -1)
							lang = document.cookie.substring(s+9);
						else
							lang = document.cookie.substring(s+9, e);
					}
						if(lang == "zhcn"){
							alert('起始IP与结束IP不匹配,或者起始IP大于结束IP'); 
						}
						else
							alert('Start Ip address is not match End Ip address,or Start IP address is larger than End IP address');
					}
    			
    			return false; 
    		} 
    		var direction = chkdirec[chkdirec.selectedIndex].value; 
    		var minwidth = parseInt(minrate.value);  
    		if(isNaN(minwidth)||(0 == minwidth)) 
    		{ 
    			if (document.cookie.length > 0) {
					var s = document.cookie.indexOf("language=");
					var e = document.cookie.indexOf(";", s);
					var lang = "en";
					var i;
			
					if (s != -1) {
						if (e == -1)
							lang = document.cookie.substring(s+9);
						else
							lang = document.cookie.substring(s+9, e);
					}
						if(lang == "zhcn"){
							alert('最小带宽 \"' + minrate.value + '\" 无效.'); 
						}
						else
							alert('Min Stream Rate \"' + minrate.value + '\" unvalid.'); 
					}
    			
    			return false; 
    		}  
    		var maxwidth = parseInt(maxrate.value); 
    		if(isNaN(maxwidth)||(0 == maxwidth)) 
    		{ 
    			if (document.cookie.length > 0) {
					var s = document.cookie.indexOf("language=");
					var e = document.cookie.indexOf(";", s);
					var lang = "en";
					var i;
			
					if (s != -1) {
						if (e == -1)
							lang = document.cookie.substring(s+9);
						else
							lang = document.cookie.substring(s+9, e);
					}
						if(lang == "zhcn"){
							alert('最大带宽 \"' +maxrate.value + '\" 无效.'); 
						}
						else
							alert('Max Stream Rate \"' + maxrate.value + '\" unvalid.'); 
					}
    			
    			return false; 
    		}  
    		if(minwidth > maxwidth) 
    		{ 
    			if (document.cookie.length > 0) {
					var s = document.cookie.indexOf("language=");
					var e = document.cookie.indexOf(";", s);
					var lang = "en";
					var i;
			
					if (s != -1) {
						if (e == -1)
							lang = document.cookie.substring(s+9);
						else
							lang = document.cookie.substring(s+9, e);
					}
						if(lang == "zhcn"){
							alert('最小带宽 > 最大带宽'); 
						}
						else
							alert('Min Stream Rate > Max Stream Rate');
					}
    			
    			return false; 
    		}  
    		if(direction == 'upload') 
    		{ 
    			if(maxwidth > upwidth) 
    			{ 
    				if (document.cookie.length > 0) {
					var s = document.cookie.indexOf("language=");
					var e = document.cookie.indexOf(";", s);
					var lang = "en";
					var i;
			
					if (s != -1) {
						if (e == -1)
							lang = document.cookie.substring(s+9);
						else
							lang = document.cookie.substring(s+9, e);
					}
						if(lang == "zhcn"){
							alert('最大带宽 > 上传带宽'); 
						}
						else
							alert('Max Stream Rate > Upload bandWidth');
					}
    				
    				return false; 
    			}
    		}
    		else
    		{
    			if(maxwidth > downwidth)
    			{
    				if (document.cookie.length > 0) {
					var s = document.cookie.indexOf("language=");
					var e = document.cookie.indexOf(";", s);
					var lang = "en";
					var i;
			
					if (s != -1) {
						if (e == -1)
							lang = document.cookie.substring(s+9);
						else
							lang = document.cookie.substring(s+9, e);
					}
						if(lang == "zhcn"){
							alert('最大带宽 > 下载带宽');
						}
						else
							alert('Max Stream Rate > Download BandWidth');
					}
    				
    				return false;
    			}
    		}  
   }
   return true;
}

</script>
</head>
<!--     body      -->
<body onload="onInit()">
<table class="body"><tbody><tr><td>
<h1 id="QoSTitleStr">Quality of Service Settings </h1>
<p id="QoSIntroStr"> You may setup rules to provide Quality of Service guarantees for specific applications.</p>

<form method="post" name="QoSSetup" action="/goform/QoSSetupEx" onSubmit="return QoSSetupCheck()">
<table border=0 bordercolor=#9BABBD width="540">
<tr>
	<td class="title" colspan="2" id="QoSSetupStr">QoS Setup </td>
</tr>
<tr>
	<td id="QoSUploadBandWidth" class="head">
		Upload BandWidth
	</td>

	<td class="content">
		<input type="text" size="9" name="upband">kbps
	</td>
</tr>
<tr>
	<td id="QoSDownloadBandWidth" class="head">
		Download BandWidth
	</td>

	<td class="content">
		<input type="text" size="9" name="downband">kbps
	</td>
</tr>
<tr>
	<td id="QoSStartIp" class="head">
		Start Ip
	</td>

	<td class="content">
		<input type="text" size="16" name="srcIp">
	</td>
</tr>
<tr>
	<td id="QoSEndIp" class="head">
		End Ip
	</td>

	<td class="content">
		<input type="text" size="16" name="destIp">
	</td>
</tr>
<tr>
	<td id="QoSDirection" class="head">
		Direction
	</td>

	<td class="content">
		<select name="chkdirec" id="chkdirec">
		<option id="DownDirec" value="download">download</option>
		<option id="UpDirec" value="upload">upload</option>
		</select>
	</td>
</tr>
<tr>
	<td id="QoSMinStreamRate" class="head">
		Min Stream Rate
	</td>

	<td class="content">
		<input type="text" size="9" name="minrate">kbps
	</td>
</tr>
<tr>
	<td id="QoSMaxStreamRate" class="head">
		Max Stream Rate
	</td>

	<td class="content">
		<input type="text" size="9" name="maxrate">kbps
	</td>
</tr>

</table>
<input value="Apply" id="QoSSetupSubmitStr" name="QoSSetupSubmitStr"  type="submit"> &nbsp;&nbsp;
<!--
<input value="Reset" id="QoSSetupResetStr" name="QoSSetupResetStr" type="reset">
-->
</form>

<br>
<!-- =========================  delete rules  ========================= -->
<form action=/goform/QoSDeleteRulesEx method=POST name="QoSDeleteRulesEx">

<table width="500" border="1" cellpadding="2" cellspacing="1">	
	<tr>
		<td colspan="8" id="QosCurrentFilter"  class="title">Current Qos  rules in system: </td>
	</tr>

	<tr>
		<td id="QosCurrentFilterNo"> No.</td>
		<td align=center id="QosUploadBandWidthShow"> Upload BandWidth</td>
		<td align=center id="QosDownloadBandWidthShow"> Download BandWidth</td>
		<td align=center id="QosStartIpShow"> Start Ip </td>
		<td align=center id="QosEndIpShow"> End Ip </td>
		<td align=center id="QosDirectionShow"> Direction</td>
		<td align=center id="QosMinStreamRateShow"> Min Stream Rate</td>
		<td align=center id="QosMaxStreamRateShow"> Max Stream Rate</td>
	</tr>

	<% showQoSRulesASP(); %>
	
</table>
<input type="submit" value="Delete Selected" id="portCurrentFilterDel" name="deleteQoSRules" onClick="return deleteClick()">&nbsp;&nbsp;
<input type="reset" value="Reset" id="portCurrentFilterReset" name="reset">
</form>

</td></tr></tbody></table>
</body></html>

