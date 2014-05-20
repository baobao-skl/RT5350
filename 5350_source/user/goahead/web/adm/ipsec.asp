<head>
<title>IPSec Setup</title>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");

var MAX_NUM = 5;
var rules_num = <% getipsecRuleNumsASP(); %> ;
var ikeConnectStatus=0;

function disableTextField (field) 
{
  if (document.all || document.getElementById)
    field.disabled = true;
  else 
  {
    field.oldOnFocus = field.onfocus;
    field.onfocus = skip;
  }
}

function enableTextField (field) 
{
  if (document.all || document.getElementById)
    field.disabled = false;
  else 
  {
    field.onfocus = field.oldOnFocus;
  }
}

function disableButton (button) {
  //if (verifyBrowser() == "ns")
  //	return;
  if (document.all || document.getElementById)
    button.disabled = true;
  else if (button) {
    button.oldOnClick = button.onclick;
    button.onclick = null;
    button.oldValue = button.value;
    button.value = 'DISABLED';
  }
}

function enableButton (button) {
  //if (verifyBrowser() == "ns")
  //	return;
  if (document.all || document.getElementById)
    button.disabled = false;
  else if (button) {
    button.onclick = button.oldOnClick;
    button.value = button.oldValue;
  }
}

function show_div(show,id) 
{
	if(show)
		document.getElementById(id).className  = "on" ;
  else	    
  	document.getElementById(id).className  = "off" ;
}

function disableCheckBox (checkBox) 
{
  if (!checkBox.disabled) 
  {
    checkBox.disabled = true;
    if (!document.all && !document.getElementById) 
    {
      checkBox.storeChecked = checkBox.checked;
      checkBox.oldOnClick = checkBox.onclick;
      checkBox.onclick = preserve;
    }
  }
}

function getDigit(str, num)
{
  i=1;
  if ( num != 1 ) {
  	while (i!=num && str.length!=0) {
		if ( str.charAt(0) == '.' ) {
			i++;
		}
		str = str.substring(1);
  	}
  	if ( i!=num )
  		return -1;
  }
  for (i=0; i<str.length; i++) {
  	if ( str.charAt(i) == '.' ) {
		str = str.substring(0, i);
		break;
	}
  }
  if ( str.length == 0)
  	return -1;
  d = parseInt(str, 10);
  return d;
}

function checkDigitRange(str, num, min, max)
{
  d = getDigit(str,num);
  if ( d > max || d < min )
      	return false;
  return true;
}

function validateKey(str)
{
   for (var i=0; i<str.length; i++) {
    if ( (str.charAt(i) >= '0' && str.charAt(i) <= '9') ||
    		(str.charAt(i) == '.' ) )
			continue;
	return 0;
  }
  return 1;
}

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

function setikeConnected()
{
   ikeConnectStatus = 1;
}

function resetClicked()
{
   document.vpn.reset;
}

function checkIpSubnetAddr(field, msg)
{
  if (field.value=="") {
	alert("IP地址不能为空！应为由4个数字组成的xxx.xxx.xxx.xxx的格式。");
	field.value = field.defaultValue;
	field.focus();
	return false;
  }
   if ( validateKey(field.value) == 0) {
      alert(msg + '值。应为十进制数(0-9)。');
      field.value = field.defaultValue;
      field.focus();
      return false;
   }
   if ( !checkDigitRange(field.value,1,0,255) ) {
      alert(msg+'。第一个数字应在0-255之间。');
      field.value = field.defaultValue;
      field.focus();
      return false;
   }
   if ( !checkDigitRange(field.value,2,0,255) ) {
      alert(msg + '。第二个数字应在0-255之间。');
      field.value = field.defaultValue;
      field.focus();
      return false;
   }
   if ( !checkDigitRange(field.value,3,0,255) ) {
      alert(msg + '。第三个数字应在0-255之间。');
      field.value = field.defaultValue;
      field.focus();
      return false;
   }
   if ( !checkDigitRange(field.value,4,0,255) ) {
      alert(msg + '。第四个数字应在0-255之间。');
      field.value = field.defaultValue;
      field.focus();
      return false;
   }
   return true;
}

function checkVpnSubnet(ip, mask)
{
  
  ip_d = getDigit(ip.value, 1);
  mask_d = getDigit(mask.value, 1);
  ip_d = ip_d & mask_d ;
  strIp = ip_d + '.' ;

  ip_d = getDigit(ip.value, 2);
  mask_d = getDigit(mask.value, 2);
  ip_d = ip_d & mask_d ;
  strIp += ip_d + '.' ;
  

  ip_d = getDigit(ip.value, 3);
  mask_d = getDigit(mask.value, 3);
  ip_d = ip_d & mask_d ;
  strIp += ip_d + '.' ;
  

  ip_d = getDigit(ip.value, 4);
  mask_d = getDigit(mask.value, 4);
  ip_d = ip_d & mask_d ;
  strIp += ip_d ;
  ip.value = strIp ;  
 
  return true ;
}

