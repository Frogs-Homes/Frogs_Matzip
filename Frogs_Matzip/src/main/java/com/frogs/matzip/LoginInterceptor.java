package com.frogs.matzip;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception { // preHandle은 controller 실행되기 직전에 실행된다 
																																											   //postHandle은 컨트롤러 진입후 view가 실행되기전에 수행
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);
		String[] uriArr = uri.split("/");
		
		System.out.println("uriArr.length : " + uriArr.length);
		
		if(uri.equals("/")) {
			return true;
		} else if(uriArr[1].equals("res"))  {//리소스 (js, css, img)는 통과
			return true;
		}
		
		System.out.println("인터셉터!");
		boolean isLogout = SecurityUtils.isLogout(request);
		boolean isAdmin = SecurityUtils.isAdmin(request);
		
		switch(uriArr[1]) {
		case ViewRef.URI_USER : //user
				switch(uriArr[2]) {
				case "ajaxLogin" : case "ajaxjoin" :
					if(!isLogout) { //로그인 되어있는 상태
						response.sendRedirect("/rest/map");
						return false;
					}
				}
			
		case ViewRef.URI_REST : //rest
			switch(uriArr[2]) {
			case "reg" : case "regFood" :
				if(!isAdmin) {
					response.sendRedirect("/");
					return false;
				}
			}
		}
		
		return true;
	}
}
