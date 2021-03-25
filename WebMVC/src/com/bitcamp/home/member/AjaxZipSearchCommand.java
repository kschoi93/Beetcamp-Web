package com.bitcamp.home.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class AjaxZipSearchCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String doro = req.getParameter("doro");
		//DB 검색
		MemberDAO dao = MemberDAO.getInstance(); //MemberDAO dao = new MemberDAO();
		List<ZipCodeVO> list = dao.zipcodeSearchSelect(doro);
		req.setAttribute("list", list); // 다음페이지로 데이터를 보낸다
		
		return "/member/AjaxZipList.jsp";
	}

}
