// JScript File 
if (navigator.userAgent.toLowerCase().indexOf('msie') > -1) { 
window.isIE = true; 
window.isIE6 = navigator.appVersion.indexOf("MSIE 6.0;") > -1; 
window.isIE7 = navigator.appVersion.indexOf("MSIE 7.0;") > -1; 
window.isIE8 = navigator.appVersion.indexOf("MSIE 8.0;") > -1; 
} 
var $ = function(objID) { return document.getElementById(objID) }; 
var _flyout; 
var _fadeTimer; 
function showflyout(divWidth, divHeight, paddingWidth) { 
var flyout = function() { 
} 
flyout.prototype = { 
clientWidth: document.documentElement.clientWidth, 
clientHeight: document.documentElement.clientHeight, 
scrollWidth: document.documentElement.scrollWidth, 
scrollHeight: document.documentElement.scrollHeight, 
iframeID: "envelopIframe", 
divID: "popupcontent", 
iframebgColor: "#888888", 
show: function(divContent) { 
//Create envelop iframe 
cssText = "position:absolute; z-index:100; background-color:#888888; border-width:0px; filter:alpha(opacity=0); opacity:0.0;"; 
cssText += "left:0px;"; 
cssText += "top:0px;"; 
cssText += "width:" + this.scrollWidth + "px;"; 
cssText += "height:" + this.scrollHeight + "px;"; 
this.create("iframe", this.iframeID, cssText, "Cppl_IFrameSrc.htm", ""); 
_fadeTimer = setInterval(function() { fadeIframe("envelopIframe", 0.05, 0, 0.5, true) }, 5); 
//Create flyout 
var cssText = ""; 
cssText += "display:block; _position:absolute; position:fixed; z-index:101; border:solid 1px Gray; background-color:white;"; 
cssText += "left:" + (this.clientWidth - divWidth - paddingWidth) / 2 + "px;"; 
cssText += "top:" + (this.clientHeight - divHeight - paddingWidth) / 2 + "px;"; 
cssText += "width:" + (divWidth + paddingWidth) + "px;"; 
cssText += "height: " + (divHeight + paddingWidth) + "px;"; 
this.create("div", this.divID, cssText, "", divContent); 
}, 
create: function(type, id, csstext, iframesrc, innerhtml) { 
var obj = document.createElement(type); 
if (iframesrc.length > 0) { 
obj.src = iframesrc; 
} 
obj.setAttribute("id", id); 
obj.style.cssText = csstext; 
if (innerhtml.length > 0) { 
obj.innerHTML = innerhtml; 
} 
document.body.appendChild(obj); 
if (iframesrc.length > 0) { 
if (window.isIE) { 
window.envelopIframe.document.bgColor = this.iframebgColor; 
} 
} 
}, 
close: function() { 
var objIframe = document.getElementById(this.iframeID); 
var objDiv = document.getElementById(this.divID); 
if (objIframe && objDiv) { 
document.body.removeChild(objIframe); 
document.body.removeChild(objDiv); 
} 
}, 
onresize: function() { 
var objIframe = document.getElementById(this.iframeID); 
var objDiv = document.getElementById(this.divID); 
if (objIframe && objDiv) { 
objIframe.style.width = document.documentElement.scrollWidth + "px"; 
objIframe.style.height = document.documentElement.scrollHeight + "px"; 
objDiv.style.left = (document.documentElement.clientWidth - divWidth) / 2 + "px"; 
objDiv.style.top = (document.documentElement.clientHeight - divHeight) / 2 + "px"; 
} 
}, 
onscroll: function() { 
var objDiv = document.getElementById(this.divID); 
if (objDiv) { 
objDiv.style.left = (document.documentElement.clientWidth - divWidth) / 2 + document.documentElement.scrollLeft + "px"; 
objDiv.style.top = (document.documentElement.clientHeight - divHeight) / 2 + document.documentElement.scrollTop + "px"; 
} 
} 
}; 
_flyout = new flyout(); 
_flyout.show("This is a flyout.<div onclick=\"javascript:closeflyout()\">Close Flyout</div>"); 
} 
function closeflyout() { 
clearInterval(_fadeTimer); 
_fadeTimer = setInterval(function() { fadeIframe("envelopIframe", 0.05, 0, 0.5, false) }, 5); 
} 
window.onresize = function() { 
if (_flyout) { 
_flyout.onresize(); 
} 
}; 
window.onscroll = function() { 
if (_flyout && isIE6) { 
_flyout.onscroll(); 
} 
}; 
function fadeIframe(objId, speed, minOpacity, maxOpacity, flag) { 
var dialog = $(objId); 
if (dialog) { 
var value; 
if (flag) { 
if (parseFloat(dialog.style.opacity) <= maxOpacity) { 
value = parseFloat(dialog.style.opacity) + speed; 
dialog.style.filter = 'alpha(opacity=' + value * 100 + ')'; 
dialog.style.opacity = '' + value + ''; 
} 
else { 
clearInterval(_fadeTimer); 
} 
} 
else { 
if (parseFloat(dialog.style.opacity) >= minOpacity) { 
value = parseFloat(dialog.style.opacity) - speed; 
dialog.style.filter = 'alpha(opacity=' + value * 100 + ')'; 
dialog.style.opacity = '' + value + ''; 
} 
else { 
clearInterval(_fadeTimer); 
if (_flyout) { 
_flyout.close(); 
} 
} 
} 
} 
} 