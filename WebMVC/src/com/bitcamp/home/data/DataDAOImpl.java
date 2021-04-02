package com.bitcamp.home.data;

import java.util.List;

public interface DataDAOImpl{
	//글올리기
	public int dataInsert(DataVO vo);
	//글선택 -- 글내용보기, 글수정
	public void dataSelect(DataVO vo);
	//글수정
	public int dataUpdate(DataVO vo, List<String> newFile);
	//글삭제
	public int dataDelete(DataVO vo);
	//글목록
	public List<DataVO> dataSelectAll();
	//조회수 증가
	public void hitCount(int no);
	//다운로드 횟수 증가
	public int downloadCount(int no);
}
