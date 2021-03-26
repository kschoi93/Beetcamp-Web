package com.bitcamp.home.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;

public class MemberEditCommand implements CommandService{

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession ses = req.getSession();
		MemberVO vo = new MemberVO();
		
		vo.setUserid((String)ses.getAttribute("userid"));
		MemberDAO dao = MemberDAO.getInstance();
		
		dao.memberSelect(vo);
		
		req.setAttribute("vo", vo);
		return "/member/memberEdit.jsp";
	}
}
