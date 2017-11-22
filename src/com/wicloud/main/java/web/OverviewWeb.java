package com.wicloud.main.java.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wicloud.main.java.service.OverviewService;

@Controller
@RequestMapping(value = "/overview")
public class OverviewWeb {
	@Autowired
	private OverviewService overviewService;
	
	@ResponseBody
	@RequestMapping(value = "/add/")
	public String add(HttpServletRequest request) {
		String name = request.getParameter("groupname");
		return String.valueOf(overviewService.add(name));
	}
	
	@ResponseBody
	@RequestMapping(value = "/getAllGroup/")
	public String getAllGroup() {
		return overviewService.getAllGroup();
	}
}
	

