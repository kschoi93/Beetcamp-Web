package com.bitcamp.home.data;

import java.util.ArrayList;
import java.util.List;

import com.bitcamp.home.DBCPConn;

public class DataDAO extends DBCPConn implements DataDAOImpl{

	@Override
	public int dataInsert(DataVO vo) {
		int cnt = 0;
		
		try {
			getConn();
			sql="insert into data(no,title,content,userid,filename1,filename2,ip) "
					+ " values(boardsq.nextval, ?, ?, ? ,? ,? ,?)";
			
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getUserid());
			pstmt.setString(4, vo.getFilename1());
			pstmt.setString(5, vo.getFilename2());
			pstmt.setString(6, vo.getIp());
			cnt = pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("자료실 글 등록 에러---->");
			e.printStackTrace();
		}finally {
			getClose();
		}
		return cnt;
	}

	@Override
	public void dataSelect(DataVO vo) {
		try {
			getConn();
			sql="select no,title,content,userid, filename1,filename2,hit,downcount,writedate "
					+ " from data where no =?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setUserid(rs.getString(4));
				
				vo.getFilename()[0]=rs.getString(5);
				vo.getFilename()[1]=rs.getString(6);
				
				vo.setHit(rs.getInt(7));
				vo.setDownCount(rs.getInt(8));
				vo.setWritedate(rs.getString(9));
			}
			
		}catch(Exception e) {
			System.out.println("자료실 글 내용 데이터 가져오기 실패");
			e.printStackTrace();
		}finally {
			getClose();
		}
	}

	@Override
	public int dataUpdate(DataVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int dataDelete(DataVO vo) {
		int cnt=0;
		try {
			getConn();
			sql="delete from data where no=? and userid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getNo());
			pstmt.setString(2, vo.getUserid());
			
			cnt = pstmt.executeUpdate();
			
			
		}catch(Exception e){
			System.out.println("데이터 삭제 에러......");
			e.printStackTrace();
		}finally {
			getClose();
		}
		return cnt;
	}

	@Override
	public List<DataVO> dataSelectAll() {
		List<DataVO> lst = new ArrayList<DataVO>();
		try {
			getConn();
			sql="select no, title, userid, filename1, filename2, hit, downcount, "
					+ " to_char(writedate, 'MM-DD HH:MI') writedate from data order by no desc";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				DataVO vo = new DataVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setUserid(rs.getString(3));
				
				vo.getFilename()[0]=rs.getString(4);
				vo.getFilename()[1]=rs.getString(5);
				
				vo.setHit(rs.getInt(6));
				vo.setDownCount(rs.getInt(7));
				vo.setWritedate(rs.getString(8));
				lst.add(vo);
			}
			
		} catch(Exception e) {
			System.out.println("데이터 리스트 선택 에러.....");
			e.printStackTrace();
		}finally {
			getClose();
		}
		
		return lst;
	}

	@Override
	public void hitCount(int no) {
		try {
			getConn();
			sql="update data set hit=hit+1 where no=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,no);
			
			pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			System.out.println("조회수 증가 에러");
			e.getStackTrace();
		}finally {
			getClose();
		}
	}

	@Override
	public int downloadCount(int no) {
		int count =0;
		try {
			getConn();
			//다운로드횟수 증가
			sql="update data set downcount=downcount+1 where no="+no;
			pstmt = con.prepareStatement(sql);
			
			pstmt.executeUpdate();
			
			//현재 db에 있는 다운로드 횟수 구하기
			sql="select downcount from data where no=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeQuery();
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch(Exception e) {
			System.out.println("다운로드 회수 증가 dao 에러...");
			e.printStackTrace();
		} finally {
			getClose();
		}
		return count;
	}
	
	// 레코드 삭제전 파일명 선택
	public void filenameSelect(DataVO vo) {
		try {
			getConn();
			sql = "select filename1,filename2 from data where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getNo());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.getFilename()[0] = rs.getString(1);
				vo.getFilename()[1] = rs.getString(2);
			}
			
		}catch(Exception e) {
			System.out.println("레코드 삭제전 파일명 선택하기 에러.......");
			e.printStackTrace();
		}finally {
			getClose();
		}
	}

}
