package com.wicloud.main.java.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wicloud.main.java.dao.RealGateDAO;
import com.wicloud.main.java.entity.GoAndCome;
import com.wicloud.main.java.entity.RealGate;

@Service
public class RealGateService {
	
	@Autowired
	private RealGateDAO realgateDao;
	
	public String getRealgate(){
		Date date=new Date();
		Long finish=date.getTime();
		String str = String.valueOf(finish); 
		String s = str.substring(0, 10); 
		finish =Long.parseLong(s);
		int time=Integer.parseInt(s);
//		List<RealGate> list=realgateDao.getAll(time);
		List<RealGate> list = realgateDao.findFour();
		int ecount=0,wcount=0,ncount=0,mcount=0;     //初始化各校门当前进出人数为0
		if(list != null && list.size() > 0) {
			
			for(int i=0; i<4; i++) {
				RealGate realgate = list.get(i);
//			for(RealGate realgate : list) {
				if(realgate.getGateid().equals("east")){
					ecount=realgate.getAlldata();
				}else if(realgate.getGateid().equals("west")){
					wcount=realgate.getAlldata();
				}else if(realgate.getGateid().equals("middle")){
					mcount=realgate.getAlldata();
				}else if(realgate.getGateid().equals("north")){
					ncount=realgate.getAlldata();
				}
			}
		}
		
		return "{\"west\":"+wcount+",\"east\":"+ecount+",\"middle\":"+mcount+",\"north\":"+ncount+"}";
	}
}
