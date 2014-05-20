var cur_id=0;

function Node(id, pid, name, url) {

	this.id = id;

	this.pid = pid;

	this.name = name;

	this.url = url;
};

function Menu(objName) {

	this.obj = objName;

	this.aNodes = [];

};

// Adds a new node to the node array

Menu.prototype.add = function(id, pid, name, url)
{   
  
    this.aNodes[this.aNodes.length] = new Node(id, pid, name,url);
};


Menu.prototype.toString = function()
{
    var str = '';
  
    var n=0;
    var id='';
    var pid='';
    var name='';
    var url='';  
    for (n; n<this.aNodes.length; n++) 
    {
        id = this.aNodes[n].id;
        pid = this.aNodes[n].pid;
        name = this.aNodes[n].name;
        url = this.aNodes[n].url;
        
        if(pid==0)
        {
            str += "<A href=";
            str += url;
            str += " target=view><div id =";
            str += id;
            str += "  class=left_title  onmouseover=My_T_Over(";
            str += id;
            str += ")";
            str += " onmouseout=My_T_Out(";
            str += id;
            str += ")";
            str += " onclick=My_Open_T(";
            str += id;
            str += ")>";
            str += name;
            str += "</div></A><ul id=submenu_";
            str += id;
            str += " class=dis >";
            str += "</ul>";
        }
        else
        {
            str = str.substring(0, str.length-5);
            
           
            str += "<li id=";
            str += id;
            str += "  class=left_link";
            str += "  onmouseover=style.color='#00CBFF'";
            str += "  onmouseout=style.color=''>";
             str += "<A href=";
            str += url;
            str += " target=view>"
            str += name;
                 str += "</A>";
            str += "</li>";
       
            str += "</ul>";
            
            
        }

    }

    
    
    return str;
};

function My_T_Over(id)
{
    var x=document.getElementById(id);
    x.className="left_title_over";
    
 };
function My_T_Out(id)
{
    var x=document.getElementById(id);
       
    
    if(cur_id==id)
    {
        x.className= "left_title_out_O";
     }
    else
    {
        x.className= "left_title_out";
    }
    
};


function My_Open_T(id)
{  
    if(cur_id!=id)
    {
        if(cur_id!=0)
        {
          document.getElementById("submenu_"+cur_id).className="dis";
          document.getElementById(cur_id).className="left_title";
        };
        
        document.getElementById("submenu_"+id).className="block";
        
        document.getElementById(id).className ="left_title_over";
        
        cur_id =id;
    }
}




