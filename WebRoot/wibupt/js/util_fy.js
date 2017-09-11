function IsPC() {
	var userAgentInfo = navigator.userAgent;
	var Agents = [ "Android", "iPhone", "SymbianOS", "Windows Phone", "iPad",
			"iPod" ];
	var flag = true;
	for (var v = 0; v < Agents.length; v++) {
		if (userAgentInfo.indexOf(Agents[v]) > 0) {
			flag = false;
			break;
		}
	}
	return flag;
}

function isiOS() {
	var u = navigator.userAgent, app = navigator.appVersion;
	var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); // ios终端
	return isiOS;
}

/**
 * 统计应用下载流程 2015/6/30;
 * 
 * @param type
 * @param id
 * @param step
 */
function statisticsDownload(type, idfy, step) {
	var url = 'statisticsData?type=' + type + "&idfy=" + idfy + "&step=" + step;
	var client = 0;
	if (IsPC()) {
		client = 3;
	} else if (isiOS()) {
		client = 2;
	} else {
		client = 1;
	}
	url += "&client=" + client;
	$.post(url, function(data) {
	});
}

/**
 * 修正大数
 */
function fixYiValue(value)
{
	if(value > 10000000)
	{
		return (Number(value)/100000000).toFixed(2)+"亿";
	}
	else if(value > 10000)
	{
		return (Number(value)/10000).toFixed(2)+"万"
	}
	return value;
}

var changeTwoDecimal_f = function(floatvar) {
	var f_x = parseFloat(floatvar);
	if (isNaN(f_x)) {
		return '0.00';
	}
	var f_x = Math.round(f_x * 100) / 100;
	var s_x = f_x.toString();
	var pos_decimal = s_x.indexOf('.');
	if (pos_decimal < 0) {
		pos_decimal = s_x.length;
		s_x += '.';
	}
	while (s_x.length <= pos_decimal + 2) {
		s_x += '0';
	}
	return s_x;
} 

/**
 * tools
 * @param val
 * @returns
 */
function fixValue(val) {
	if (val < 100) {
		return parseFloat(val.toFixed(2));
	}
	if(val < 1000) {
		return parseFloat(val.toFixed(1));
	}
	return parseFloat(val.toFixed(0));
}

function getDzpConfig(dzpid)
{
	var res;
	$.each(config.dzps,function(idx,item){
		if(item.dd == dzpid)
		{
			res =  item;
		}
	});
	return res;
}

function delHtmlTag(str){    
    var title = str.replace(/<[^>]+>/g,"");//去掉所有的html标记  
    if(title.length > 300) {  
        title = title.substring(0,300);  
    }  
    return title;
}   

function checkResult(json) {
	if(json.protocolId == 1){
		if(json.state == 5){
			showLoginWrap();
			return false;
		}
	}
	else if(json.jumpurl) {
		window.location.href = json.jumpurl;
		return false;
	}
	return true;
}

