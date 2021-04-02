package com.bitcamp.home.data;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class DataEditCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		DataVO vo = new DataVO();
		vo.setNo(Integer.parseInt(req.getParameter("no")));

		DataDAO dao = new DataDAO();
		dao.dataSelect(vo);
		
		req.setAttribute("vo", vo);
		
		return "/data/dataEdit.jsp";
	}

}
