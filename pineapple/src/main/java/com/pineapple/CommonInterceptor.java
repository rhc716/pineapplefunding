package com.pineapple;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pineapple.user.service.UserAndLevelAndEmployeeAndCompanyAndRank;

public class CommonInterceptor extends HandlerInterceptorAdapter {
	protected Logger log = Logger.getLogger(CommonInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		super.preHandle(request, response, handler);
		// 모든 요청에 대해 한글인코딩
		request.setCharacterEncoding("utf-8");
		
		
		//////////////////////////////////// 요청 인증 과정  ////////////////////////////////////
		boolean result;
		// 세션에서 받아온 로그인정보
		UserAndLevelAndEmployeeAndCompanyAndRank user = (UserAndLevelAndEmployeeAndCompanyAndRank) request.getSession().getAttribute("userLogin");
		// URI별로 로그인, 비로그인시 요청을 통과 or 막아줌 
		String uri = request.getRequestURI();
		log.debug("request uri : " + uri);
		
		if(user == null){
			log.debug("CommonInterceptor : 로그인한 사용자가 아닙니다");
			// 로그인이 필요한 요청은 로그인페이지로 리다이렉트 해줌
			String whereredirect = "/pineapple/login.user";

			// 로그인이 필요한 페이지에서 로그인 페이지로 이동될때 이전 페이지의 정보를 저장해서 => 로그인 후 다시 그 페이지로 가도록 해줄 것. 
			log.debug("=================CommonInterceptor 요청한페이지의 getHeader중 Referer================= : "+request.getHeader("Referer"));
			// 최초 실행에 메인페이지로 왔을때 헤더에 Referer가 null이기에 if문으로 넣어줌 
			if(request.getHeader("Referer")!=null){
			        String[] cutUriStr = request.getHeader("Referer").split("/");
			        log.debug("================cutUriStr.length=============== : "+cutUriStr.length);
			        // 자른 문자열의 마지막값으로 리다이렉트할때 쓸 것임
			        String refererPage = cutUriStr[cutUriStr.length-1];
			        log.debug("================refererPage=============== : "+refererPage);

			        // 이전페이지로 돌아가는 기능을 할때,, (로그인 페이지에서 온 요청(로그인처리)은 건너뛰어야함)
			        if(!refererPage.equals("/pineapple/login.user")){
			                request.setAttribute("refererPage", refererPage);
			        }
			        
			        // 메인에서 온 (로그인페이지 or 로그인처리)요청인경우        공백을 넣어서 메인으로 리다이렉트함
			        if(refererPage.equals("pineapple")){
			                refererPage = "";
			                request.setAttribute("refererPage", refererPage);
			        }
			}

			if(uri.equals("/pineapple/pmsmain.pms")){
			        
			        response.sendRedirect(whereredirect);
			}

			
			result=true;
			
		} else {
			log.debug("CommonInterceptor : 로그인한 사용자입니다");
				// 로그인시 권한별로 구분해서 요청을 막아줌
			
			result=true;
		}
		return result;
	}
}
