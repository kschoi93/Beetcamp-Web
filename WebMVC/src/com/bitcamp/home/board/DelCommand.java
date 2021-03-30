package com.bitcamp.home.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class DelCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//no,pageNum,searchKey,searchWord
		int no = Integer.parseInt(req.getParameter("no"));
		String userid = (String)req.getSession().getAttribute("userid");
		
		PageSearchVO pageVO = new PageSearchVO();
		pageVO.setPageNum(Integer.parseInt(req.getParameter("pageNum")));
		pageVO.setSearchKey(req.getParameter("searchKey"));
		pageVO.setSearchWord(req.getParameter("searchWord"));
		
		
		BoardDAO dao = new BoardDAO();
		int result = dao.boardDelete(no, userid);
		
		String viewFile = "/board/delOk.jsp";
		req.setAttribute("pageVO", pageVO);
	
		req.setAttribute("result", result);
		
		String pParam = "pageNum="+pageVO.getPageNum();
		if(pageVO.getSearchWord()!=null&& !pageVO.getSearchWord().equals("")) {
			pParam += "&searchKey="+pageVO.getSearchKey()+"&searchWord="+pageVO.getSearchWord(); 
		}
		req.setAttribute("pParam", pParam);
		
		return viewFile;
	}
	
}
