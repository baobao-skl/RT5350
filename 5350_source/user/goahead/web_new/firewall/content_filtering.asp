<html>
<head>
<title>Content Filter Settings</title>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("firewall");
var langtype = "<% getLangType(); %>";

var URLFilterNum = 0;
var HostFilterNum = 0;

var langtype = '<% getLangType(); %>';

function deleteClick()
{
    return true;
}

function formCheck()
{
   return true;
}

function initTranslation()
{
	// e = document.getElementById("ContentFilterTitle");
	//e.innerHTML = _("content filter title");
	var e = document.getElementById("ContentFilterIntrodution");
	e.innerHTML = _("content filter introduction");
	//e = document.getElementById("WebsContentFilter");
	//e.innerHTML = _("content filter webs content filter");
	//e = document.getElementById("WebsContentFilterFilter");
	//e.innerHTML = _("content filter webs content filter filter");
	//e = document.getElementById("WebsContentFilterApply");
	//e.value = _("content filter webs content filter apply");	
	//e = document.getElementById("WebsContentFilterReset");
	//e.value = _("content filter webs content filter reset");	
	e = document.getElementById("WebURLFilterTitle");
	e.innerHTML = _("content filter webs URL filter title");	
	e = document.getElementById("WebURLFilterCurrent");
	e.innerHTML = _("content filter webs url filter current");	
	e = document.getElementById("WebURLFilterNo");
	e.innerHTML = _("content filter webs url fitler No");	
	e = document.getElementById("WebURLFilterURL");
	e.innerHTML = _("content filter webs url fitler url");	
	e = document.getElementById("WebURLFilterDel");
	e.value = _("content filter webs url fitler del");
	e = document.getElementById("WebURLFilterReset");
	e.value = _("content filter webs url fitler reset");
	e = document.getElementById("WebURLFilterAddTitle");
	e.innerHTML = _("content filter webs url fitler add title");	
	e = document.getElementById("WebURLFilterAdd");
	e.value = _("content filter webs url fitler add");		
	e = document.getElementById("WebURLFilterReset1");
	e.value = _("content filter webs url fitler reset1");		
	//e = document.getElementById("WebsHostFilterTitle");
	//e.innerHTML = _("content filter webs host fitler title");		
	//e = document.getElementById("WebsHostFilterCurrent");
	//e.innerHTML = _("content filter webs host fitler current");	
	//e = document.getElementById("WebsHostFilterNo");
	//e.innerHTML = _("content filter webs host fitler no");	
	//e = document.getElementById("WebsHostFilterHost");
	//e.innerHTML = _("content filter webs host fitler host");	
	//e = document.getElementById("WebsHostFilterDel");
	//e.value = _("content filter webs host fitler del");	
	//e = document.getElementById("WebsHostFilterReset");
	//e.value = _("content filter webs host fitler reset");	
	//e = document.getElementById("WebsHostFilterAddTitle");
	//e.innerHTML = _("content filter webs host fitler add title");	
	//e = document.getElementById("WebsHostFilterKeyword");
	//e.innerHTML = _("content filter webs host fitler keyword");	
	//e = document.getElementById("WebsHostFilterAdd");
	//e.value = _("content filter webs host fitler add");	
	//e = document.getElementById("WebsHostFilterReset");
	//e.value = _("content filter webs host fitler reset");	

}

function updateState()
{
	initTranslation();
	//if (document.webContentFilter.websFilterProxy.value == "1")
	//	document.webContentFilter.websFilterProxy.checked = true;
	//if (document.webContentFilter.websFilterJava.value == "1")
	//	document.webContentFilter.websFilterJava.checked = true;
	//if (document.webContentFilter.websFilterActivex.value == "1")
	//	document.webContentFilter.websFilterActivex.checked = true;
/*
	if (document.webContentFilter.websFilterCookies.value == "1")
		document.webContentFilter.websFilterCookies.checked = true;
*/
}

