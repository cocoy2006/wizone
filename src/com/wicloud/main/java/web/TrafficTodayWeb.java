package com.wicloud.main.java.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wicloud.main.java.service.TrafficTodayService;

@Controller
@RequestMapping(value = "/traffictoday")
public class TrafficTodayWeb {

	@Autowired
	private TrafficTodayService trafficTodayService;

	@ResponseBody
	@RequestMapping(value = "/getTrafficToday/")
	public String realtimedataIn(HttpServletRequest request) {
		int place, start, finish;
		place = start = finish = 0;
		String placeStr = request.getParameter("place");
		if (placeStr != null) {
			place = Integer.parseInt(placeStr);
		}
		String time = request.getParameter("start");
		if(time != null) {
			start = Integer.parseInt(time);
		}
		time = request.getParameter("finish");
		if(time != null) {
			finish = Integer.parseInt(time);
		}		
		return trafficTodayService.getTraffic(place, start, finish);
	}
}
