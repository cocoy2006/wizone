package com.wicloud.main.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wicloud.main.java.dao.GroupindexDAO;
import com.wicloud.main.java.entity.Groupindex;
import com.wicloud.main.java.util.Status;

@Service
public class OverviewService {
	@Autowired
	private GroupindexDAO groupindexDao;
	/*
	 * */
	
	//设置界面 添加groupindex表中的小组名称信息
	public int add(String groupname) {
		int groupid = 0;
		List<Groupindex> listall = groupindexDao.findAll();
		if(listall != null && listall.size() > 0) {
			for(Groupindex group : listall) {
				if(group.getGroupname().equalsIgnoreCase(groupname)){
					return Status.FALSE;
				}
			}
		}
		groupid=listall.size()+1;
		Groupindex group = new Groupindex();
		group.setGroupname(groupname);
		group.setGroupid(groupid);
		groupindexDao.save(group);
		return Status.SUCCESS;

	}
	
	public String getAllGroup(){
		StringBuffer realdata = new StringBuffer();
		List<Groupindex> list = groupindexDao.findAll();
		if(list != null && list.size() > 0){
			for(Groupindex group : list){
				realdata.append("\"").append(group.getGroupname()).append("\",");
			}
		}
		if(realdata.length() > 1) {
			realdata.delete(realdata.length() - 1, realdata.length());
		}
		return "{\"groupnames\":["+realdata+"]}";
	}
}
	
		

