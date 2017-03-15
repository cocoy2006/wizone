function sAlert(str1,str2,str3)
	{
    var msgw,msgh,bordercolor,msgInfo;
    msgw=450;//提示窗口的宽度
    msgh=200;//提示窗口的高度
    titleheight=25 //提示窗口标题高度
    bordercolor="#999999";//提示窗口的边框颜色
    titlecolor="#999999";//提示窗口的标题颜色
   
    var sWidth,sHeight;
    sWidth=document.body.clientWidth;
    sHeight=document.body.scrollHeight;
    var bgObj=document.createElement("div");
    bgObj.setAttribute('id','bgDiv');
    bgObj.style.position="absolute";
    bgObj.style.top="0";
    bgObj.style.background="white";
    bgObj.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75";
    bgObj.style.opacity="0.6";
    bgObj.style.left="0";
    bgObj.style.width=sWidth;
    bgObj.style.height=sHeight;
    bgObj.style.zIndex = "10000";
    document.body.appendChild(bgObj);
   
    var msgObj=document.createElement("div")
    msgObj.setAttribute("id","msgDiv");
    msgObj.setAttribute("align","center");
    msgObj.style.background="#FFFFFF";
    msgObj.style.border="1px solid " + bordercolor;
    msgObj.style.position = "absolute";
 msgObj.style.left = "50%";
 msgObj.style.top = "30%";
 msgObj.style.font="12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif";
 msgObj.style.marginLeft = "-225px" ;
 msgObj.style.marginTop = -75+document.documentElement.scrollTop+"px";
 msgObj.style.width = msgw + "px";
 msgObj.style.height =msgh + "px";
 msgObj.style.textAlign = "center";
 msgObj.style.lineHeight ="25px";
 msgObj.style.zIndex = "10001";
   
 var title=document.createElement("h4");
 title.setAttribute("id","msgTitle");
 title.setAttribute("align","right");
 title.style.margin="0";
 title.style.padding="3px";
 title.style.background=bordercolor;
 title.style.opacity="0.75";
 title.style.border="1px solid " + bordercolor;
 title.style.height="18px";
 title.style.font="13px Verdana, Geneva, Arial, Helvetica, sans-serif";
 title.style.color="white";
 //title.style.cursor="pointer";
 title.innerHTML="<span onclick='closeBox()' onmouseover=\"this.style.background='#ffffff';this.style.color='#333333'\"  onmouseout=\"this.style.background='none';this.style.color='#ffffff'\" style='float:right;cursor:pointer;display:block;color:#ffffff;text-align:center;line-height:15px; width:30px; height:14px;'>关闭</span>";
 document.body.appendChild(msgObj);
 document.getElementById("msgDiv").appendChild(title);
 var txt=document.createElement("p");
 txt.style.margin="1em 0"
 txt.setAttribute("id","msgTxt");
 var str;
 str="<img src="+str3+" style=\"position:absolute;left:8%;top:40px;width:120px;height:120px\"> <div style=\"position:absolute;left:20%;top:50px;width:400px;height:400px\"><p style=\"color:#999999;font-size:20px;font-weight:900;\">"+str1+"</p></br><p style=\"color:#DF2F59;font-size:18px;font-weight:900;\">"+str2+"</p></br></div>";
 txt.innerHTML=str;
 document.getElementById("msgDiv").appendChild(txt);
     
 document.getElementById("closeDiv").onclick=function(){
  document.body.removeChild(bgObj);
        document.getElementById("msgDiv").removeChild(title);
        document.body.removeChild(msgObj);
if(gotopage!=""&&gotopage!=null){
   //window.location.href=gotopage;
   $.post(gotopage,paras,function(data){
    sResponse(data,returnpage)
   });
  }
 }
}

function closeBox(){
 document.body.removeChild(bgDiv);
 document.getElementById("msgDiv").removeChild(msgTitle);
 document.body.removeChild(msgDiv);
 }