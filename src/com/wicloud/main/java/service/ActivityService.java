package com.wicloud.main.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wicloud.main.java.dao.ActivityDAO;
import com.wicloud.main.java.entity.Activity;


@Service
public class ActivityService {
	
	@Autowired
	private ActivityDAO activityDao;
	
	public String getAll(int kaishi,int jieshu){
		List<Activity> list = activityDao.getAll(kaishi,jieshu);
		StringBuffer realdata = new StringBuffer();
		double avg=0;
		int day=0;
		if(list != null && list.size() > 0) {
			for(Activity activity : list) {
				realdata.append("[").append(activity.getMonTime())
				.append("000,").append(activity.getActivity()).append("],");
				avg=avg+activity.getActivity();
				day=day+1;
			}
		}
		if(realdata.length() > 1) {
			realdata.delete(realdata.length() - 1, realdata.length());
		}
		//int d=(jieshu-kaishi)/86400;
		avg=(double)(Math.round(avg/day*100)/100.0);
		return "{\"avg\":"+avg+",\"data\":["+realdata+"]}";
	}
	public String getweekActivity(int finish){
		int start=finish-30*86400;
		List<Activity> list = activityDao.getWeekActivity(start,finish);
		StringBuffer realdata = new StringBuffer();
		double monavg=0,tuesavg=0,wednesavg=0,thursavg=0,friavg=0,saturavg=0,sunavg=0;
		int monc=0,tuesc=0,wednesc=0,thursc=0,fric=0,saturc=0,sunc=0;
		if(list != null && list.size() > 0) {
			for(Activity activity : list) {
				String dateType=activity.getType();
				if(dateType.equals("monday")){
					monavg=monavg+activity.getActivity();
					monc++;
				}else if(dateType.equals("tuesday")){
					tuesavg=tuesavg+activity.getActivity();
					tuesc++;
				}else if(dateType.equals("wednesday")){
					wednesavg=wednesavg+activity.getActivity();
					wednesc++;
				}else if(dateType.equals("thursday")){
					thursavg=thursavg+activity.getActivity();
					thursc++;
				}else if(dateType.equals("friday")){
					friavg=friavg+activity.getActivity();
					fric++;
				}else if(dateType.equals("saturday")){
					saturavg=saturavg+activity.getActivity();
					saturc++;
				}else if(dateType.equals("sunday")){
					sunavg=sunavg+activity.getActivity();
					sunc++;
				}
				
			}
			monavg=(monc==0)?0:monavg/monc;
			tuesavg=(tuesc==0)?0:tuesavg/tuesc;
			wednesavg=(wednesc==0)?0:wednesavg/wednesc;
			thursavg=(thursc==0)?0:thursavg/thursc;
			friavg=(fric==0)?0:friavg/fric;
			saturavg=(saturc==0)?0:saturavg/saturc;
			sunavg=(sunc==0)?0:sunavg/sunc;
			
		}
		return "{\"data\":["+sunavg+","+monavg+","+tuesavg+","+wednesavg+","+thursavg
						+","+friavg+","+saturavg+"]}";
	}
}
