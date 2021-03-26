package com.bitcamp.home.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;

public class LoginOkCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		MemberVO vo = new MemberVO();
		
		vo.setUserid(req.getParameter("userid"));
		vo.setUserpwd(req.getParameter("userpwd"));
		MemberDAO dao = MemberDAO.getInstance();
		
		dao.loginCheck(vo);
		
		// 로그인 성공시 
		// 세션 객체를 구해서 필요한 데이터를 넣어 저장해준다.
		if(vo.getUsername()!=null && !vo.getUsername().equals("")) {
			HttpSession ses = req.getSession();
			ses.setAttribute("userid", vo.getUserid());
			ses.setAttribute("username", vo.getUsername());
		}
		
		req.setAttribute("vo", vo);
		
		return "/member/loginOk.jsp";
	}

}
