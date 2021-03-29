package com.bitcamp.home.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class ListCommand implements CommandService{

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String pageNumStr = req.getParameter("pageNum");
		
		PageSearchVO pageVO = new PageSearchVO();
		
		if(pageNumStr != null) {//페이지 번호가 있을때 숫자화, 없으면 1초기값으로 설정되어 있음.
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		//검색어, 검색키
		pageVO.setSearchKey(req.getParameter("searchKey"));
		pageVO.setSearchWord(req.getParameter("searchWord"));
		System.out.println("searchKey------>"+req.getParameter("searchKey"));
		System.out.println("searchWord------>"+req.getParameter("searchWord"));
		BoardDAO dao = new BoardDAO();
		
		//총 레코드 구하기
		pageVO.setTotalRecord(dao.totalRecord(pageVO));
		
		//현재페이지 검색어에 해당하는 레코드 선택
		//dao.onePageRecordSelect(pageVO);
		
		req.setAttribute("list",dao.onePageRecordSelect(pageVO));
		req.setAttribute("pageVO",pageVO);
		
		
		return "/board/list.jsp";
	}

}
