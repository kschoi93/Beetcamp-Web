package com.example.home.board;

import java.util.ArrayList;
import java.util.List;

import com.example.home.DBCPConn;


public class BoardDAO extends DBCPConn{
	public List<BoardVO> boardSelectAll(PageSearchVO vo){
		List<BoardVO> lst = new ArrayList<BoardVO>();
		
		try {
			getConn();
			sql="select * from "
				+ " (select * from "
				+ " (select no, subject, userid, to_char(writedate,'YYYY.MM.DD'), hit from board "
				+ " order by no desc) "
				+ " where rownum <=? order by no) "
				+ " where rownum <=? order by no desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getPageNum()*vo.getOnePageRecord());
			if(vo.getPageNum()==vo.getTotalPage()) {
				pstmt.setInt(2, vo.getLastPageRecord());
			} else {
				pstmt.setInt(2, vo.getOnePageRecord());
			}
				
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				lst.add(new BoardVO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5)));
			}
		}catch(Exception e) {
			System.out.println("게시판 리스트 불러오기 실패....."+e.getMessage());
		}finally {
			getClose();
		}
		return lst;
	}
	
	public int totalRecord(PageSearchVO vo) {
		int totalRecord = 0;
		try {
			getConn();
			sql = "select count(no) from board ";
			
			
			pstmt = conn.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalRecord = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("총레코드수 구하기 에러...");
			e.printStackTrace();
		}finally {
			getClose();
		}
		return totalRecord;
	}
	
	public int userCheck(String userid,String userpwd) {
		int result= 0;
		
		try {
			getConn();
			sql="select count(userid) from register where userid=? and userpwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, userpwd);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result= rs.getInt(1);
				
			}
			
		}catch(Exception e) {
			System.out.println("로그인 에러.....");
			e.printStackTrace();
		}finally {
			getClose();
		}
		return result;
		
	}
}
