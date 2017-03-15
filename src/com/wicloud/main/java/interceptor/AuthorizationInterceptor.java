package com.wicloud.main.java.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthorizationInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
	
		// urls not to be filtered
		String[] noFilters = new String[] {"index","login","signin","reg","save","add","product","contacts","info","iframe","test" };
		String uri = request.getRequestURI();
		boolean beFilter = true;
		for (String s : noFilters) {
			if (uri.indexOf(s) != -1) {
				beFilter = false;
				break;
			}
		}
		if (beFilter) {
			Object obj = request.getSession().getAttribute("user");
			if (null == obj) {
				String[] suburis = uri.split("/");
				String subpath;
				if (suburis != null && suburis.length > 1)
					subpath = "/" + suburis[1];
				else
					subpath = "";
				response.sendRedirect(subpath + "/index");
				return false;
			}
		}
		return super.preHandle(request, response, handler);
	}
}
