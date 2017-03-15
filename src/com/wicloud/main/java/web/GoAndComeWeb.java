package com.wicloud.main.java.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wicloud.main.java.service.GoAndComeService;

@Controller
@RequestMapping(value = "/goandcome")
public class GoAndComeWeb {
	@Autowired
	private GoAndComeService goandcomeService;
	
	@ResponseBody
	@RequestMapping(value = "/getAll/")
	public String goAndcome(HttpServletRequest request) {
		String gateId = request.getParameter("gateId");
		String finish = request.getParameter("time");
		return goandcomeService.getAll(gateId, finish);
	}
	@ResponseBody
	@RequestMapping(value = "/getweekgate/")
	public String getweekgate(HttpServletRequest request) {
		String finish = request.getParameter("time");
		return goandcomeService.getweek(finish);
	}
	
	@ResponseBody
	@RequestMapping(value = "/weekgoandcome/")
	public String weekgoandcome(HttpServletRequest request) {
		String finish = request.getParameter("time");
		return goandcomeService.getweek(finish);
	}
}
