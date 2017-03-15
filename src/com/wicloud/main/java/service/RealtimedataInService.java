package com.wicloud.main.java.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wicloud.main.java.dao.RealtimedataInDAO;
import com.wicloud.main.java.entity.RealtimedataIn;

@Service
public class RealtimedataInService {

	@Autowired
	private RealtimedataInDAO realtimedataInDao;
	
	public String realdata(String place,int time) {
		// get shishi from table realtimeindata
		int real = 0;
		List<RealtimedataIn> list = realtimedataInDao.findTraffic(place,time);
		if (list != null && list.size() > 0) {
			RealtimedataIn realtimedataIn = list.get(0);
			real = realtimedataIn.getId().getTraffic();
		}
		return "{\"real\":"+real+"}";
	}
	
	public String realtimedataIn(String place,int start, int finish, String start1, String finish1) {
		List<RealtimedataIn> list = realtimedataInDao.findMontimeAndTraffic(place,start, finish);
		StringBuffer realdata = new StringBuffer();
		if(list != null && list.size() > 0) {
			for(RealtimedataIn realtimedataIn : list) {
				realdata.append("[").append(realtimedataIn.getId().getMonTime())
					.append("000,").append(realtimedataIn.getId().getTraffic()).append("],");
			}
		}
		if(realdata.length() > 1) {
			realdata.delete(realdata.length() - 1, realdata.length());
		}
		
		return "{\"data\":["+realdata+"]}";
	}
	
}
