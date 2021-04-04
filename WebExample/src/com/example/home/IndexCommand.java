package com.example.home;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.home.board.BoardDAO;
import com.example.home.board.BoardVO;
import com.example.home.board.PageSearchVO;

public class IndexCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PageSearchVO vo = new PageSearchVO();
				
		req.setAttribute("pageNum",vo.getPageNum() );
		
		
		
		return "/board/list.do";
	}

}
