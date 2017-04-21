package com.wicloud.main.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wicloud.main.java.dao.RealtimeTrafficDao;
import com.wicloud.main.java.entity.RealtimeTraffic;

@Service
public class RealtimeTrafficService {
	
	@Autowired
	private RealtimeTrafficDao realtimeTrafficDao;
	
	public String getTraffic(int groupId, int start, int finish){
	    List<RealtimeTraffic> traffics = realtimeTrafficDao.findTraffic(groupId, start, finish);
	    
//		List<RealtimeTraffic> traffics = new ArrayList<RealtimeTraffic>();
//		traffics.add(new RealtimeTraffic(1, 4));
//		traffics.add(new RealtimeTraffic(2, 6));
//		traffics.add(new RealtimeTraffic(3, 8));
//		traffics.add(new RealtimeTraffic(4, 10));
//		traffics.add(new RealtimeTraffic(5, 12));
//		traffics.add(new RealtimeTraffic(6, 14));
//		traffics.add(new RealtimeTraffic(7, 16));
//		traffics.add(new RealtimeTraffic(8, 18));
//		traffics.add(new RealtimeTraffic(9, 20));
//		traffics.add(new RealtimeTraffic(10, 22));
	    
		StringBuilder realdata = new StringBuilder();
		
		if(traffics != null && 0 != traffics.size()){
			for(RealtimeTraffic realtimeTraffic : traffics) {
				int monTime = realtimeTraffic.getMonTime();
				int traffic = realtimeTraffic.getTraffic();
				realdata.append("{\"monTime\":").append(monTime).append(",\"traffic\":").append(traffic)
				.append("},");
			}
			
			if(realdata.length() > 1) {
				realdata.delete(realdata.length() - 1, realdata.length());
			}
		}
		return "{\"realtime_traffic\":["+realdata+"]}";
	}
	
//	public static void main(String[] args) {
//		RealtimeTrafficService service = new RealtimeTrafficService();
//		String traffic = service.getTraffic(0, 0, 0);
//		System.out.println(traffic);
//	}
}
