package com.wicloud.test.java.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/test")
public class Tester {

	@RequestMapping(value = "/r/")
	public ModelAndView r(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("welcome");
	    String a = request.getParameter("username");
		String b = request.getParameter("password");
		mav.addObject("username", a);
		mav.addObject("password", b);
	    return mav;
	}
}