function checkMask(str, num)
{
  d = getDigit(str,num);
  if( !(d==0 || d==128 || d==192 || d==224 || d==240 || d==248 || d==252 || d==254 || d==255 ))
  	return false;
  return true;
}

function checkIPMask(field)
{

  if (field.value=="") {
      	alert("子网掩码不能为空！应为由4个数字组成的xxx.xxx.xxx.xxx的格式。");
	field.value = field.defaultValue;
	field.focus();
	return false;
  }
  if ( validateKey( field.value ) == 0 ) {
      	alert("无效的子网掩码值。应为十进制数（0-9）。");
      	field.value = field.defaultValue;
	field.focus();
	return false;
  }
  if ( !checkMask(field.value,1) ) {
      	alert('子网掩码的第一个数字无效。\n应为0，128，192，224，240，248，252或254之一');
	field.value = field.defaultValue;
	field.focus();
	return false;
  }

  if ( !checkMask(field.value,2) ) {
      	alert('子网掩码的第二个数字无效。\n应为0，128，192，224，240，248，252或254之一');
	field.value = field.defaultValue;
	field.focus();
	return false;
  }
  if ( !checkMask(field.value,3) ) {
      	alert('子网掩码的第三个数字无效。\n应为0，128，192，224，240，248，252或254之一');
	field.value = field.defaultValue;
	field.focus();
	return false;
  }
  if ( !checkMask(field.value,4) ) {
      	alert('子网掩码的第四个数字无效。\n应为0，128，192，224，240，248，252或254之一');
	field.value = field.defaultValue;
	field.focus();
	return false;
  }
  var subnet = field.value.split(".");
  var first,end;
  base=parseInt("2");
  num = parseInt(subnet[0]);
  p1=num.toString(base);
  num = parseInt(subnet[1]);
  p2=num.toString(base);
  num = parseInt(subnet[2]);
  p3=num.toString(base);
  num = parseInt(subnet[3]);
  p4=num.toString(base);
  
  p=p1+p2+p3+p4;
  
  for(i=0;i<p.length;i++)
  {
    if(p.charAt(i) == '1')
    {
      first=i;
    }
    else
        {
          break;
        }   
  }
  
  end=0;
  
  for(j=i;j<p.length;j++)
  {
    if(p.charAt(j) == '1')
    {
      end=j;
      break;
    }    
  }
   
  if(end > 0)
  {
  alert('无效的子网掩码.\n二进制中1应为连续的.');
	field.value = field.defaultValue;
	field.focus();
	return false;
  }
  else
    return true;
}  

function checkSpace(field, msg)
{
  str = field.value ;
  
  for (i=0; i<str.length; i++) {
  	if ( str.charAt(i) == ' ' ) {
		alert(msg + '。不能包含空格。');
      		field.value = field.defaultValue;
      		field.focus();
      		return false ;	
	}
  }  
  return true ;
}

function validateHex(str)
{
   for (var i=0; i<str.length; i++) {
    if ( (str.charAt(i) >= '0' && str.charAt(i) <= '9') ||
    	(str.charAt(i) >= 'a' && str.charAt(i) <= 'f') || 
    	(str.charAt(i) >= 'A' && str.charAt(i) <= 'F')
    		 )
			continue;
	return 0;
  }
  return 1;
}

function vpnAdvancedClick(url) {
	openWindow(url, 'VPNIkeAdvanced', 600, 570 );
	ike_setup =1 ;
}

function deleteClick()
{
  if ( !confirm('是否删除选中的选项?') ) {
	return false;
  }
  else
	return true;
}

function ConnClick()
{
	return true;
}

function deleteAllClick()
{
   if ( !confirm('是否删除所有选项？') ) {
	return false;
  }
  else
	return true;
}

function keyModeClick()
{
	//document.vpn.submit();
  field = document.vpn.ipsecKeyMode ;
  if(!document.getElementById)
  {
  	alert('错误！您的浏览器必须支持CSS！');
  	return;
  }
  if(document.vpn.ipsecKeyMode.checked)
  {	//Ike mode
		vpnConnTypeChange(document.vpn.vpnConnectType);
  }
  else 
  { 
  	// Manual Mode  	
  }
}

