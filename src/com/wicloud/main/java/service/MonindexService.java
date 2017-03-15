package com.wicloud.main.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wicloud.main.java.dao.MonindexDAO;
import com.wicloud.main.java.dao.UserinfoDAO;
import com.wicloud.main.java.entity.Monindex;
import com.wicloud.main.java.entity.Userinfo;
import com.wicloud.main.java.entity.Groupindex;
import com.wicloud.main.java.dao.GroupindexDAO;
import com.wicloud.main.java.util.Status;

@Service
public class MonindexService {

	@Autowired
	private MonindexDAO monindexDao;
	
	@Autowired
	private GroupindexDAO groupindexDao;
	
	public int add(String name, String id,String groupname,String lng,String lat,String rssin,String rssout,String add) {//注册
		try {
			List list = monindexDao.findByMonid(id);
			List list1=groupindexDao.findByGroupname(groupname);
			Groupindex groupindex=(Groupindex)list1.get(0);
			if(list != null && list.size() > 0) {
				return Status.ERROR;
			}else{
				Monindex monindex=new Monindex();
				monindex.setMonid(id);
				monindex.setMonAdd(add);
				monindex.setMonname(name);
				monindex.setLng(Double.parseDouble(lng));
				monindex.setLat(Double.parseDouble(lat));
				monindex.setRssin(Double.parseDouble(rssin));
				monindex.setRssout(Double.parseDouble(rssout));
				monindex.setGroupindex(groupindex);
				monindex.setGroupid(groupindex.getGroupid());
				monindexDao.save(monindex);
				return Status.SUCCESS;
			}
		} catch(Exception e) {
			return Status.ERROR;
		}
	}
	
	
	public String loadFirstMonid() {
		List<Monindex> list = null;
		
			list = monindexDao.findAll();
		
		if(list != null && list.size() > 0) {
			Monindex monindex = list.get(0);
			return monindex.getMonid();
		}
		return "";
	}
	
	public Monindex findById(String id) {
		try {
			return monindexDao.findById(id);
		} catch(Exception e) {
			return null;
		}
	}
	
	public List<Monindex> findAll() {
		try {
			return monindexDao.findAll();
		} catch(Exception e) {
			return null;
		}
	}
	public int update(Monindex monindex) {
		try {
			monindexDao.saveOrUpdate(monindex);
			return Status.SUCCESS;
		} catch(Exception e) {
			return Status.ERROR;
		}
	}
	
}
