package com.pineapple;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CommonInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		super.preHandle(request, response, handler);
		// 모든 요청에 대해 한글인코딩
		request.setCharacterEncoding("utf-8");
		
		// 여기서 로그인 안했을시 튕겨내는 것 추가해주고...
		// 로그인 필요없는 페이지는 따로 분기해줌...
		// return 값이 true면 컨트롤러로 진행이 넘어감
		
		System.out.println("---------------------------------------");
		return true;
	}
	
	
}