function remoteTypeClick(field)
{
	if(field.selectedIndex == 0){ // single address
		disableTextField(document.vpn.ipsecRemoteIpMask);
		enableTextField(document.vpn.ipsecRemoteGateway);
		enableTextField(document.vpn.ipsecRemoteIp);
	}	
	else if (field.selectedIndex == 1){ // subnet address
		enableTextField(document.vpn.ipsecRemoteGateway);
		enableTextField(document.vpn.ipsecRemoteIpMask);
		enableTextField(document.vpn.ipsecRemoteIp);

	}
	else if (field.selectedIndex == 2){ // any address
		disableTextField(document.vpn.ipsecRemoteGateway);
		disableTextField(document.vpn.ipsecRemoteIpMask);
		disableTextField(document.vpn.ipsecRemoteIp);
	}
	
	else{	// NAT-T address	
		disableTextField(document.vpn.ipsecRemoteGateway);
		enableTextField(document.vpn.ipsecRemoteIpMask);
		enableTextField(document.vpn.ipsecRemoteIp);
	}
 	vpnConnTypeChange(document.vpn.vpnConnectType);
}

function localTypeClick(field)
{

	if(field.selectedIndex == 0){ // single address
		disableTextField(document.vpn.ipsecLocalIpMask);
	}	
	else if (field.selectedIndex == 2){ // any address
		disableTextField(document.vpn.ipsecLocalIpMask);
	}
	else{		
		enableTextField(document.vpn.ipsecLocalIpMask);
	}	
}

function vpnConnTypeChange(field)
{
	enableTextField(document.vpn.vpnConnectType);
	if(field.selectedIndex == 0 || !document.vpn.VPNEnabled.options.selectedIndex ||
		document.vpn.ipsecRemoteType.selectedIndex >=2){ //initiator
		if(document.vpn.ipsecRemoteType.selectedIndex >=2){
			disableTextField(document.vpn.vpnConnectType);
			field.selectedIndex  = 1;
		}		
	}		
}

function initTranslation()
{
	var e = document.getElementById("VPNTitle");
	e.innerHTML = _("vpn title");
	e = document.getElementById("VPNTunnel");
	e.innerHTML = _("vpn tunnel");
	e = document.getElementById("VPNIntroduction");
	e.innerHTML = _("vpn introduction");
	e = document.getElementById("VPNSet");
	e.innerHTML = _("vpn setting");
	e = document.getElementById("VPNSetServer");
	e.innerHTML = _("vpn set ipsec");
	e = document.getElementById("VPNDisable");
	e.innerHTML = _("vpn disable");
	e = document.getElementById("VPNEnable");
	e.innerHTML = _("vpn enable");
	e = document.getElementById("VPNConnName");
	e.innerHTML = _("vpn conn name");
	e = document.getElementById("VPNCheckType");
	e.innerHTML = _("vpn auth type");
	e = document.getElementById("VPNLocalSite");
	e.innerHTML = _("vpn local site");
	e = document.getElementById("VPNSingleAddr");
	e.innerHTML = _("vpn single addr");
	e = document.getElementById("VPNMaskaddr");
	e.innerHTML = _("vpn mask addr");
	e = document.getElementById("VPNLocalIPAddr");
	e.innerHTML = _("vpn local net");
	e = document.getElementById("VPNLocalMask");
	e.innerHTML = _("vpn local mask");
	e = document.getElementById("VPNRemoteSite");
	e.innerHTML = _("vpn remote site");
	e = document.getElementById("VPNRemoteSingleAddr");
	e.innerHTML = _("vpn single addr");
	e = document.getElementById("VPNRemoteMaskaddr");
	e.innerHTML = _("vpn mask addr");
	e = document.getElementById("VPNRemoteGateway");
	e.innerHTML = _("vpn remote gateway");
	e = document.getElementById("VPNRemoteIPAddr");
	e.innerHTML = _("vpn remote ip");
	e = document.getElementById("VPNRemoteMask");
	e.innerHTML = _("vpn remote mask");
	e = document.getElementById("VPNLRID");
	e.innerHTML = _("vpn local remote");
	e = document.getElementById("VPNLocalIDType");
	e.innerHTML = _("vpn localid type");
	e = document.getElementById("VPNLocalID");
	e.innerHTML = _("vpn local id");
	e = document.getElementById("VPNRemoteIDType");
	e.innerHTML = _("vpn remoteid type");
	e = document.getElementById("VPNRemoteID");
	e.innerHTML = _("vpn remote id");
	e = document.getElementById("VPNKeyManagement");
	e.innerHTML = _("vpn key management");
	e = document.getElementById("VPNConnType");
	e.innerHTML = _("vpn conn type");
	e = document.getElementById("VPNLaunch");
	e.innerHTML = _("vpn launch");
	e = document.getElementById("VPNResponse");
	e.innerHTML = _("vpn response");
	e = document.getElementById("VPNEncryption");
	e.innerHTML = _("vpn encryption alg");
	e = document.getElementById("VPNIdentification");
	e.innerHTML = _("vpn identi alg");
	e = document.getElementById("VPNKeyGroup");
	e.innerHTML = _("vpn key group");
	e = document.getElementById("VPNShareKey");
	e.innerHTML = _("vpn share key");
	e = document.getElementById("VPNRemoteRsaKey");
	e.innerHTML = _("vpn remote rsa key");
	e = document.getElementById("VPNApply");
	e.value = _("vpn apply");
	e = document.getElementById("VPNConn");
	e.value = _("vpn conn");
	e = document.getElementById("VPNDisconn");
	e.value = _("vpn disconn");
	e = document.getElementById("VPNReset");
	e.value = _("vpn reset");
	e = document.getElementById("VPNBack");
	e.value = _("vpn back");		
}

