<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<title>Langauge Settings</title>

<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");
var langtype = "<% getLangType(); %>";
var greenapb = '<% getGAPBuilt(); %>';
var http_request = false;



function initTranslation()
{
	var e = document.getElementById("manLangApply");
	e.value = _("admin apply");
	e = document.getElementById("manLangCancel");
	e.value = _("admin cancel");

	e = document.getElementById("manLangSet");
	e.innerHTML = _("man language setting");
	e = document.getElementById("manSelectLang");
	e.innerHTML = _("man select language");
	e = document.getElementById("manSelectLangTitle");
	e.innerHTML = _("man select language title");
	e = document.getElementById("manLangIntroduction");
	e.innerHTML = _("man introduction1");

}

function initValue()
{
	var tz = "<% getCfgGeneral(1, "TZ"); %>";
	var ddns_provider = "<% getCfgGeneral(1, "DDNSProvider"); %>";

	var lang_element = document.getElementById("langSelection");
	var lang_en = "<% getLangBuilt("en"); %>";
	var lang_zhtw = "<% getLangBuilt("zhtw"); %>";
	var lang_zhcn = "<% getLangBuilt("zhcn"); %>";

	var dateb = "<% getDATEBuilt(); %>";
	var ddnsb = "<% getDDNSBuilt(); %>";

	initTranslation();
	lang_element.options.length = 0;
	if (lang_en == "1"){
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
			if (lang == "en") {
				lang_element.options[lang_element.length] = new Option('English', 'en');
			}else if(lang == "zhcn"){
				lang_element.options[lang_element.length] = new Option('English', 'en');
			}
		}
		
	}
	//if (lang_zhtw == "1")
		//lang_element.options[lang_element.length] = new Option('Traditional Chinese', 'zhtw');
	if (lang_zhcn == "1"){
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
			if (lang == "en") {
				lang_element.options[lang_element.length] = new Option('简体中文', 'zhcn');
			}else if(lang == "zhcn"){
				lang_element.options[lang_element.length] = new Option('简体中文', 'zhcn');
			}
		}
		
	}

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
		for (i=0; i<lang_element.options.length; i++) {
			if (lang == lang_element.options[i].value) {
				lang_element.options.selectedIndex = i;
				break;
			}
		}
	}

	
	
}


function setLanguage()
{
	document.cookie="language="+document.Lang.langSelection.value+"; path=/";
	parent.menu.location.reload();
	return true;
}


</script>

</head>
<body onload="initValue()">
<table class="body"><tr><td>
<h1 id="manLangSet">Language Settings</h1>
<p id="manLangIntroduction">You may configure Language settings here.</p>
<br/>
<!-- ================= Langauge Settings ================= -->
<form method="post" name="Lang" action="/goform/setSysLang">
<table width="540" border="0" cellspacing="1" cellpadding="3">
	<tr>
  <td colspan="2" id="manSelectLangTitle" class="title">settings Language</td>
</tr>
  <tr>
    <td id="manSelectLang" class="head">Select Language</td>
    <td class="content">
      <select name="langSelection" id="langSelection">
        <!-- added by initValue -->
      </select>
    </td>
  </tr>
</table>
<table width="540" border="0" cellpadding="2" cellspacing="1">
  <tr align="left">
    <td class="content">
      <input type=submit style="{width:120px;}" value="Apply" id="manLangApply" onClick="return setLanguage()"> &nbsp; &nbsp;
      <input type=reset  style="{width:120px;}" value="Cancel" id="manLangCancel" onClick="window.location.reload()">
    </td>
  </tr>
</table>
</form>

</td></tr></table>
</body></html>