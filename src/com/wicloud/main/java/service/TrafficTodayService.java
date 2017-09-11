package com.wicloud.main.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wicloud.main.java.dao.TrafficTodayDao;
import com.wicloud.main.java.entity.TrafficToday;


@Service
public class TrafficTodayService {
	
	@Autowired
	private TrafficTodayDao trafficTodayDao;
	
	public String getTraffic(int groupId, int start, int finish){
	    List<TrafficToday> traffics = trafficTodayDao.findTraffic(groupId, start, finish);
	    
//		List<TrafficToday> traffics = new ArrayList<TrafficToday>();
//		traffics.add(new TrafficToday(1, 4));
//		traffics.add(new TrafficToday(2, 6));
//		traffics.add(new TrafficToday(3, 8));
//		traffics.add(new TrafficToday(4, 10));
//		traffics.add(new TrafficToday(5, 12));
//		traffics.add(new TrafficToday(6, 14));
//		traffics.add(new TrafficToday(7, 16));
//		traffics.add(new TrafficToday(8, 18));
//		traffics.add(new TrafficToday(9, 20));
//		traffics.add(new TrafficToday(10, 22));
	    
		StringBuilder realdata = new StringBuilder();
		
		if(traffics != null && 0 != traffics.size()){
			for(TrafficToday trafficToday : traffics) {
				int monTime = trafficToday.getMonTime();
				int traffic = trafficToday.getDaytraffic();
				realdata.append("{\"monTime\":").append(monTime).append(",\"dayTraffic\":").append(traffic)
				.append("},");
			}
			
			if(realdata.length() > 1) {
				realdata.delete(realdata.length() - 1, realdata.length());
			}
		}
		return "{\"traffic_today\":["+realdata+"]}";
	}
	
//	public static void main(String[] args) {
//		TrafficTodayService service = new TrafficTodayService();
//		String traffic = service.getTraffic(0, 0, 0);
//		System.out.println(traffic);
//	}
}