function updateState()
{
	initTranslation();
 	vpnConnTypeChange(document.vpn.vpnConnectType);
 	if(document.vpn.VPNEnabled.options.selectedIndex==0)
 	{
 		disableTextField(document.vpn.ipsecConnName);
 		disableTextField(document.vpn.ipsecLocalIp);
 		disableTextField(document.vpn.ipsecLocalIpMask);
 		disableTextField(document.vpn.ipsecRemoteGateway);
 		disableTextField(document.vpn.ipsecRemoteIp);
 		//disableTextField(document.vpn.ikePsKey);
 		//disableTextField(document.vpn.rtRsaKey);
 		disableTextField(document.vpn.vpnConnect);
		disableTextField(document.vpn.vpnDisconnect);		
 	}	
 	else
 	{
 		enableTextField(document.vpn.ipsecConnName);
 		enableTextField(document.vpn.ipsecLocalIp);
 		enableTextField(document.vpn.ipsecLocalIpMask);
 		enableTextField(document.vpn.ipsecRemoteGateway);
 		enableTextField(document.vpn.ipsecRemoteIp);
 		//enableTextField(document.vpn.ikePsKey);
 		//enableTextField(document.vpn.rtRsaKey);
 		
 		enableTextField(document.vpn.vpnConnect);
 		enableTextField(document.vpn.vpnDisconnect);
 		/*
 		if (ikeConnectStatus==0) 
  	{ //disconnected
			enableTextField(document.vpn.vpnConnect);
			disableTextField(document.vpn.vpnDisconnect);
		}
		else
		{
			disableTextField(document.vpn.vpnConnect);
			enableTextField(document.vpn.vpnDisconnect);
		}
		*/
 	}
}

