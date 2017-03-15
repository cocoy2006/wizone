package com.wicloud.main.java.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wicloud.main.java.entity.Monindex;
import com.wicloud.main.java.service.MonindexService;
import com.wicloud.main.java.util.Status;

@Controller
@RequestMapping(value = "/monindex")
public class MonindexWeb {

	@Autowired
	private MonindexService monindexService;
	
	@ResponseBody
	@RequestMapping(value = "/{monid}/")
	public String findMonname(@PathVariable String monid) {
		Monindex monindex = monindexService.findById(monid);
		return "{\"monname\":\"".concat(monindex.getMonname()).concat("\"}");
	}

	@ResponseBody
	@RequestMapping(value = "/add/")
	public String add(HttpServletRequest request) {
		String name = request.getParameter("netname");
		String id = request.getParameter("netID");
		String groupname=request.getParameter("netGroup");
		String lng = request.getParameter("netlng");
		String lat = request.getParameter("netlat");
		String rssin = request.getParameter("netrssin");
		String rssout = request.getParameter("netrssout");
		String add = request.getParameter("netadd");
		return String.valueOf(monindexService.add(name, id,groupname,lng,lat,rssin,rssout,add));
	}
}
