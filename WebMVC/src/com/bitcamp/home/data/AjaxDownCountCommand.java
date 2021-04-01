package com.bitcamp.home.data;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class AjaxDownCountCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//다운로드 회수
		int no=Integer.parseInt(req.getParameter("no"));
		
		DataDAO dao = new DataDAO();
		int cnt = dao.downloadCount(no);
		req.setAttribute("cnt", cnt);
		
		return "/data/ajaxDownResult.jsp";
	}

}