function refreshClick()
{
	if(ike_setup == 0)
		 window.location.reload()
	else{ // form IKE advanced to update something
	//	espAhClick();		
		ike_setup =0; // back form IKE advanced setup
	}
}
function checkEncrKey(field, len, msg, algo)
{
	if(validateHex(field.value) == false)
	{
		alert("无效的" + msg + "！算法" + algo+"要求输入长度为" + len+ "的16进制数。");
		field.value = field.defaultValue;
		field.focus();
		return false;
  }

	// check key length
  var key_len =  field.value.length ;
	if( key_len != len)
	{
		alert("无效的" + msg + "！算法" + algo+"要求输入长度为" + len+ "的16进制数。");
		field.value = field.defaultValue;
		field.focus();
		return false;       
  }
	return true ;
}
function saveChanges()
{
		if(rules_num >= (MAX_NUM-1) )
		{
			if(langtype=="zhcn")
	    	  alert("出错：规则数超过最大规则数");
	    else
					alert("The rule number is exceeded "+ MAX_NUM +".");
			return false;
		}
	 if(document.vpn.VPNEnabled.options.selectedIndex==0)
	 {
	 		alert('VPN设置处于禁止状态');
	 		document.vpn.VPNEnabled.focus();
	 		return false;
	 }
	 
   if (document.vpn.ipsecConnName.value=="") 
   {
      alert('连接名不能为空！');
	  	document.vpn.ipsecConnName.value = document.vpn.ipsecConnName.defaultValue;
	  	document.vpn.ipsecConnName.focus();
	  	return false;
   }
   if(checkSpace(document.vpn.ipsecConnName,'无效连接名') == false)
   		return false;
   if ( document.vpn.ipsecConnName.value.charAt(0) >= '0' && document.vpn.ipsecConnName.value.charAt(0) <= '9')
   {
   		alert("连接名的第一个字符不能是0-9之间的数字。");
			document.vpn.ipsecConnName.value = document.vpn.ipsecConnName.defaultValue;
			document.vpn.ipsecConnName.focus();
			return false;
   }
   if ( checkIpSubnetAddr(document.vpn.ipsecLocalIp, '无效本地地址') == false )
	     return false;
	 
	 /*    
   if (document.vpn.ipsecAuthType.selectedIndex == 1 && document.vpn.ipsecRemoteIdType.selectedIndex == 0) 
   {
   		alert('RSA鉴别算法不能选用IP作为远端ID类型！');
      document.vpn.ipsecAuthType.focus();
      return false;
   }
   */	      
	     
   if (document.vpn.ipsecLocalType.selectedIndex == 1 )
   {	 //subnet address , then check mask
   		if (checkIPMask(document.vpn.ipsecLocalIpMask) == false)
	        return false ;
	
			if (document.vpn.ipsecLocalIpMask.value == "255.255.255.255")
			{
				document.vpn.ipsecLocalType.selectedIndex = 0 ;
				localTypeClick(document.vpn.ipsecLocalType);
			}
   }   
   if( document.vpn.ipsecRemoteType.selectedIndex != 2) 
   {  // not any address
	   if ( checkIpSubnetAddr(document.vpn.ipsecRemoteIp, '无效远端地址') == false )
		     return false;
	   if (document.vpn.ipsecRemoteType.selectedIndex == 1 ||	document.vpn.ipsecRemoteType.selectedIndex == 3  )
	   { //subnet address , then check mask
   			if (checkIPMask(document.vpn.ipsecRemoteIpMask) == false)
	        	return false ;
				if (document.vpn.ipsecRemoteIpMask.value == "255.255.255.255" && document.vpn.ipsecRemoteType.selectedIndex != 3)
				{
						document.vpn.ipsecRemoteType.selectedIndex = 0 ;
						remoteTypeClick(document.vpn.ipsecRemoteType);
				}
	   }
	   if(document.vpn.ipsecRemoteType.selectedIndex != 3)
	   { 	//natt
	    	//if ( validateKey( document.vpn.ipsecRemoteGateway.value ) == 0 ) {
				//alert("无效的远端网关值。应为0-9之间的数字。");
				//document.vpn.ipsecRemoteGateway.value = document.vpn.ipsecRemoteGateway.defaultValue;      
				//document.vpn.ipsecRemoteGateway.focus();
		
				//return false;
	    	//}	     

	   		//if ( checkIpAddr(document.vpn.ipsecRemoteGateway, '无效远端网关地址') == false )
	   		//   return false;	
	  	} // natt
   	} 
   	// if this is a subnet address , corrent the IP to subnet address according subnet mask  
   	if (document.vpn.ipsecLocalType.selectedIndex == 1)
    		checkVpnSubnet(document.vpn.ipsecLocalIp,document.vpn.ipsecLocalIpMask)


   // if this is a subnet address , corrent the IP to subnet address according subnet mask  
   if (document.vpn.ipsecRemoteType.selectedIndex == 1 || document.vpn.ipsecRemoteType.selectedIndex == 3)
      		checkVpnSubnet(document.vpn.ipsecRemoteIp,document.vpn.ipsecRemoteIpMask)
   if (document.vpn.ipsecLocalIdType.selectedIndex!=0 && document.vpn.ipsecLocalId.value=="") 
   {
          alert('本地ID不能为空！');
          document.vpn.ipsecLocalId.value = document.vpn.ipsecLocalId.defaultValue;
          document.vpn.ipsecLocalId.focus();
          return false;
   }	
   if (document.vpn.ipsecLocalIdType.selectedIndex == 2 && document.vpn.ipsecLocalId.value.indexOf("@") ==-1)
   {
	 				alert('错误的电子邮件格式！');
          document.vpn.ipsecLocalId.value = document.vpn.ipsecLocalId.defaultValue;
          document.vpn.ipsecLocalId.focus();
          return false;
   }
   if (document.vpn.ipsecRemoteIdType.selectedIndex!=0 && document.vpn.ipsecRemoteId.value=="") 
   {
          alert('远端ID不能为空！');
          document.vpn.ipsecRemoteId.value = document.vpn.ipsecRemoteId.defaultValue;
          document.vpn.ipsecRemoteId.focus();
          return false;
   }	
   if (document.vpn.ipsecRemoteIdType.selectedIndex == 2 && document.vpn.ipsecRemoteId.value.indexOf("@") ==-1)
   {
	  			alert('错误的电子邮件格式！');
          document.vpn.ipsecRemoteId.value = document.vpn.ipsecRemoteId.defaultValue;
          document.vpn.ipsecRemoteId.focus();
          return false;

   }
   if ( document.vpn.ipsecKeyMode.checked )
   {	// IKE mode
     if(document.vpn.ipsecAuthType.selectedIndex == 0)
     { 		//PSK
	   			if (document.vpn.ikePsKey.value=="") 
	   			{
		  			alert('共享密钥不能为空！');
		  			document.vpn.ikePsKey.value = document.vpn.ikePsKey.defaultValue;
		  			document.vpn.ikePsKey.focus();
		  			return false;
	   			}
	   }
	   else
	   {
		  	if (document.vpn.rtRsaKey.value =="" || document.vpn.rtRsaKey.value.length > 400) 
		  	{
			  	document.vpn.rtRsaKey.value = document.vpn.rtRsaKey.defaultValue;
			  	document.vpn.rtRsaKey.focus();
			  	alert('RSA密钥不能为空或长度超过400');
			  	return false;
		   }
	   }
	   //check the case,  when remote site is any address, connType must be responder
   	 if (document.vpn.ipsecRemoteType.selectedIndex == 2)
   	 { 	// Any address
	   		if(document.vpn.vpnConnectType.selectedIndex == 0)
	   		{ //initiator
					alert('如果远端站点为 任意地址，本地站点必须作为IKE 响应方。');
					document.vpn.vpnConnectType.focus();
					return false;
				}
	   }
	 }  //end IKE
   else
   { 	//Manual Mode
			//Check Remote Site Any address cannot bind with Manual mode
			if(document.vpn.ipsecRemoteType.selectedIndex == 2)
			{
				alert("手动设置密钥时远端站点不能为任意地址。");
				document.vpn.ipsecRemoteType.focus();
				return false;
			}
			//Check ESP Encr -NULL cannot with Manual Mode
			if(document.vpn.ipsecEspEncr.selectedIndex == 2)
			{
				alert("手动设置密钥时不能为空。");
				document.vpn.ipsecEspEncr.focus();
				return false;
			}

   		if(validateHex(document.vpn.ipsecSpi.value) == false)
   		{
   	  	alert("无效的SPI值！应为100-fff之间的值。");
				document.vpn.ipsecSpi.value = document.vpn.ipsecSpi.defaultValue;
				document.vpn.ipsecSpi.focus();
				return false;       	   		
   		}
   		
      spi = parseInt(document.vpn.ipsecSpi.value, 16);
      if((spi > 0xfff) || (spi < 0x100) || document.vpn.ipsecSpi.value == "")
      {
        alert("无效的SPI值！应为100-fff之间的值。");
				document.vpn.ipsecSpi.value = document.vpn.ipsecSpi.defaultValue;
				document.vpn.ipsecSpi.focus();
				return false;                
      }  
	
			// Check Esp Encryption Key Length
			index = document.vpn.ipsecEspEncr.selectedIndex ;
			if(index ==0)
			{ // 3DES
				if(!checkEncrKey(document.vpn.ipsecEncrKey, 48, "ESP加密密钥","3DES"))
					return false;
			}
			else if(index ==1)
			{ // AES
				if(!checkEncrKey(document.vpn.ipsecEncrKey, 32 , "ESP加密密钥","AES128"))
					return false;
			}
			
			index = document.vpn.ipsecEspAuth.selectedIndex ;
			// Check Esp Authenticaiton Key Length
			if(index ==0)
			{ // MD5
	       if(!checkEncrKey(document.vpn.ipsecAuthKey, 32, "ESP鉴别密钥" ,"MD5"))
						return false;
			}
			else if(index ==1)
			{ // SHA-1
	    	if(!checkEncrKey(document.vpn.ipsecAuthKey, 40, "ESP鉴别密钥" ,"SHA1"))
					return false;
			}
   } // end Manual mode 
   
   return true;
}
function remoteIdTypeClick(field)
{
	if(field.selectedIndex == 0)
		disableTextField(document.vpn.ipsecRemoteId);
	else
		enableTextField(document.vpn.ipsecRemoteId);

}

