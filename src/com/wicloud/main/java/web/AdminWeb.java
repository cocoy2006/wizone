package com.wicloud.main.java.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wicloud.main.java.dao.GroupindexDAO;
import com.wicloud.main.java.entity.Groupindex;
import com.wicloud.main.java.entity.Monindex;
import com.wicloud.main.java.entity.Userinfo;
import com.wicloud.main.java.service.AdminService;
import com.wicloud.main.java.service.MonindexService;
import com.wicloud.main.java.service.UserService;
import com.wicloud.main.java.util.Status;

@Controller
@RequestMapping(value = "/admin")
public class AdminWeb {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private UserService userService;
	@Autowired
	private MonindexService monindexService;
	@Autowired
	private GroupindexDAO groupindexDao;
	
	
	
	@RequestMapping(value = "/userinfo/")
	public ModelAndView userinfo(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("snippet/admin/userinfo");
	    String place = request.getParameter("monid");
		String pageNow = request.getParameter("pageNow");
		mav.addAllObjects(adminService.userinfo(place, pageNow));
	    return mav;
	}
	
	@RequestMapping(value = "/netinfo/")
	public ModelAndView netinfo(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("snippet/admin/netinfo");
	    String place = request.getParameter("monid");
		String pageNow = request.getParameter("pageNow");
		List<Groupindex> group =adminService.groupinfonet("a");
		mav.addObject("groupinfo", group);
		mav.addAllObjects(adminService.netinfo(place, pageNow));
	    return mav;
	}
	@RequestMapping(value = "/groupinfo/")//admin.jsp传过来 设置分组 左边 显示
	public ModelAndView groupinfo(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("snippet/admin/groupinfo");
		String username = request.getParameter("username");
		String pageNow = request.getParameter("pageNow");
		List<Groupindex> groupindex = adminService.groupinfonet(pageNow);
		mav.addObject("uncs", groupindex);
	    return mav;
	}
	@RequestMapping(value = "/shoplist/")
	public ModelAndView shoplist(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("snippet/admin/shoplist");
		mav.addObject("monindexs", monindexService.findAll());
	    return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteUser/")
	public String deleteUser(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		return String.valueOf(adminService.deleteUser(id));
	}
	@ResponseBody
	@RequestMapping(value = "/update/")
	public String update(HttpServletRequest request) {
		String olduser = request.getParameter("oldname");
		String passwd = request.getParameter("newpasswd");
		String contact = request.getParameter("newcontact");
		Userinfo user = userService.findByUsername(olduser);
		if(user != null) {
			user.setPasswd(passwd);
			user.setContract(contact);
			int result = userService.update(user);
		
			return String.valueOf(result);
			
		}
		return String.valueOf(Status.ERROR);
	}
	
	@ResponseBody
	@RequestMapping(value = "/netupdate/")
	public String netupdate(HttpServletRequest request) {
		String monid = request.getParameter("monid");
		String newname = request.getParameter("newname");
		Integer groupid = Integer.parseInt(request.getParameter("newgroup"));
		String address = request.getParameter("newaddress");
		Double lng = Double.parseDouble(request.getParameter("newlng"));
		Double lat = Double.parseDouble(request.getParameter("newlat"));
		Double rssin = Double.parseDouble(request.getParameter("newrssin"));
		Double rssout = Double.parseDouble(request.getParameter("newrssout"));
		Monindex monindex = monindexService.findById(monid);
		Groupindex groupindex=groupindexDao.findById(groupid);
		if (monindex != null) {
			monindex.setMonid(monid);
			monindex.setMonname(newname);
			monindex.setMonAdd(address);
			monindex.setGroupid(groupindex.getGroupid());
			monindex.setGroupindex(groupindex);
			monindex.setLng(lng);
			monindex.setLat(lat);
			monindex.setRssin(rssin);
			monindex.setRssout(rssout);
			monindexService.update(monindex);
		}
		
	
		return String.valueOf(Status.SUCCESS);
	}
	@ResponseBody
	@RequestMapping(value = "/updategroup/")//设置我的监测点改monindex表中的groupid等信息
	public String updategroup(HttpServletRequest request) {
		String groupname = request.getParameter("groupname");
		int groupid = Integer.parseInt(request.getParameter("groupid"));
		Groupindex group = adminService.findByGroupId(groupid);
		if(group != null) {
			group.setGroupname(groupname);
			int result = adminService.updategroup(group);
			return String.valueOf(result);
		}
		return String.valueOf(Status.ERROR);
	}
}
