package com.human.edu;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class BDao {
	DataSource ds;	// ojdbc6.jar 안의 DataSource
	JdbcTemplate template;
	
	public BDao(){
		// DB 접속
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		}catch(Exception e) {
			e.printStackTrace();
		}
//		template = Constant.template;
	}
	/*
	public list() {
		String sql = "select * from mvc_board order by bdate desc";
		return 
	}
	public view() {
		
	}
	public write() {
		
	}
	public modify() {
		
	}
	public delete() {
		
	}
*/
}
