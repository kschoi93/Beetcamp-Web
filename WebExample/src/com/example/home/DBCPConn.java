package com.example.home;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPConn {
	protected Connection conn=null;
	protected PreparedStatement pstmt=null;
	protected ResultSet rs=null;
	protected String sql = null;
	
	//db연결
	public void getConn(){
		try {
			Context ctx = new InitialContext();
			Context envCtx = (Context)ctx.lookup("java:comp/env");
			
			DataSource ds = (DataSource)envCtx.lookup("jdbc/myoracle");
			conn = ds.getConnection();
					
		}catch(Exception e) {
			System.out.println("DBCP Connection 에러"+e.getMessage());
		}
	}
	
	//db종료
	public void getClose() {
		try {
			sql=null;
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(rs!=null)rs.close();
		}catch(Exception e) {
			System.out.println("DB 종료 에러...."+e.getMessage());
		}
	}
	
}
