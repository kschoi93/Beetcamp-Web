package com.bitcamp.home.member;

import java.util.ArrayList;
import java.util.List;

import com.bitcamp.home.DBCPConn;

public class MemberDAO extends DBCPConn{
	public MemberDAO() {}
	public static MemberDAO getInstance() {
		return new MemberDAO();
	}
	//아이디 중복검사
	public boolean idCheck(String userid) {
		boolean result = false; // true는 아이디가 있다. false는 아이디가 없다
		try {
			sql="select userid from register where userid=?";
			
			getConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}finally{
			getClose();
		}
		return result;
	}
	//우편번호 검색
	public List<ZipCodeVO> zipcodeSearchSelect(String doro) {
		List<ZipCodeVO> zipList = new ArrayList<ZipCodeVO>();
		try {
			getConn();
			sql ="select zipcode, sido,sigungu,um,doro,build1,build2,sibuild,dong,leename,gibun1,gibun2 from zipcode "
					+ " where doro like ? order by zipcode";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+doro+"%");
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ZipCodeVO vo = new ZipCodeVO();
				vo.setZipcode(rs.getString(1));
				vo.setSido(rs.getString(2));
				vo.setSigungu(rs.getString(3));
				vo.setUm(rs.getString(4));
				vo.setDoro(rs.getString(5));
				vo.setBuild1(rs.getInt(6));
				vo.setBuild2(rs.getInt(7));
				vo.setSibuild(rs.getString(8));
				vo.setDong(rs.getString(9));
				vo.setLeename(rs.getString(10));
				vo.setGibun1(rs.getInt(11));
				vo.setGibun2(rs.getInt(12));
				
				zipList.add(vo);
			}
		}catch(Exception e) {
			System.out.println("우편번호 검색 에러---->"+e.getMessage());
		}finally {
			getClose();
		}
		
		return zipList;
	}
	//회원가입
	public int setNewMember(MemberVO vo) {
		int cnt =0;
		try {
			getConn();
			
			sql="insert into register(no, userid, userpwd, username, tel, email, "
					+ " zipcode, addr, detailaddr, interest, regdate) "
					+ " values(memsq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getUserpwd());
			pstmt.setString(3, vo.getUsername());
			pstmt.setString(4, vo.getTel());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getZipcode());
			pstmt.setString(7, vo.getAddr());
			pstmt.setString(8, vo.getDetailaddr());
			pstmt.setString(9, vo.getInterestStr());
			
			cnt = pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("회원가입에러 발생...");
			e.printStackTrace();
		}finally {
			getClose();
		}
		return cnt;
	}
	
	//로그인 체크
	public void loginCheck(MemberVO vo) {
		try {
			getConn();
			sql = "select username from register where userid=? and userpwd=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getUserpwd());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setUsername(rs.getString(1));
			}
			
		}catch(Exception e) {
			System.out.println("로그인 체크 에러----->"+e.getMessage());
		}finally {
			getClose();
		}		
	}
	
	//회원정보 수정
	public void memberSelect(MemberVO vo) {
		try {
			getConn();
			
			sql="select userid, username, tel, email, zipcode, addr, "
					+ " detailaddr, interest from register where userid=?";
			
			
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, vo.getUserid());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setUsername(rs.getString(2));
				vo.setTel(rs.getString(3));
				vo.setEmail(rs.getString(4));
				vo.setZipcode(rs.getString(5));
				vo.setAddr(rs.getString(6));
				vo.setDetailaddr(rs.getString(7));
				vo.setInterestStr(rs.getString(8));
			}
			
		}catch(Exception e) {
			System.out.println("회원정보 수정 오류------>"+e.getMessage());
		}finally {
			getClose();
		}
	}
	
	// 회원정보 수정 업데이트
	public int memberUpdate(MemberVO vo) {
		int result =0;
		try {
			getConn();
			sql = "update register set tel=?, email=?, zipcode=?, addr=?, detailaddr=?, interest=? "
					+ " where userid=? and userpwd=?";
					
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getTel());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getZipcode());
			pstmt.setString(4, vo.getAddr());
			pstmt.setString(5, vo.getDetailaddr());
			pstmt.setString(6, vo.getInterestStr());
			pstmt.setString(7, vo.getUserid());
			pstmt.setString(8, vo.getUserpwd());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("회원정보 수정 업데이트 실패 ----->"+e.getMessage());
		}finally {
			getClose();
		}
		return result;
	}
}
