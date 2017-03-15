package com.wicloud.main.java.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public void getAllGroup(HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String groupname=overviewService.getAllGroup();
		out.print(groupname);
		out.close();
	}
}
	

