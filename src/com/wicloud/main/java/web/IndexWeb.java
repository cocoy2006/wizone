package com.wicloud.main.java.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sun.jndi.toolkit.url.Uri;
import com.sun.org.apache.xml.internal.security.utils.Base64;
import com.wicloud.main.java.entity.Userinfo;
import com.wicloud.main.java.service.MonindexService;
import com.wicloud.main.java.service.UserService;
import com.wicloud.main.java.util.Constants;
import com.wicloud.main.java.util.Crypt;
import com.wicloud.main.java.util.Status;

@Controller
public class IndexWeb {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MonindexService monindexService;
	
	@RequestMapping(value = "/")
	public String _() {
		return "index";
	}

	@RequestMapping(value = "/index")
	public String index() {
		return "index";
	}
	@RequestMapping(value = "/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/reg")
	public String reg() {
		return "reg";
	}
	
	@RequestMapping(value = "/realtime")
	public String product() {
		return "realtime";
	}
	
	@RequestMapping(value = "/activity")
	public String contacts() {
		return "activity";
	}
	
	@RequestMapping(value = "/consumption")
	public String shop() {
		return "consumption";
	}
	
	@RequestMapping(value = "/goandcome")
	public String info() {
		return "goandcome";
	}
	
	@RequestMapping(value = "/gephi")
	public String admin() {
		return "gephi";
	}
	
	@RequestMapping(value = "/admin")
	public String report() {
		return "admin";
	}
	
	@RequestMapping(value = "/sendmail")
	public String sendmail() {
		return "sendmail";
	}
	
	@RequestMapping(value = "/iframe")
	public String iframe(HttpServletRequest request, HttpServletResponse response) {
		try {
			String queryString = request.getQueryString();
			if(queryString == null) {
				return "index";
			}
			String encrypted = queryString;
			int index = queryString.indexOf("&monid=");
			if(index > -1) {
				encrypted = encrypted.substring(0, index);
			}
			String plainText = new String(new Crypt().decrypt(Base64.decode(encrypted)), "UTF-8");
			String[] params = plainText.split("&");
			String username = params[0].substring(params[0].indexOf("=") + 1);
			String password = params[1].substring(params[1].indexOf("=") + 1);
			if (username != null && password != null) {
				// check username and password in database
				Userinfo user = userService.check(username, password);
				if (user != null) { // if the check is successful then write
									// attributes into session
					HttpSession session = request.getSession();
					session.setAttribute("user", user);
					// forward different pages according to userType and return
					// monid
					String monid = "";
					if (Constants.USER_TYPE_USER.equalsIgnoreCase(user.getUserType())) { // if user
						monid = monindexService.loadFirstMonid();
					} else { // else administrator
						monid = monindexService.loadFirstMonid();
					}
					session.setAttribute("monid", monid);
					return "iframe";
				}
			}
		} catch(Exception e) {
			return "index";
		}
		return "index";
	}
	
}