function localIdTypeClick(field)
{
	if(field.selectedIndex == 0)
		disableTextField(document.vpn.ipsecLocalId);
	else
		enableTextField(document.vpn.ipsecLocalId);

}
function authTypeClick(field)
{
	if(field.selectedIndex  == 0)
	{
		disableTextField(document.vpn.rtRsaKey);
		enableTextField(document.vpn.ikePsKey);
	}
	else
	{
		disableTextField(document.vpn.ikePsKey);
		enableTextField(document.vpn.rtRsaKey);
	}
}

</SCRIPT>
</head>

<body onload="updateState()">
<table class="body"><tr><td>
<h1 id="VPNTitle">VPN Settings </h1>
<p id="VPNIntroduction"> You may configure VPN parameter here.</p>

<form action=/goform/formVpnSetup method=POST name="vpn">
<table width="600" border="0" cellpadding="2" cellspacing="1">

<tr>
  <td colspan="2" id="VPNSet" class="title">VPN Settings</td>
</tr>

<tr>
	<td id="VPNTunnel" class="head">Tunnel</td>
	<td class="content"><% ipsecGetNum(); %></td>
</tr>

<tr>
	<td id="VPNSetServer" class="head"><b>
		VPN Settings(IPSec)
	</b></td>	
	<td class="content">
	<select onChange="updateState()" name="VPNEnabled" size="1">		
	<option value=0 <% var cr_bg = getVPNParam(0);
                           if (cr_bg == 0) write("selected"); %> id="VPNDisable">Disable</option>
  <option value=1 <% if (cr_bg == 1) write("selected"); %> id="VPNEnable">Enable</option>
  </select>
  </td>
