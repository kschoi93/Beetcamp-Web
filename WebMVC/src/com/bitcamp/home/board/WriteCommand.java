package com.bitcamp.home.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;

public class WriteCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		
		//글쓰기 폼
		String viewFileName="";
		
		HttpSession ses = req.getSession();
		String sesUserid = (String)ses.getAttribute("userid");
		//로그인 글쓰기폼
		if(sesUserid!=null && !sesUserid.equals("")) {
			viewFileName = "/board/boardForm.jsp";		
		} else { // 로그인 아닐때 로그인폼으로
			viewFileName = "/member/login.jsp";
		}
		
		return viewFileName;
	}

}