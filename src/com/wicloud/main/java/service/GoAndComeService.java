package com.wicloud.main.java.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wicloud.main.java.dao.GoAndComeDAO;
import com.wicloud.main.java.entity.GoAndCome;
import com.wicloud.main.java.util.Wicloud;

@Service
public class GoAndComeService {
	
	@Autowired
	private GoAndComeDAO goandcomeDao;
	
	public String getAll(String gateId,String finish){
		String start = Wicloud.change(finish, 6);//字符串转Date，7天以前
		StringBuffer comedata = new StringBuffer();
		StringBuffer godata = new StringBuffer();
		StringBuffer totaldata = new StringBuffer();
		List<GoAndCome> list=goandcomeDao.getAll(gateId,start,finish);
		double come_avg = 0.0, go_avg = 0.0;
		
		if(list != null && list.size() > 0) {
			for(GoAndCome goandcome : list) {
				come_avg=come_avg+goandcome.getComeIn();
				comedata.append(goandcome.getComeIn()).append(",");
				
				go_avg=go_avg+goandcome.getGoOut();
				godata.append(goandcome.getGoOut()).append(",");
				
				totaldata.append(goandcome.getComeIn()+goandcome.getGoOut()).append(",");
			}
		}
		
		if (comedata.length() > 1) {
			comedata.delete(comedata.length() - 1, comedata.length());
		}
		if (godata.length() > 1) {
			godata.delete(godata.length() - 1, godata.length());
		}
		if (totaldata.length() > 1) {
			totaldata.delete(totaldata.length() - 1, totaldata.length());
		}
		double sum=come_avg+go_avg;
		come_avg=(double)(Math.round((come_avg/sum)*1000.0)/10.0);
		go_avg=(double)(Math.round((go_avg/sum)*1000.0)/10.0);
		
		return "{\"comedata\":[" + comedata.toString() + "],\"godata\":["
		+ godata.toString() + "],\"totaldata\":["
		+ totaldata.toString() + "],\"come_avg\":" + come_avg
		+ ",\"go_avg\":" + go_avg + "}";
	}
	
	public String getweek(String finish){
		String start = Wicloud.change(finish, 6);//字符串转Date，7天以前
		double ecount=0,wcount=0,scount=0,ncount=0;
		int pday=0,zday=0;
		double pcount=0,zcount=0;
		String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
		Calendar cal = Calendar.getInstance();
		 
		List<GoAndCome> list=goandcomeDao.getWeek(start,finish);
		if(list != null && list.size() > 0) {
			for(GoAndCome goandcome : list) {
				if(goandcome.getGateId().equals("west")){
					wcount=wcount+goandcome.getComeIn()+goandcome.getGoOut();
				}else if(goandcome.getGateId().equals("east")){
					ecount=ecount+goandcome.getComeIn()+goandcome.getGoOut();
				}else if(goandcome.getGateId().equals("north")){
					ncount=ncount+goandcome.getComeIn()+goandcome.getGoOut();
				}else if(goandcome.getGateId().equals("middle")){
					scount=scount+goandcome.getComeIn()+goandcome.getGoOut();
				}else if(goandcome.getGateId().equals("all")){
					Date dat=goandcome.getTime();
					cal.setTime(dat);
			        if((cal.get(Calendar.DAY_OF_WEEK)==1)||(cal.get(Calendar.DAY_OF_WEEK)==7)){
			        	zday=zday+1;
			        	zcount=zcount+goandcome.getComeIn()+goandcome.getGoOut();
			        }else{
			        	pday=pday+1;
			        	pcount=pcount+goandcome.getComeIn()+goandcome.getGoOut();
			        }
				}
			}
			double count=wcount+ecount+ncount+scount;
			wcount=(double)(Math.round(wcount/count*100)/100.0);
			ecount=(double)(Math.round(ecount/count*100)/100.0);
			scount=(double)(Math.round(scount/count*100)/100.0);
			ncount=(double)(Math.round(ncount/count*100)/100.0);
			
			zcount=(double)(Math.round(zcount/zday*100)/100.0);  //周末平均一天的出入总量
			pcount=(double)(Math.round(pcount/pday*100)/100.0);		//平时平均一天的出入总量
			
			double temp=zcount+pcount;
			zcount=(double)(Math.round(zcount/temp*100)/100.0);  //周末出入占比
			pcount=(double)(Math.round(pcount/temp*100)/100.0);  //平时出入占比

			StringBuffer data=new StringBuffer();
			data.append("{\"西门\":").append(wcount).append("},{\"东门\":").append(ecount)
					.append("},{\"南门\":").append(scount).append("},{\"北门\":").append(ncount).append("}");
			return "{\"data\":["+wcount+","+ecount+","+scount+","+ncount+"],\"wdata\":["+zcount+","+pcount+"]}";
		}
		return "";
	}
	
	
}
