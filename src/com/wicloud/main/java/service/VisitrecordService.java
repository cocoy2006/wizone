package com.wicloud.main.java.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wicloud.main.java.dao.TrafficTodayDao;
import com.wicloud.main.java.dao.VisitrecordDAO;
import com.wicloud.main.java.entity.TrafficToday;
import com.wicloud.main.java.entity.Visitrecord;


@Service
public class VisitrecordService {
	
	@Autowired
	private VisitrecordDAO visitrecordDao;
	
	public String getTopDistinctMacs(int num, int value){
		
	    List<Visitrecord> visitrecords = visitrecordDao.getLast(num);
	  
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		if (visitrecords != null && 0 != visitrecords.size()) {
			for (Visitrecord visitrecord: visitrecords) {
				if (visitrecord != null) {
					String mac = visitrecord.getMac();
					if (map.get(mac) != null) {
						map.put(mac, map.get(mac) + 1);
					} else {
						map.put(mac, 1);
					}
				}
			}
		}
		
		List<Map.Entry<String,Integer>> list = new ArrayList<Map.Entry<String,Integer>>(map.entrySet());
		
		Collections.sort(list,new Comparator<Map.Entry<String,Integer>>() {
            //升序排序
            public int compare(Entry<String, Integer> o1,
                    Entry<String, Integer> o2) {
                return o1.getValue().compareTo(o2.getValue());
            }
            
        });
		
		ArrayList<String> macs = new ArrayList<String>();
		
		for (int i = list.size() - 1; i > list.size() - value - 1; i--) {
			String key = list.get(i).getKey();
			macs.add(key);
		}
		
		StringBuilder macData = new StringBuilder();
		for(String mac : macs) {
			// 112233445566
			// 11:22:33:44:55:66
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < mac.length(); i++) {
				sb.append(mac.charAt(i));
				if ((i & 1) != 0) {
					sb.append(":");
				}
			}
			sb.delete(sb.length() - 1, sb.length());
			macData.append("{\"mac\":\"").append(sb.toString()).append("\"},");
		}
		if(macData.length() > 1) {
			macData.delete(macData.length() - 1, macData.length());
		}
		return "{\"top_macs\":["+macData+"]}";
	}
	
}
