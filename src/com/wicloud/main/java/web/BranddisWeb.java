package com.wicloud.main.java.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wicloud.main.java.service.BranddisService;

@Controller
@RequestMapping(value = "/branddis")
public class BranddisWeb {

	@Autowired
	private BranddisService branddisService;

	@ResponseBody
	@RequestMapping(value = "/avg/")
	public String avg(HttpServletRequest request) {
		String start = request.getParameter("kaishi");
		String finish = request.getParameter("jieshu");
		return branddisService.avg(start, finish);
	}
	
}
