package com.bitcamp.home.board;

import java.util.List;

//BoardDAOImp1.java

public interface BoardDAOService {
	//레코드 추가 글쓰기
	public int oneRecordInsert(BoardVO vo) ;
	
	//레코드 선택 (1 record) - 글 내용보기, 글 수정폼(select)
	//public BoardVO oneRecordSelect(BoardVO vo);
	public void oneRecordSelect(BoardVO vo);
	
	//레코드 삭제 - 글삭제
	public int boardDelete(int no, String userid);
	
	//조회수 증가
	public void hitCount(int no);
	
	//총 레코드수
	public int totalRecord(PageSearchVO vo);
	
	//레코드 수정 - update
	public int boardUpdate(BoardVO vo);
	
	//레코드 선택 - 1page
	public List<BoardVO> onePageRecordSelect(PageSearchVO vo);
	
	public String getUserid(int no);
}
