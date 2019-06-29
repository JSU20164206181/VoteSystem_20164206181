package com.hdq.dao;

import java.sql.SQLException;

import com.hdq.entity.Subject;
import com.hdq.entity.User;
import com.hdq.util.JDBCUtil;

public class SubjectDao implements SubjectInterface {

	public void addSbj(Subject sbj) {
		// TODO Auto-generated method stub

	}

	public void findSbj(Subject sbj) {
		// TODO Auto-generated method stub

	}

	public void deleteSbj(Subject sbj) {
		// TODO Auto-generated method stub
		
			// TODO Auto-generated method stub
			int num;
			JDBCUtil util = new JDBCUtil();
			String sql="insert into vote_subject(VS_ID,VS_TITLE,VS_TYPE)values(?,?)";
			try {
				num = util.executeUpdate(sql,sbj.getVs_title(),sbj.getVs_type()); 
				if(num>0){
					System.out.println( sbj.getVs_title()+"插入成功....");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				util.close();
			}
			

		
	}

	public static void main(String[] args) {
		
		// TODO Auto-generated method stub
		SubjectDao dao= new SubjectDao();
		Subject s=new Subject();
	s.setVs_title("aa");
	s.setVs_type(1);
	dao.addSbj(s);
		
		

	}

}
