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
}
