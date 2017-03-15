package com.wicloud.main.java.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;

import com.wicloud.main.java.service.RealtimedataInService;

@Controller
@RequestMapping(value = "/realtimedataIn")
public class RealtimedataInWeb {

	@Autowired
	private RealtimedataInService realtimedataInService;

	@ResponseBody
	@RequestMapping(value = "/realdata/")
	public String getall(HttpServletRequest request) {
		Integer time = Integer.parseInt(request.getParameter("time"));
		String place = request.getParameter("place");
		return realtimedataInService.realdata(place,time);
	}
	@ResponseBody
	@RequestMapping(value = "/realtimedataIn/")
	public String realtimedataIn(HttpServletRequest request) {
		String place = request.getParameter("place");
		int kaishi = 0, jieshu = 0;
		String time = request.getParameter("kaishi");
		if(time != null) {
			kaishi = Integer.parseInt(time);
		}
		time = request.getParameter("jieshu");
		if(time != null) {
			jieshu = Integer.parseInt(time);
		}		
		String kaishi1 = request.getParameter("kaishi1");
		String jieshu1 = request.getParameter("jieshu1");
		return realtimedataInService.realtimedataIn(place,kaishi, jieshu, kaishi1, jieshu1);
	}
}
