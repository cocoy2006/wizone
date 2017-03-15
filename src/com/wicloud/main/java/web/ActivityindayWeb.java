package com.wicloud.main.java.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wicloud.main.java.service.ActivityindayService;

@Controller
@RequestMapping(value = "/activityinday")
public class ActivityindayWeb {
	@Autowired
	private ActivityindayService activityindayService;
	
	@ResponseBody
	@RequestMapping(value = "/getAll/")
	public String getAll(HttpServletRequest request) {
		Integer jieshu = Integer.parseInt(request.getParameter("jieshu"));
		Integer kaishi = Integer.parseInt(request.getParameter("kaishi"));
		return activityindayService.getAll(kaishi,jieshu);
	}
}
