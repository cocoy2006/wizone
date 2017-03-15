package com.wicloud.main.java.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wicloud.main.java.service.BranddisService;
import com.wicloud.main.java.service.HeatmapService;

@Controller
@RequestMapping(value = "/heatmap")
public class HeatmapWeb {
	@Autowired
	private HeatmapService heatmapService;

	@RequestMapping(value = "/getAllHeat/")
	public void avg(HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String avg=heatmapService.getAllHeat();
		out.print(avg);
		out.close();
	}
}
