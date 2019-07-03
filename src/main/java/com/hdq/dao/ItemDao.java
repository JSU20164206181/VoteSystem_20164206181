package com.hdq.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hdq.util.JDBCUtil;

public class ItemDao {
	
	//每个选项有多少票
	public int optItemNum(int sid,int  oid){
		int num=0;	
		JDBCUtil util = new JDBCUtil();
		String sql = "select count(*) as counts from vote_item where VS_ID=? and VO_ID=? ";
		try {
			ResultSet rs= util.executeQuery(sql,sid, oid);
			if(rs.next()){
				num = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			util.close();
		}
		
		return num;
	}
	//用户是否已投票
	public int haveIteam(String uid,int sid){
		int num=0 ;	
		JDBCUtil util = new JDBCUtil();
		String sql = "select count(*) as counts from vote_item where VU_USER_ID=? and VS_ID=?";
		try {
			ResultSet rs  = util.executeQuery(sql, uid,sid);
			if(rs.next()){
				num = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			util.close();
		}
		
		return num;
	}
	//添加投票信息
	public void addIteam(String[] optionlist,String user_id ,int sub_id) {
		// TODO Auto-generated method stub
		int num=0;
		JDBCUtil util = new JDBCUtil();
		Connection con=util.getConn();
	    String sql="insert into vote_item(VS_ID,VO_ID,VU_USER_ID)values(?,?,?)";
		try {
			con.setAutoCommit(false);
			
			for(int i=0;i<optionlist.length;i++){
				//System.out.println("新增投票:  --sub_id"+sub_id+"  --optionlist"+i+":"+optionlist[i]+"  --user_id:"+user_id);
				num=num+util.executeUpdate(sql,sub_id,optionlist[i],user_id);
				
			}
			con.commit();
			System.out.println("共新增投票:"+num);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			util.close();
		}
	}

}
