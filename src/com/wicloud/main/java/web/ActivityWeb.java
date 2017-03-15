package com.wicloud.main.java.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wicloud.main.java.service.ActivityService;

@Controller
@RequestMapping(value = "/activity")
public class ActivityWeb {
	@Autowired
	private ActivityService activityService;
	
	@ResponseBody
	@RequestMapping(value = "/getAll/")
	public String getAll(HttpServletRequest request) {
		int kaishi = 0, jieshu = 0;
		String time = request.getParameter("kaishi");
		if(time != null) {
			kaishi = Integer.parseInt(time);
		}
		time = request.getParameter("jieshu");
		if(time != null) {
			jieshu = Integer.parseInt(time);
		}	
		return activityService.getAll(kaishi,jieshu);
	}
	
	@ResponseBody
	@RequestMapping(value = "/weekActivity/")
	public String weekActivity(HttpServletRequest request) {
		int jieshu = 0;
		String time = request.getParameter("jieshu");
		if(time != null) {
			jieshu = Integer.parseInt(time);
		}
		return activityService.getweekActivity(jieshu);
	}
}
