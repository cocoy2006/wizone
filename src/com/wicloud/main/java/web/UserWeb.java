package com.wicloud.main.java.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wicloud.main.java.component.UserNetinfoComponent;
import com.wicloud.main.java.entity.Groupindex;
import com.wicloud.main.java.entity.Monindex;
import com.wicloud.main.java.entity.Userinfo;
import com.wicloud.main.java.service.MonindexService;
import com.wicloud.main.java.service.UserService;
import com.wicloud.main.java.util.Constants;
import com.wicloud.main.java.util.Status;

@Controller
@RequestMapping(value = "/user")
public class UserWeb {

	@Autowired
	private UserService userService;

	@Autowired
	private MonindexService monindexService;

	@ResponseBody
	@RequestMapping(value = "/save/")
	public String add(HttpServletRequest request) {
		String userName = request.getParameter("username");
		String passwd = request.getParameter("passwd");
		String contract = request.getParameter("contract");
	
		Userinfo user = new Userinfo();
		user.setUserName(userName);
		user.setPasswd(passwd);
		user.setContract(contract);
		
		return String.valueOf(userService.add(user));
	}

	@ResponseBody
	@RequestMapping(value = "/signin/")
	public String signin(HttpServletRequest request) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if (username != null && password != null) {
			Userinfo user = userService.check(username, password);
			if (user != null) { // if the check is successful then write // attributes into session
				HttpSession session = request.getSession();
				session.setAttribute("user", user); // forward different pages according to userType and return // monid
				String monid = "";
				
				if (Constants.USER_TYPE_USER.equalsIgnoreCase(user.getUserType())) { // if user
					monid = monindexService.loadFirstMonid();
				} else {                       // else administrator
					monid = monindexService.loadFirstMonid();
				}
				session.setAttribute("monid", monid);
				return String.valueOf(Status.SUCCESS);
			}
		}
		return String.valueOf(Status.SIGNIN_USERNAME_OR_PASSWORD_ERROR);
	}
	
	@RequestMapping(value = "/logout/")
	public String logout() {
		return "logout";
	}

	@ResponseBody
	@RequestMapping(value = "/admin/")
	public String admin() {
		return userService.admin();
	}
	
	@RequestMapping(value = "/userinfo/")
	public ModelAndView userinfo(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("snippet/user/userinfo");
		String username = request.getParameter("username");
	    String place = request.getParameter("monid");
		String pageNow = request.getParameter("pageNow");
		mav.addAllObjects(userService.userinfo(username, place, pageNow));
	    return mav;
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
			request.getSession().setAttribute("user", user);
			return String.valueOf(result);
		}
		return String.valueOf(Status.ERROR);
	}

}
