package com.bitcamp.home;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//메소드 통일시킬려고 만들었다	

public interface CommandService {
	// 		viewfile명 리턴					클라이언트						서버에서 클라이언트로 보내기
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException;

}
