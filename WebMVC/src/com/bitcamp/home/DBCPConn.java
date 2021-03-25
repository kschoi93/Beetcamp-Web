package com.bitcamp.home;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPConn {
	protected Connection con=null;
	protected PreparedStatement pstmt = null;
	protected ResultSet rs = null;
	protected String sql = null;
	
	//db연결
	public void getConn() {
		System.out.println("db() 실행됨");
		try {
			Context ctx = new InitialContext();
			Context envCtx = (Context)ctx.lookup("java:comp/env");
			
			DataSource ds = (DataSource)envCtx.lookup("jdbc/myoracle");
			con = ds.getConnection();
		}catch(Exception e) {
			System.out.println("DBCP connection 에러"+e.getMessage());
		}
	}
	//db종료
	public void getClose() {
		try {
			sql=null;
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(con!=null)con.close();
		}catch(Exception e) {
			
		}
	}
	
}