</tr>

<tr>
	<td id="VPNConnName" class="head"><b>
		Name
	</b></td>
	<td class="content">
  		<input type="text" size="18" maxlength="30" name="ipsecConnName", value="<% getVPNParam(1); %>">
	</td>
</tr>

<tr>
  <td id="VPNCheckType" class="head"><b>
  	Identification Type
  </b></td>
  <td class="content">
	<select size="1" name="ipsecAuthType"  onChange="authTypeClick(this)">
		<option  value=0 <% var cr_bg = getVPNParam(2);
                           if (cr_bg == 0) write("selected"); %>>PSK</option>
		<option  value=1 <% if (cr_bg == 1) write("selected"); %>>RSA</option>
	</select> 
  </td>
</tr>

<tr>
	<td id="VPNLocalSite" class="head"><b>
		Local Site
	</b></td>
  <td class="content">
		<select size="1" name="ipsecLocalType"  onChange="localTypeClick(this)">
			<option id="VPNSingleAddr" value=0 <% var cr_bg = getVPNParam(3);
                           if (cr_bg == 0) write("selected"); %>>single address</option>
			<option id="VPNMaskaddr" value=1 <% if (cr_bg == 1) write("selected"); %>>Mask address</option>
	  </select>
  </td>
</tr>
    
<tr>
 	<td id="VPNLocalIPAddr" class="head">
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; local ip/net
  </td>
  <td class="content">
  	<input type="text" name="ipsecLocalIp" size="16" value="<% getVPNParam(4); %>">
  </td>
</tr>     

<tr>
	<td id="VPNLocalMask" class="head">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; locak mask
	</td>
  <td class="content">
  	<input type="text" name="ipsecLocalIpMask" size="16" value="<% getVPNParam(5); %>">
  </td>
</tr>    
    
<tr>
  <td id="VPNRemoteSite" class="head"><b>
  	Remote Site
  </b></td>
  <td class="content">
	 <select size="1" name="ipsecRemoteType"  onChange="remoteTypeClick(this)">
		<option id="VPNRemoteSingleAddr" value=0 <% var cr_bg = getVPNParam(6);
                           if (cr_bg == 0) write("selected"); %>>single address</option>
		<option id="VPNRemoteMaskaddr" value=1 <% if (cr_bg == 1) write("selected"); %>>mask address</option>
	 </select>   	  		
  </td>
</tr>     

<tr>
	<td id="VPNRemoteGateway" class="head">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Remote Gateway
	</td>
  <td class="content">
  	<input type="text" name="ipsecRemoteGateway" size="16" value="<% getVPNParam(7); %>">
  </td>
</tr>
     
<tr>
	<td id="VPNRemoteIPAddr" class="head">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;remote ip/net
	</td>
	<td class="content">
  	<input type="text" name="ipsecRemoteIp" size="16" value="<% getVPNParam(8); %>">
  </td>
</tr>
         
<tr>
	<td id="VPNRemoteMask" class="head">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Remote Mask
	</td>
  <td class="content">
  	<input type="text" name="ipsecRemoteIpMask" size="16" value="<% getVPNParam(9); %>">
  </td>
</tr>
    
<tr>
	<td id="VPNLRID" class="head"><b>
		local/remote ID
	</b></td>
	<td> 
	</td>
</tr>
       
<tr>
	<td id="VPNLocalIDType" class="head">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; local id type
	</td>
  <td class="content">
	 <select size="1" name="ipsecLocalIdType"  onChange="localIdTypeClick(this)">
		<option   value=0 <% var cr_bg = getVPNParam(10);
                           if (cr_bg == 0) write("selected"); %>>IP</option>
		<option   value=1 <% if (cr_bg == 1) write("selected"); %>>DNS</option>
		<option   value=2 <% if (cr_bg == 2) write("selected"); %>>Email</option>
	 </select> 
  </td>
</tr> 

<tr>
	<td id="VPNLocalID" class="head">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; local id
	</td>
  <td class="content">
      <input type="text" name="ipsecLocalId" size="18" value="<% getVPNParam(11); %>">
  </td>
</tr>

