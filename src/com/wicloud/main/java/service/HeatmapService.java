package com.wicloud.main.java.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wicloud.main.java.dao.GroupindexDAO;
import com.wicloud.main.java.dao.HeatmapDAO;
import com.wicloud.main.java.entity.Groupindex;
import com.wicloud.main.java.entity.Heatmap;

@Service
public class HeatmapService {
	
	@Autowired
	private HeatmapDAO heatmapDao;
	@Autowired
	private GroupindexDAO groupindexDAO;
	
	public static final int LIMIT = 50;
	
	private static final int MON_NUM = 23;
	
	private static final int DEFAULT_VALUE = 0;

	public String getAllHeat(){
		Integer maxId = heatmapDao.maxId();
		if(maxId == null) {
			return null;
		}
		Heatmap lastRecord = heatmapDao.findById(maxId);
		StringBuffer realdata = new StringBuffer();
		if(lastRecord != null){
			Integer maxMonTime = lastRecord.getMonTime();
			List<Heatmap> lastRecords = heatmapDao.getLast(LIMIT);
			List<Heatmap> list = new ArrayList<Heatmap>();
			
			for (Heatmap heatmap: lastRecords) {
				if (heatmap.getMonTime().equals(maxMonTime)) {
					list.add(heatmap);
				}
			}
			
			ArrayList<Integer> groupIdList = new ArrayList<Integer>();
			if (list.size() < MON_NUM) {
				for (Heatmap heatmap: list) {
					if (heatmap != null) {
						groupIdList.add(heatmap.getGroupindex().getGroupid());
					}
				}
				
				for (int i = 1; i < MON_NUM + 1; i++) {
					if (!groupIdList.contains(i)) {
						Heatmap heatmap = new Heatmap();
						heatmap.setCnt(DEFAULT_VALUE);
						Groupindex groupindex = groupindexDAO.findByGroupid(i);
						heatmap.setGroupindex(groupindex);
						heatmap.setMonTime(maxMonTime);
						list.add(heatmap);
					}
				}
				
			}
			
			Collections.sort(list, new Comparator<Heatmap>(){
                public int compare(Heatmap h1,Heatmap h2){
                    return h1.getGroupindex().getGroupid().compareTo(h2.getGroupindex().getGroupid());
                }
             });
			
			if(list != null && list.size() > 0) {
				for(Heatmap heatmap : list) {
					int groupId = heatmap.getGroupindex().getGroupid();
					String groupName = heatmap.getGroupindex().getGroupname();
					realdata.append("{\"groupid\":").append(groupId)
					.append(",\"cnt\":").append(heatmap.getCnt())
					.append(",\"monidname\":\"").append(groupName)
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
