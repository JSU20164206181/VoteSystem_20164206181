package com.hdq.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.hdq.entity.Subject;
import com.hdq.util.JDBCUtil;

public class SubjectDao implements SubjectInterface {

	
	public void findSbj(Subject sbj) {
		// TODO Auto-generated method stub

	}
	//主题数量
	public int getSbjNum() {
		int num = 0;
		JDBCUtil util = new JDBCUtil();
		String sql = "select count(*) from vote_subject";
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
	//主题列表
	public List<Subject> SubjectList(int start, int end) {
		List<Subject> sbjlist = new ArrayList<Subject>();
		JDBCUtil util = new JDBCUtil();
		String sql = "select * from vote_subject limit ?,?";
		ResultSet rs;
		try {
			rs = util.executeQuery(sql,start,end);
			Subject sbj = null;
			while (rs.next()) {
				sbj = new Subject();
				sbj.setVs_id(rs.getInt("VS_ID"));
				sbj.setVs_title(rs.getString("VS_TITLE"));
				sbj.setVs_type(rs.getInt("VS_TYPE"));
				sbj.setVu_id(rs.getString("VU_ID"));
				
				sbjlist.add(sbj);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			util.close();
		}

		return sbjlist;
	}
//添加主题
	public void addSbj(Subject sbj) {
		// TODO Auto-generated method stub
		
			int num;
			JDBCUtil util = new JDBCUtil();
			String sql="insert into vote_subject(VS_TITLE,VS_TYPE,VU_ID)values(?,?,?)";
			try {
				num = util.executeUpdate(sql,sbj.getVs_title(),sbj.getVs_type(),sbj.getVu_id()); 
				if(num>0){
					System.out.println(sbj.getVs_title()+"插入成功....");
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
	s.setVs_title("最美丽的城市4");
	s.setVs_type(1);
	s.setVu_id("admin");
	/*dao.addSbj(s);*/
	List<Subject> sbjlist = new ArrayList<Subject>();
	sbjlist=dao.SubjectList(0, 5);
	System.out.println("List:");
		for(int i=0;i<sbjlist.size();i++){
			System.out.println(i+1+":"+sbjlist.get(i).getVs_title());
			
		}
		System.out.println(dao.getSbjNum());

	}
	public void deleteSbj(Subject sbj) {
		// TODO Auto-generated method stub
		
	}

	

}