<tr>
	<td id="VPNRemoteIDType" class="head">
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; remote id type
	</td>	
  <td class="content">
   <select size="1" name="ipsecRemoteIdType"  onChange="remoteIdTypeClick(this)">
		<option   value=0 <% var cr_bg = getVPNParam(12);
                           if (cr_bg == 0) write("selected"); %>>IP</option>
		<option   value=1 <% if (cr_bg == 1) write("selected"); %>>DNS</option>
		<option   value=2 <% if (cr_bg == 2) write("selected"); %>>Email</option>
	 </select> 
   </td>
</tr> 

<tr>
	<td id="VPNRemoteID" class="head">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; remote id
	</td>
  <td class="content">
  	<input type="text" name="ipsecRemoteId" size="18" value="<% getVPNParam(13); %>">
  </td>
</tr>
   
<tr>
  <td id="VPNKeyManagement" class="head"><b>
  	key management
  </b></td>
  <td class="content">
  	<input type="checkbox" name="ipsecKeyMode" value="ON"   checked onClick="return keyModeClick()">IKE &nbsp;&nbsp;
	</td>	  
</tr>

<tr>
	<td id="VPNConnType" class="head">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;connect type
	</td>
  <td class="content">
  	<select size="1" name="vpnConnectType" onChange="vpnConnTypeChange(this)">
    	<option id="VPNLaunch" value=0 <% var cr_bg = getVPNParam(14);
                           if (cr_bg == 0) write("selected"); %>>launch</option>
    	<option id="VPNResponse" value=1 <% if (cr_bg == 1) write("selected"); %>>Response</option>
    </select>    
	</td>
</tr>

           
<tr>
	<td id="VPNEncryption" class="head">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;encryption algorithm 
	</td>
  <td class="content">
		<select size="1" name="ipsecEspEncr" >
			<option  value=0 <% var cr_bg = getVPNParam(15);
                           if (cr_bg == 0) write("selected"); %>>3DES</option>
			<option  value=1 <% if (cr_bg == 1) write("selected"); %>>AES128</option>
			<option  value=2 <% if (cr_bg == 2) write("selected"); %>>NULL</option>
		</select>
	</td>
</tr>
 
<tr>
	<td id="VPNIdentification" class="head">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;identification algorithm
	</td>
	<td class="content">	
		<select size="1" name="ipsecEspAuth">
			<option  selected value=0 <% var cr_bg = getVPNParam(16);
                           if (cr_bg == 0) write("selected"); %>>MD5</option>
			<option   value=1 <% if (cr_bg == 1) write("selected"); %>>SHA1</option>
		</select>
	</td>
</tr>

<tr>
	<td id="VPNKeyGroup" class="head">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;key group
	</td>
	<td class="content">
		<select size="1" name="ipsecKeyGroup">
			<option  value=0 <% var cr_bg = getVPNParam(17);
                           if (cr_bg == 0) write("selected"); %>>DH2(modp1024)</option>
			<option   value=1 <% if (cr_bg == 1) write("selected"); %>>DH5(modp1536)</option>
		</select>
	</td>
</tr>

<tr>
	<td id="VPNShareKey" class="head">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;shared key
	</td>
  <td class="content">
  	<input type="text" name="ikePsKey" size="18" maxlength="30" value="<% getVPNParam(18); %>">
  </td>
</tr>

<tr>
	<td id="VPNRemoteRsaKey" class="head">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;remote rsa key
	</td>
  <td class="content">
  	<input type="text" name="rtRsaKey" size="18" maxlength="400" value="<% getVPNParam(19); %>">
  </td>
</tr>
<script>
	// change select enable or disable
	keyModeClick();
		//espAhClick();
	localTypeClick(document.vpn.ipsecLocalType);
	remoteTypeClick(document.vpn.ipsecRemoteType);
	localIdTypeClick(document.vpn.ipsecLocalIdType);
	remoteIdTypeClick(document.vpn.ipsecRemoteIdType);
	authTypeClick(document.vpn.ipsecAuthType);
	disableCheckBox(document.vpn.ipsecKeyMode);
</script>
<tr>
	<td colspan=2  class="content">
		<input type="submit" value="Apply" id="VPNApply" name="vpnsave" onClick="return saveChanges()">&nbsp;&nbsp;
		<input type="submit" id="VPNConn" value="Connect" name="vpnConnect" onClick="return saveChanges()">&nbsp;&nbsp;
		<input type="submit" id="VPNDisconn" value="Disconnect" name="vpnDisconnect" >&nbsp;&nbsp;
		<input type="reset" value="Reset" id="VPNReset" name="vpnreset" onClick="resetClicked()">&nbsp;&nbsp;
		<input type="button" value="Back" id="VPNBack"  name="vpnback" onClick="window.location='vpn_setup.asp'">
	</td>
</tr>	
</table>  
</form>

</td></tr></table>
</body>
</html>
