package com.wicloud.main.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wicloud.main.java.dao.ActivityindayDAO;
import com.wicloud.main.java.entity.Activityinday;


@Service
public class ActivityindayService {
	
	@Autowired
	private ActivityindayDAO activityindayDao;
	
	public String getAll(int kaishi,int jieshu){
		List<Activityinday> list = activityindayDao.getAll(kaishi,jieshu);
		int ds=(jieshu-kaishi)/(24*60*60);
		StringBuffer realdata = new StringBuffer();
		
		int[] d=new int[24];
		double[] c =new double[24];
		
		if(list != null && list.size() > 0) {
			if(ds==1){           //若是一天，则从数据库读取数据库后，直接返回
				for(Activityinday activity : list) {
					realdata.append(activity.getActivity()).append(",");
				}
			}else if(ds==30){    //若是近30天，需要对返回的数据进行处理
				for(Activityinday activity:list){
					int f=activity.getType();
					d[f]++;
					c[f]=c[f]+activity.getActivity();
				}
				for(int i=0;i<24;i++){
					if(d[i]!=0){
						c[i]=Math.round(c[i]/d[i]*100)/100.0;
					}
				}
				for(int j=0;j<24;j++){
					realdata.append(c[j]).append(",");
				}
				
			}
		}
		if(realdata.length() > 1) {
			realdata.delete(realdata.length() - 1, realdata.length());
		}
		return "{\"data\":["+realdata+"]}";
	}
	
}
