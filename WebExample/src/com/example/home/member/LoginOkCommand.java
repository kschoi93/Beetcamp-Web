package com.example.home.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.home.CommandService;
import com.example.home.board.BoardDAO;

public class LoginOkCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		String userid = req.getParameter("userid");
		String userpwd = req.getParameter("userpwd");
		int result = dao.userCheck(userid,userpwd);
		req.setAttribute("result", result);
		HttpSession ses = req.getSession();
		
		if(result!=0) {
			ses.setAttribute("logId", userid);
		}
		
		return "/index.do";
	}

}
