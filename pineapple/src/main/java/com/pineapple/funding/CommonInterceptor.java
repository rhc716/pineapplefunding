package com.pineapple.funding;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CommonInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		super.preHandle(request, response, handler);
		
		// ���⼭ �α��� �������� ƨ�ܳ��� �� �߰����ְ�...
		// �α��� �ʿ���� �������� ���� �б�����...
		// return ���� true�� ��Ʈ�ѷ��� ������ �Ѿ
		
		System.out.println("---------------------------------------");
		return true;
	}
	
	
}
