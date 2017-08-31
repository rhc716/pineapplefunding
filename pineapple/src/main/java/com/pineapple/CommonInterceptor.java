package com.pineapple;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pineapple.user.service.UserAndLevelAndEmployeeAndCompanyAndRank;

public class CommonInterceptor extends HandlerInterceptorAdapter {
	protected Logger log = Logger.getLogger(CommonInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		super.preHandle(request, response, handler);
		// 모든 요청에 대해 한글인코딩
		request.setCharacterEncoding("utf-8");
		boolean result;
				
		// 세션에서 받아온 로그인한 사용자
		UserAndLevelAndEmployeeAndCompanyAndRank user = (UserAndLevelAndEmployeeAndCompanyAndRank) request.getSession().getAttribute("userLogin");
		// 요청URI
		String uri = request.getRequestURI();
		log.debug("request uri : " + uri);
		
		if(user == null){
			log.debug("CommonInterceptor 로그인한 사용자가 아닙니다");
			// 로그인이 필요한 요청을 막아줌 ( 현재는 메인으로 리다이렉트지만, 나중에는 로그인페이지로 리다이렉트 )
			String whereredirect = "/pineapple";
			
			if(uri.equals("/pineapple/pmsmain.pms")){
				response.sendRedirect(whereredirect);
			}
			
			result=true;
			
		} else {
			log.debug("CommonInterceptor 로그인한 사용자입니다");
				// 로그인시 권한별로 구분해서 요청을 막아줌
			
			result=true;
		}
		return result;
	}
}
