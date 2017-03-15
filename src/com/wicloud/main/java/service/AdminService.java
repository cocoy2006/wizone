package com.wicloud.main.java.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wicloud.main.java.dao.GroupindexDAO;
import com.wicloud.main.java.dao.MonindexDAO;
import com.wicloud.main.java.dao.UserinfoDAO;
import com.wicloud.main.java.entity.Groupindex;
import com.wicloud.main.java.entity.Monindex;
import com.wicloud.main.java.entity.Userinfo;
import com.wicloud.main.java.util.Status;

@Service
public class AdminService {

	@Autowired
	private MonindexDAO monindexDao;
	
	@Autowired
	private UserinfoDAO userinfoDao;
	
	@Autowired
	private GroupindexDAO groupindexDao;
	
	public Map<String, Object> userinfo(String place, String qq) {
	    List<Userinfo> users = userinfoDao.findAll();
	    Map<String, Object> model = new LinkedHashMap<String, Object>();
	    model.put("users", users);
	    return model;
	}
	
	public Map<String, Object> netinfo(String place, String qq) {
	    List<Monindex> monindexs = monindexDao.findAll();
	    Map<String, Object> model = new LinkedHashMap<String, Object>();
	    model.put("monindexs", monindexs);
	    return model;
	}
	public List<Groupindex> groupinfonet(String pageNow) {  //获取group分组情况
		List<Groupindex> groupindexes = groupindexDao.findAll();
		return groupindexes;
	}
	
	public int deleteUser(int id) {
		try {
			Userinfo user = (Userinfo) userinfoDao.load(id);
			userinfoDao.delete(user);
			return Status.SUCCESS;
		} catch (Exception e) {
			return Status.ERROR;
		}
	}
	public Groupindex findByGroupId(int groupid) {
		List<Groupindex> list=groupindexDao.findByGroupId(groupid);
		Groupindex group=list.get(0);
		return group;
	}
	
	public int updategroup(Groupindex group) {
		try {
			groupindexDao.saveOrUpdate(group);
			return Status.SUCCESS;
		} catch (Exception e) {
			return Status.ERROR;
		}
	}
}