function webContentFilterClick()
{
	//document.webContentFilter.websFilterProxy.value = document.webContentFilter.websFilterProxy.checked ? "1": "0";
	//document.webContentFilter.websFilterJava.value = document.webContentFilter.websFilterJava.checked ? "1": "0";
	//document.webContentFilter.websFilterActivex.value = document.webContentFilter.websFilterActivex.checked ? "1": "0";
	//document.webContentFilter.websFilterCookies.value = document.webContentFilter.websFilterCookies.checked ? "1": "0";
	return true;
}

function deleteWebsURLClick()
{
	for(i=0; i< URLFilterNum; i++){
		var tmp = eval("document.websURLFilterDelete.DR"+i);
		if(tmp.checked == true)
			return true;
	}
	if(langtype=="zhcn")
    	  alert("请选择要被删除的规则");
    	  else
	alert("Please select the rule to be deleted.");
	return false;
}

function AddWebsURLFilterClick()
{
	if(document.websURLFilter.addURLFilter.value == ""){
		if(langtype=="zhcn")
    	  alert("请输入URL过滤关键字");
    	  else
		alert("Please enter a URL filter.");
		return false;
	}
	return true;
}

//function deleteWebsHostClick()
//{
//	for(i=0; i< HostFilterNum; i++){
//		var tmp = eval("document.websHostFilterDelete.DR"+i);
//		if(tmp.checked == true)
//			return true;
//	}
//	alert("Please select the rule to be deleted.");
//	return false;
//}

function AddWebsHostFilterClick()
{
	if(document.websHostFilter.addHostFilter.value == ""){
		if(langtype=="zhcn")
    	  alert("请输入过滤主机名");
    	  else
		alert("Please enter a host filter.");
		return false;
	}
	return true;
}

</script>
</head>


                         <!--     body      -->
<body onload="updateState()">
<table class="body"><tr><td>
<!--<h1 id="ContentFilterTitle">Content Filter  Settings </h1>-->


<!--<form method=post name="webContentFilter" action=/goform/webContentFilter>
<table width="500" border="1" cellpadding="2" cellspacing="1">
<tr>
  <td class="title" colspan="2" id="WebsContentFilter">Webs Content Filter</td>
</tr>
<tr>
	<td class="head" id="WebsContentFilterFilter">
		Filter:
	</td>
	<td>
		<input type=checkbox name=websFilterProxy value="<% getCfgZero(1, "websFilterProxy"); %>" > Proxy
		<input type=checkbox name=websFilterJava value="<% getCfgZero(1, "websFilterJava"); %>" > Java
		<input type=checkbox name=websFilterActivex value="<% getCfgZero(1, "websFilterActivex"); %>" > ActiveX
<!--	<input type=checkbox name=websFilterCookies value="<% getCfgZero(1, "websFilterCookies"); %>" > Cookies  -->
	<!--</td>
</tr>
</table>
<p>
	<input type="submit" value="Apply" id="WebsContentFilterApply" name="addFilterPort" onClick=" return webContentFilterClick() "> &nbsp;&nbsp;
	<input type="reset" value="Reset" id="WebsContentFilterReset" name="reset">
