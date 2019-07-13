package com.hdq.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hdq.entity.Subject;
import com.hdq.entity.User;
import com.hdq.util.JDBCUtil;

public class UserDao {
	public void updataSbj(User user) {
		// TODO Auto-generated method stub
		
			int num;
			JDBCUtil util = new JDBCUtil();
			String sql="update vote_user set VU_TYPE=?,VU_STATUS=? where VU_USER_ID=?";
			try {
				num = util.executeUpdate(sql,user.getUser_type(),user.getUser_status(),user.getUser_id()); 
				if(num>0){
					System.out.println(user.getUser_id()+"更新成功....");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				util.close();
			}
			

		
	}
	//用户数量
		public int getNum() {
			int num = 0;
			JDBCUtil util = new JDBCUtil();
			String sql = "select count(*) from vote_user";
			ResultSet rs;
			try {
				rs = util.executeQuery(sql);
				if (rs.next()) {
					num = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				util.close();
			}

			return num;
		}
	//用户列表
		public List<User> SubjectList(int start,int size) {
			List<User> userlist = new ArrayList<User>();
			JDBCUtil util = new JDBCUtil();
			String sql = "select * from vote_user limit ?,?";
			
			ResultSet rs;
			try {
				
				rs = util.executeQuery(sql,start,size);
				User user = null;
				while (rs.next()) {
					user = new User();
					user.setUser_id(rs.getString("VU_USER_ID"));
					user.setUser_age(rs.getString("VU_AGE"));
					user.setUser_sex(rs.getString("VU_SEX"));
					user.setUser_name(rs.getString("VU_USER_NAME"));
					user.setUser_type(rs.getInt("VU_TYPE"));
					user.setUser_status(rs.getInt("VU_STATUS"));
					user.setUser_phone(rs.getString("VU_PHONE"));
					
					
					userlist.add(user);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				util.close();
			}

			return userlist;
		}
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
		//查看状态
				public String findStatus(String uid){
					String result=null ;	
					JDBCUtil util = new JDBCUtil();
					String sql = "select VU_STATUS from vote_user where VU_USER_ID=? ";
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

	public void update(User user ,int chose){
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				int num=0;
				JDBCUtil util = new JDBCUtil();
				String sql1="update vote_user set VU_SEX=? where VU_USER_ID=?";
				String sql2="update vote_user set VU_AGE=? where VU_USER_ID=?";
				String sql3="update vote_user set VU_TYPE=? where VU_USER_ID=?";	
				String sql4="update vote_user set VU_PHONE=? where VU_USER_ID=?";
				try {
					if(chose==1){
					num = util.executeUpdate(sql1,user.getUser_sex(),user.getUser_id());
					}
					if(chose==2){
						num = util.executeUpdate(sql2,user.getUser_age(),user.getUser_id());
						}
					if(chose==4){
						num = util.executeUpdate(sql3,2,user.getUser_id());
						}
					if(chose==3){
						num = util.executeUpdate(sql4,user.getUser_phone(),user.getUser_id());
						}
					if(num>0){
						System.out.println(user.getUser_id()+"更新成功....");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}finally{
					util.close();
				}
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
