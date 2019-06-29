package com.hdq.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCUtil {

	private final static String DRIVER = "com.mysql.jdbc.Driver";
	private final static String URL = "jdbc:mysql://localhost:3306/vote";
	private final static String USER_NAME = "root";
	private final static String USER_PASS = "123456";

	private Connection conn = null;
	private PreparedStatement stat = null;
	private ResultSet rs = null;
	
	public JDBCUtil(){
		getConnection();
	}
	

	public void getConnection() {
		try {
			// 1、加载驱动
			Class.forName(DRIVER);
			// 2、创建数据库链接
			conn = DriverManager.getConnection(URL, USER_NAME, USER_PASS);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void close() {
		// 5、关闭链接
		try {
			if (rs != null) {
				rs.close();
			}
			if (stat != null) {
				stat.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 用户查询操作： 参数sql ,para 返回值
	public ResultSet executeQuery(String sql, Object... params) throws SQLException{
		stat = conn.prepareStatement(sql);
		for(int i=0; i< params.length; i++){
			stat.setObject(i+1, params[i]);
		}
		rs = stat.executeQuery();
		return rs;
	}

	// 用户增、删、改操作： 参数sql ,para 返回值
	public int executeUpdate(String sql, Object... params) throws SQLException{
		int num = 0;
		stat = conn.prepareStatement(sql);
		for(int i=0; i< params.length; i++){
			stat.setObject(i+1, params[i]);
		}
		num = stat.executeUpdate();
		return num;
	}
	

}
