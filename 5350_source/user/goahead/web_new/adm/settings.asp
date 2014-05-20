<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="/lang/b28n.js"></script>
<title>Settings Management</title>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">

<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");
var langtype = "<% getLangType(); %>";
function initTranslation()
{
	var e = document.getElementById("setmanTitle");
	e.innerHTML = _("setman title");
	e = document.getElementById("setmanIntroduction");
	e.innerHTML = _("setman introduction");

	e = document.getElementById("setmanExpSet");
	e.innerHTML = _("setman export setting");
	e = document.getElementById("setmanExpSetExport");
	e.value = _("setman export setting export");

	e = document.getElementById("setmanImpSet");
	e.innerHTML = _("setman import setting");
	e = document.getElementById("setmanImpSetImport");
	e.value = _("setman import setting import");
	e = document.getElementById("setmanImpSetCancel");
	e.value = _("admin cancel");
	
	e = document.getElementById("setmanImpTitle");
	e.innerHTML = _("admin imptitle");
	e = document.getElementById("setmanExpTitle");
	e.innerHTML = _("admin exptitle");
	e = document.getElementById("setmanDefaultTitle");
	e.innerHTML = _("admin defaulttitle");

	e = document.getElementById("setmanLoadFactDefaultButton");
	e.innerHTML = _("setman load factory default button");
	e = document.getElementById("setmanLoadDefault");
	e.value = _("setman load default");
}

function PageInit()
{
	initTranslation();
}

function change(){
	var i;
	if(langtype=="en"){
		i=window.confirm("Click OK after the restart to restore the default values and system, the abolition is not to restore the default value!");
	}else if(langtype=="zhcn"){
		i=window.confirm("点击确认后恢复默认值并系统重启，取消则不恢复默认值！");
	}
	if(i!=0){
		return true;
	}else{
		return false;
	}
}
</script>

</head>
<body onload="PageInit()">
<table class="body"><tr><td>
<h1 id="setmanTitle">Settings Management</h1>
<p id="setmanIntroduction">You might save system settings by exporting them to a configuration file, restore them by importing the file, or reset them to factory default.</p>

<!-- ================= Export ================= -->
<br />
<form method="post" name="ExportSettings" action="/cgi-bin/ExportSettings.sh">
<table width="540" border="0" cellspacing="1" cellpadding="3" bordercolor="#9BABBD">
	<tr>
  <td colspan="2" id="setmanExpTitle" class="title">Export Button</td>
</tr>
  <tr>
    <td id="setmanExpSet" width="130" class="head">Export Button</td>
    <td class="content"><input value="Export" id="setmanExpSetExport" name="Export" style="{width:120px;}" type="submit"></td>
  </tr>
</table>
</form>
<br />

<!-- ================= Import ================= -->
<form method="post" name="ImportSettings" action="/cgi-bin/upload_settings.cgi" enctype="multipart/form-data">
<table width="540" border="0" cellspacing="1" cellpadding="3" bordercolor="#9BABBD">
	<tr>
  <td colspan="2" id="setmanImpTitle" class="title">Settings file location</td>
</tr>
    <tr>
      <td id="setmanImpSet" width="130" class="head">Settings file location</td>
      <td class="content"><input type="File" name="filename" size="20" maxlength="256"></td>
    </tr>
  </table>
<table width="540" border="0" cellpadding="2" cellspacing="1">
  <tr align="left">
    <td class="content">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type=submit style="{width:120px;}" value="Import" id="setmanImpSetImport" onClick="return AdmFormCheck()"> &nbsp; &nbsp;
      <input type=reset  style="{width:120px;}" value="Cancel" id="setmanImpSetCancel">
    </td>
  </tr>
</table>
</form>
<br />

<!-- ================= Load FactoryDefaults  ================= -->
<form method="post" name="LoadDefaultSettings" action="/goform/LoadDefaultSettings" OnSubmit="return change();">
<table width="540" border="0" cellspacing="1" cellpadding="3" bordercolor="#9BABBD">
	<tr>
  <td colspan="2" id="setmanDefaultTitle" class="title">Load Default Button</td>
</tr>
  <tr align="left">
    <td id="setmanLoadFactDefaultButton" width="130" class="head">Load Default Button</td>
    <td class="content"><input value="Load Default" id="setmanLoadDefault" name="LoadDefault" style="{width:120px;}" type="submit"></td>
  </tr>
</table>
</form>


<br>
</td></tr></table>
</body></html>
 