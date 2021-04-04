package com.example.home.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.home.CommandService;

public class BoardListCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		String pageNumStr = req.getParameter("pageNum");
		
		PageSearchVO pageVO = new PageSearchVO();
		
		if(pageNumStr !=null) {
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		pageVO.setTotalRecord(dao.totalRecord(pageVO));
		
		List<BoardVO> lst = dao.boardSelectAll(pageVO);
		
		req.setAttribute("lst", lst);
		req.setAttribute("pageVO", pageVO);
		
		return "/index.jsp?pageNum="+pageNumStr;
	}

}
