package com.wicloud.main.java.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.org.apache.bcel.internal.generic.NEW;
import com.wicloud.main.java.dao.HeatmapDAO;
import com.wicloud.main.java.dao.MonindexDAO;
import com.wicloud.main.java.entity.Heatmap;
import com.wicloud.main.java.entity.Monindex;

@Service
public class HeatmapService {
	@Autowired
	private HeatmapDAO heatmapDao;
	@Autowired
	private MonindexDAO monindexDao;
	
	public static final int LIMIT = 90;

	public String getAllHeat(){
		Heatmap lastRecord = heatmapDao.findById(heatmapDao.maxId().get(0));
		StringBuffer realdata = new StringBuffer();
		if(lastRecord != null){
			Integer maxMonTime = lastRecord.getMonTime();
			List<Heatmap> lastRecords = heatmapDao.getLast(LIMIT);
			List<Heatmap> list = null;
			List<Heatmap> listLast = null;
			int point = 0;
			boolean isFirst = true;
			int loop = 0;
			do {
				loop ++;
				if (isFirst) {
					list = new ArrayList<Heatmap>();
					for (int i = 0; i < LIMIT; i++) {
						Heatmap heatmap = lastRecords.get(i);
						if (heatmap.getMonTime().equals(maxMonTime)) {
							list.add(heatmap);
						} else {
							point = i;
							break;
						}
					}
					isFirst = false;
				} else {
					list = listLast;
				}
				listLast = new ArrayList<Heatmap>();
				for (int i = point; i < LIMIT; i++) {
					Heatmap heatmap = lastRecords.get(i);
					if (heatmap.getMonTime().equals(new Integer(maxMonTime - 300 * loop))) {
						listLast.add(heatmap);
					} else {
						point = i;
						break;
					}
				}
			} while (list.size() < listLast.size());
			
			if(list != null && list.size() > 0) {
				for(Heatmap heatmap : list) {
					List<Monindex> list1=monindexDao.findByGroup(heatmap.getGroupindex().getGroupid());
					double lng=list1.get(0).getLng();
					double lat=list1.get(0).getLat();
					realdata.append("{\"lng\":").append(lng).append(",\"lat\":").append(lat)
					.append(",\"cnt\":").append(heatmap.getCnt()).append(",\"monidname\":\"").append(heatmap.getGroupindex().getGroupname())
					.append("\"},");
				}
			}
			if(realdata.length() > 1) {
				realdata.delete(realdata.length() - 1, realdata.length());
			}
		}
		return "{\"heat\":["+realdata+"]}";
	}
}
