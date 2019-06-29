package com.hdq.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.hdq.entity.User;
import com.hdq.util.JDBCUtil;

public class UserDao implements UserInterface {
	//查看权限
		public String findType(String uid){
			String result=null ;	
			JDBCUtil util = new JDBCUtil();
			String sql = "select VU_TYPE from vote_user where VU_USER_ID=? ";
			try {
				ResultSet rs  = util.executeQuery(sql, uid);
				if(rs.next()){
					result = rs.getString(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				util.close();
			}
			
			return result;
		}
	//查找密码
	public String findPassWord(String uid){
		String result=null ;	
		JDBCUtil util = new JDBCUtil();
		String sql = "select VU_PASSWORD from vote_user where VU_USER_ID=? ";
		try {
			ResultSet rs  = util.executeQuery(sql, uid);
			if(rs.next()){
				result = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			util.close();
		}
		
		return result;
	}
	//查看用户是否存在
	public boolean isExistName(String uid){
		boolean result  = false;	
		JDBCUtil util = new JDBCUtil();
		String sql = "select * from vote_user where VU_USER_ID=?";
		try {
			ResultSet rs  = util.executeQuery(sql, uid);
			if(rs.next()){
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			util.close();
		}
		
		return result;
	}
//添加用户
	public void addUser(User user) {
		// TODO Auto-generated method stub
		int num;
		JDBCUtil util = new JDBCUtil();
		String sql="insert into vote_user(VU_USER_ID,VU_USER_NAME,VU_PASSWORD,VU_STATUS,VU_TYPE)values(?,?,?,1,1)";
		try {
			num = util.executeUpdate(sql,user.getUser_id(),user.getUser_name(),user.getUser_password());
		
		
			if(num>0){
				System.out.println(user.getUser_id()+"插入成功....");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			util.close();
		}
		

	}

	public void update(User user) {
		// TODO Auto-generated method stub

	}

	public void delete(User user) {
		// TODO Auto-generated method stub

	}

	public void findUser(User user) {
		// TODO Auto-generated method stub

	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		User user=new User();
		UserDao dao=new UserDao();
		user.setUser_id("1111");
		user.setUser_name("aa1");
		user.setUser_password("123");
		user.setUser_status(1);
		user.setUser_type(1);
		/*dao.addUser(user);*/
		System.out.println("aaaaa:"+dao.isExistName("11"));
		System.out.println("bbb:"+dao.findPassWord("111"));
		System.out.println("bbb:"+dao.findType("admin"));

	}

}
