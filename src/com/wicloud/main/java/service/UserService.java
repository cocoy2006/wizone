package com.wicloud.main.java.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wicloud.main.java.component.UserNetinfoComponent;
import com.wicloud.main.java.dao.GroupindexDAO;
import com.wicloud.main.java.dao.MonindexDAO;
import com.wicloud.main.java.dao.UserinfoDAO;
import com.wicloud.main.java.entity.Groupindex;
import com.wicloud.main.java.entity.Monindex;
import com.wicloud.main.java.entity.Userinfo;
import com.wicloud.main.java.util.Constants;
import com.wicloud.main.java.util.Status;

@Service
public class UserService {

	@Autowired
	private UserinfoDAO userinfoDao;
	
	@Autowired
	private MonindexDAO monindexDao;

	@Autowired
	private GroupindexDAO groupindexDao;
	
	public int add(Userinfo user) {
		try {
			List list = userinfoDao.findByUserName(user.getUserName());
			if (list != null && list.size() > 0) {
				return Status.REG_USER_EXIST;
			} else {
				int maxId = userinfoDao.findMaxId();
				user.setId(maxId + 1);
				user.setUserType("user");
				userinfoDao.save(user);
				return Status.SUCCESS;
			}
		} catch (Exception e) {
			return Status.ERROR;
		}
	}

	public Userinfo check(String username, String password) {
		try {
			List list = userinfoDao.findByUserName(username);
			if (list != null && list.size() > 0) {
				Userinfo user = (Userinfo) list.get(0);
				if (user.getPasswd().equals(password)) {
					return user;
				}
			}
			return null;
		} catch (Exception e) {
			return null;
		}
	}

	public String admin() {
		try {
			long total = userinfoDao.findCount();
			long admin = userinfoDao.findCountByUsertype(Constants.USER_TYPE_ADMINISTRATOR);
			long ff = total - admin;
			return "{\"total\":" + total + ",\"admin\":" + admin + ",\"ff\":" + ff + "}";
		} catch (Exception e) {
			return "";
		}
	}
	
	public Userinfo findByUsername(String username) {
		try {
			List list = userinfoDao.findByUserName(username);
			if (list != null && list.size() > 0) {
				Userinfo user = (Userinfo) list.get(0);
				return user;
			}
			return null;
		} catch (Exception e) {
			return null;
		}
	}
	
	public int update(Userinfo user) {
		try {
			userinfoDao.saveOrUpdate(user);
			return Status.SUCCESS;
		} catch (Exception e) {
			return Status.ERROR;
		}
	}
	
	public Map<String, Object> userinfo(String username, String place, String pageNow) {
	    List<Userinfo> users = userinfoDao.findByUserName(username);
	    Map<String, Object> model = new LinkedHashMap<String, Object>();
	    model.put("users", users);
	    return model;
	}
	
	public List<Groupindex> groupinfoshow(String username, String pageNow) {//设置分组左侧显示
		List<Groupindex> groupindexes = groupindexDao.findByUsername(username);
		return groupindexes;
	}

	public List<Groupindex> groupinfonet(String username, String pageNow) {//设置监测点左侧group部分显示
		List<Groupindex> groupindexes = groupindexDao.findByUsername(username);
		return groupindexes;
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