</p>
</form>-->
<h1 id="WebURLFilterTitle">Webs URL Filter Settings </h1>
<% checkIfUnderBridgeModeASP(); %>
<p id="ContentFilterIntrodution"></p>
<form action=/goform/websURLFilterDelete method=POST name="websURLFilterDelete">
<table width="400" border="0" cellpadding="2" cellspacing="1">	
	<tr>
		<td colspan="2" id="WebURLFilterCurrent" class="title">Current Webs URL Filters: </td>
	</tr>

	<tr>
		<td id="WebURLFilterNo" class='head'> No.</td>
		<td id="WebURLFilterURL" class='head'> URL</td>
	</tr>

	<script language="JavaScript" type="text/javascript">
	var i;
	var entries = new Array();
	var all_str = "<% getCfgGeneral(1, "websURLFilters"); %>";

	if(all_str.length){
		entries = all_str.split(";");
		for(i=0; i<entries.length; i++){
			if(i==entries.length-1){
				document.write("<tr><td class='content'>");
				document.write(i+1);
				document.write("<input type=checkbox name=DR"+i+"></td>");
		
				document.write("<td class='content'>"+ entries[i] +"</td>");
				document.write("</tr>\n");
			}else{
				document.write("<tr><td>");
				document.write(i+1);
				document.write("<input type=checkbox name=DR"+i+"></td>");
		
				document.write("<td>"+ entries[i] +"</td>");
				document.write("</tr>\n");
			}
		}

		URLFilterNum = entries.length;
	}
	</script>
	<tr>
		<td colspan=2  class="content">
			<input type="submit" value="Delete" id="WebURLFilterDel" name="deleteSelPortForward" onClick="return deleteWebsURLClick()">&nbsp;&nbsp;
			<input type="reset" value="Reset" id="WebURLFilterReset" name="reset">
		</td>
	</tr>
</table>

</form>

<form action=/goform/websURLFilter method=POST name="websURLFilter">
<table width="400" border="0" cellpadding="2" cellspacing="1"  class="borderStyle">	
	<tr>
		<td colspan="2" id="WebURLFilterAddTitle"  class="borderStyle1">Add a URL Filter: </td>
	</tr>
	<tr>
		<td class="borderStyle1">URL: </td>
		<td class="borderStyle1"> <input name="addURLFilter" size="16" maxlength="32" type="text"> </td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="Add" id="WebURLFilterAdd" name="addwebsurlfilter" onClick="return AddWebsURLFilterClick()">&nbsp;&nbsp;
			<input type="reset" value="Reset" id="WebURLFilterReset1" name="reset">
		</td>
	</tr>
</table>

</form>



<!--
<h1 id="WebsHostFilterTitle">Webs Host Filter Settings </h1>
<form action=/goform/websHostFilterDelete method=POST name="websHostFilterDelete">
<table width="400" border="1" cellpadding="2" cellspacing="1">	
	<tr>
		<td class="title" colspan="5" id="WebsHostFilterCurrent">Current Website Host Filters: </td>
	</tr>

	<tr>
		<td id="WebsHostFilterNo"> No.</td>
		<td id="WebsHostFilterHost"> Host(Keyword)</td>
	</tr>

	<script language="JavaScript" type="text/javascript">
	var i;
	var entries = new Array();
	var all_str = "<% getCfgGeneral(1, "websHostFilters"); %>";

	if(all_str.length){
		entries = all_str.split(";");

		for(i=0; i<entries.length; i++){
			document.write("<tr><td>");
			document.write(i+1);
			document.write("<input type=checkbox name=DR"+i+"></td>");

			document.write("<td>"+ entries[i] +"</td>");
			document.write("</tr>\n");
		}

		HostFilterNum = entries.length;
	}
	</script>
</table>
<input type="submit" value="Delete" id="WebsHostFilterDel" name="deleteSelPortForward" onClick="return deleteWebsHostClick()">&nbsp;&nbsp;
<input type="reset" value="Reset" id="WebsHostFilterReset" name="reset">
</form>
<form action=/goform/websHostFilter method=POST name="websHostFilter">

<table width="400" border="1" cellpadding="2" cellspacing="1">	
	<tr>
		<td class="title" colspan="5" id="WebsHostFilterAddTitle">Add a Host(keyword) Filter: </td>
	</tr>
	<tr>
		<td class="head" id="WebsHostFilterKeyword">Keyword: </td>
		<td> <input name="addHostFilter" size="16" maxlength="32" type="text"> </td>
	</tr>
</table>
<input type="submit" value="Add" id="WebsHostFilterAdd" name="addwebscontentfilter" onClick="return AddWebsHostFilterClick()">&nbsp;&nbsp;
<input type="reset" value="Reset" id="WebsHostFilterReset" name="reset">
</form>-->

</td></tr></table>
</body>
</html>
