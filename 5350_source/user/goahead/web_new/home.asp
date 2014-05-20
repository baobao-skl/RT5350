<HTML>
<!-- Copyright (c) Go Ahead Software Inc., 1994-2000. All Rights Reserved. -->
<HEAD>
<TITLE>MRouter</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html">
<script language="JavaScript" type="text/javascript">
function initLanguage()
{
	var lang = "<% getCfgGeneral(1, "Language"); %>";
	var cook = "en";
	var lang_en = "<% getLangBuilt("en"); %>";
	var lang_zhtw = "<% getLangBuilt("zhtw"); %>";
	var lang_zhcn = "<% getLangBuilt("zhcn"); %>";

	if (document.cookie.length > 0) {
		var s = document.cookie.indexOf("language=");
		var e = document.cookie.indexOf(";", s);
		if (s != -1) {
			if (e == -1)
				cook = document.cookie.substring(s+9);
			else
				cook = document.cookie.substring(s+9, e);
		}
	}

	if (lang == "en") {
		document.cookie="language=en; path=/";
		if (cook != lang)
			window.location.reload();
		if (lang_en != "1") {
			if (lang_zhtw == "1") {
				document.cookie="language=zhtw; path=/";
				window.location.reload();
			}
			else if (lang_zhcn == "1") {
				document.cookie="language=zhcn; path=/";
				window.location.reload();
			}
		}
	}
	else if (lang == "zhtw") {
		document.cookie="language=zhtw; path=/";
		if (cook != lang)
			window.location.reload();
		if (lang_zhtw != "1") {
			if (lang_en == "1") {
				document.cookie="language=en; path=/";
				window.location.reload();
			}
			else if (lang_zhcn == "1") {
				document.cookie="language=zhcn; path=/";
				window.location.reload();
			}
		}
	}
	else if (lang == "zhcn") {
		document.cookie="language=zhcn; path=/";
		if (cook != lang)
			window.location.reload();
		if (lang_zhcn != "1") {
			if (lang_en == "1") {
				document.cookie="language=en; path=/";
				window.location.reload();
			}
			else if (lang_zhtw == "1") {
				document.cookie="language=zhtw; path=/";
				window.location.reload();
			}
		}
	}
}

function onInit()
{
	initLanguage();
}

</script>
</HEAD>

<FRAMESET  frameSpacing=0 frameBorder=0  border=0 rows=*,798,*  onLoad="onInit()">
    <FRAME  name=title marginWidth=0 marginHeight=0 src="backgroud.asp" frameBorder=NO scrolling=no>
    
    <FRAMESET  frameSpacing=0 frameBorder=0  border=0 cols=*,800,*>
		<FRAME  name=other1 marginWidth=0 marginHeight=0 src="backgroud.asp" frameBorder=NO scrolling=no>
		    
		    <FRAMESET  frameSpacing=0 frameBorder=0  border=0 rows=133,*,41   cols=800>
				<FRAME  name=title marginWidth=0 marginHeight=0 src="title.asp" frameBorder=NO scrolling=no>

				<FRAMESET frameSpacing=1 frameBorder=1  border=5 bordercolor='#cccccc' cols=6,180,*,6>
					<FRAME frameBorder=NO  name=other2 marginWidth=0 marginHeight=0 src="blank.asp"  scrolling=no  noResize>
					<FRAME frameBorder=NO  name=menu marginWidth=0 marginHeight=0 src="menu_main.asp"  scrolling=no  noResize>
			
					<FRAME frameBorder=NO name=view marginWidth=0 marginHeight=0 src="adm/status.asp"   noResize TOPMARGIN="0">
					<FRAME frameBorder=NO  name=other3 marginWidth=0 marginHeight=0 src="blank.asp"  scrolling=no  noResize>
				</FRAMESET>
				<FRAME name=bottom marginWidth=0 marginHeight=0 src="bottom.asp" frameBorder=NO scrolling=no TOPMARGIN="0">
				
            </FRAMESET>
    
        <FRAME  name=other4 marginWidth=0 marginHeight=0 src="backgroud.asp" frameBorder=NO scrolling=no>
        
    </FRAMESET>    
        
    <FRAME  name=other5 marginWidth=0 marginHeight=0 src="backgroud.asp" frameBorder=NO scrolling=no>

</FRAMESET>


<NOFRAMES>
<BODY BGCOLOR="#FFFFFF">

</BODY></NOFRAMES>
</HTML>
