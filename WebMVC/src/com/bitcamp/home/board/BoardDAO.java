package com.bitcamp.home.board;

import java.util.ArrayList;
import java.util.List;

import com.bitcamp.home.DBCPConn;

public class BoardDAO extends DBCPConn implements BoardDAOService {

	@Override
	public int oneRecordInsert(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void oneRecordSelect(BoardVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public int boardDelete(int no, String userid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void hitCount(int no) {
		// TODO Auto-generated method stub

	}

	@Override
	public int totalRecord(PageSearchVO vo) {
		int totalRecord=0;
		try {
			getConn();
			
			sql="select count(no) from board ";
			if(vo.getSearchWord()!=null) {
				sql += " where "+ vo.getSearchKey() + " like ?";
			}
			pstmt = con.prepareStatement(sql);
			
			if(vo.getSearchWord()!=null) {
				pstmt.setString(1, "%"+vo.getSearchWord()+"%");
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalRecord = rs.getInt(1);
			}
			
		}catch(Exception e) {
			System.out.println("총 레코드수 구하기 에러"+e.getMessage());
		}finally {
			getClose();
		}
		
		return totalRecord;
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardVO> onePageRecordSelect(PageSearchVO vo) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			getConn();
			sql="select * from "
					+ "( select * from " 
					+ "( select no, subject, userid, to_char(writedate,'MM-DD HH:MI') writedate, hit from board ";
				//검색어가 있을때
				if(vo.getSearchWord()!=null) {
					sql += " where "+vo.getSearchKey()+"=? ";
				}
				sql += " order by no desc) "
						+ " where rownum <=? order by no asc ) "
						+ " where rownum <=? order by no desc ";
			
			pstmt = con.prepareStatement(sql);
			if(vo.getSearchWord()==null) {// 검색어가 없을때
				pstmt.setInt(1, vo.getPageNum() * vo.getOnePageRecord()); // 2* 5
				if(vo.getPageNum() == vo.getTotalPage()) {//마지막페이지 확인
					pstmt.setInt(2, vo.getLastPageRecord());
				} else {
					pstmt.setInt(2, vo.getOnePageRecord());
				}
			} else { //검색어가 있을때
				pstmt.setString(1, "%"+vo.getSearchWord()+"%");
				pstmt.setInt(2, vo.getPageNum()* vo.getOnePageRecord());
				if(vo.getPageNum() == vo.getLastPageRecord()) {
					pstmt.setInt(3, vo.getLastPageRecord());
				} else {
					pstmt.setInt(3, vo.getOnePageRecord());
				}
				
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new BoardVO( 
						rs.getInt(1), 
						rs.getString(2),
						rs.getString(3), 
						rs.getString(4), 
						rs.getInt(5)
						)
						);
			}
			
			
		}catch(Exception e) {
			System.out.println("한페이지 레코드 선택 에러---->"+e.getMessage());
		}finally {
			getClose();
		}
		System.out.println(list.size());
		return list;
	}

	/*
	 *  @Override
public List<BoardVO> onePageRecordSelect(PageSearchVO vo) {
List<BoardVO> list = new ArrayList<BoardVO>();
try {
getConn();
sql = " select * from "
+ " (select * from "
+ " ( select no, subject, userid, hit, to_char(writedate, 'MM-DD HH:MI') writedate from board ";
//검색어가 있을때
if(vo.getSearchWord() != null) {
sql += " where "+ vo.getSearchKey() + " like ?";
}
sql += " order by no desc ) "
+ " where rownum <=? order by no ) "
+ " where rownum <=? order by no desc ";

pstmt = con.prepareStatement(sql);

if(vo.getSearchWord() == null) { //검색어가 없을때
pstmt.setInt(1, vo.getPageNum()*vo.getOnePageRecord()); // 만약 2페이지 보면 2*5
if(vo.getPageNum() == vo.getTotalPage()) { // 마지막페이지
pstmt.setInt(2, vo.getLastPageRecord());
}else {
pstmt.setInt(2, vo.getOnePageRecord());
}
}else { // 검색어가 있을 때
pstmt.setString(1, "%" + vo.getSearchWord() + "%");
pstmt.setInt(2, vo.getPageNum()*vo.getOnePageRecord());
if(vo.getPageNum() == vo.getTotalPage()) {
pstmt.setInt(3, vo.getLastPageRecord());
}else {
pstmt.setInt(3, vo.getOnePageRecord());
}
}
rs = pstmt.executeQuery();
while(rs.next()) { // hit랑 위치들을 바꿔서 좀 이상하게 작성됨
list.add(new BoardVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(5), rs.getInt(4)));
}
}catch(Exception e) {
System.out.println("레코드 선택에러(1페이지)...");
e.printStackTrace();
}finally {
getClose();
}
return list;
}

	 */
}
