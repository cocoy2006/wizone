package com.wicloud.main.java.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wicloud.main.java.service.TrafficTodayService;
import com.wicloud.main.java.service.VisitrecordService;

@Controller
@RequestMapping(value = "/visitrecord")
public class VisitrecordWeb {

	@Autowired
	private VisitrecordService visitrecordService;

	@ResponseBody
	@RequestMapping(value = "/getTopMacs/")
	public String getTopMacs(HttpServletRequest request) {
		int num, value;
	    num = value = 0;
		String numStr = request.getParameter("num");
		if (numStr != null) {
			num = Integer.parseInt(numStr);
		}
		String valueStr = request.getParameter("value");
		if(valueStr != null) {
			value = Integer.parseInt(valueStr);
		}
	
		return visitrecordService.getTopDistinctMacs(num, value);
	}
}
