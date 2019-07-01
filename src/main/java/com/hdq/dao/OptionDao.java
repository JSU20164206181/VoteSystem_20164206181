package com.hdq.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hdq.entity.Option;
import com.hdq.entity.Subject;
import com.hdq.util.JDBCUtil;

public class OptionDao implements OptionInterface {

	

	public int addOpt(String[] list,int id ) {
		// TODO Auto-generated method stub
		int num=0;
		JDBCUtil util = new JDBCUtil();
		int[] order = new int[list.length];
		
		
		String sql="insert into vote_option(VS_ID,VO_OPTION,VO_ORDER)values(?,?,?)";
		try {
			for(int i=0;i< list.length;i++){		
				order[i]=i+1;
				num =num+util.executeUpdate(sql,id,list[i],order[i]);
			}
			
		
		
			if(num>0){
				System.out.println("选项插入成功...."+num);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			util.close();
		}
		
		return num;
		
	}
	public int getOptNum(int id) {
		int num = 0;
		JDBCUtil util = new JDBCUtil();
		String sql = "select count(*) from vote_option where VS_ID=?";
		ResultSet rs;
		try {
			rs = util.executeQuery(sql,id);
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
	public List<Option> listOpt(int vs_id) {
		// TODO Auto-generated method stub
	
		//选项列表
		
			List<Option> optlist = new ArrayList<Option>();
			JDBCUtil util = new JDBCUtil();
			String sql = "select * from vote_option where vs_id=? order by VO_ORDER ";
			
			ResultSet rs;
			try {
				
				rs = util.executeQuery(sql,vs_id);
				Option option = null;
				while (rs.next()) {
					option = new Option();
					option.setObject_id(rs.getInt("VS_ID"));
					option.setOption_name(rs.getString("VO_OPTION"));
					optlist.add(option);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				util.close();
			}

			return optlist;
		}
		

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		OptionDao dao = new OptionDao();
		Option o=new Option();
		List<Option> l=new ArrayList<Option>();
		
		l=dao.listOpt(1);
		for(int i=0;i<l.size();i++){
			o=l.get(i);
			System.out.println(" obj_id:"+o.getObject_id()+" name:"+o.getOption_name()); 
		}
		
		System.out.println(" num:"+ dao.getOptNum(1));
		
		

	}
	public List<Option> listOpt(Option opt) {
		// TODO Auto-generated method stub
		return null;
	}
}
