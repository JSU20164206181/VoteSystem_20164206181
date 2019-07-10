package com.hdq.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.hdq.entity.Subject;
import com.hdq.util.JDBCUtil;

public class SubjectDao  {

	
	//删除主题
			public int deleteSubject(int id) {
				int num = 0;
				JDBCUtil util = new JDBCUtil();
				String sql = "delete from vote_subject where VS_ID= ?";
			try {
					num = util.executeUpdate(sql,id); 
					if(num>0){
						System.out.println(id+"删除成功....");
					}	
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					util.close();
				}

				return num;
			}
	
	//已投票数量
			public int getItemNum(int id) {
				int num = 0;
				JDBCUtil util = new JDBCUtil();
				String sql = "select counts from item_num where VS_ID= ?";
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
	//选项数量
		public int getOptionNum(int id) {
			int num = 0;
			JDBCUtil util = new JDBCUtil();
			String sql = "select counts from option_num where VS_ID=?";
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
		//主题id
		public int getSbjId(String name) {
			int num = 0;
			JDBCUtil util = new JDBCUtil();
			String sql = "select VS_ID from vote_subject where VS_TITLE=?";
			ResultSet rs;
			try {
				rs = util.executeQuery(sql,name);
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
	}	//my主题数量
	public int getMySbjNum(String uid) {
		int num = 0;
		JDBCUtil util = new JDBCUtil();
		String sql = "select count(*) from vote_subject where  VU_ID=? ";
		ResultSet rs;
		try {
			rs = util.executeQuery(sql,uid);
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
	//查找主题信息
		public Subject FindSubject(int id) {
			Subject sbj = null;
			JDBCUtil util = new JDBCUtil();
			String sql = "select * from vote_subject  where VS_ID=?";
			
			ResultSet rs;
			try {
				
				rs = util.executeQuery(sql,id);
				
				if(rs.next()) {
					sbj = new Subject();
					sbj.setVs_id(rs.getInt("VS_ID"));
					sbj.setVs_title(rs.getString("VS_TITLE"));
					sbj.setVs_type(rs.getInt("VS_TYPE"));
					sbj.setVu_id(rs.getString("VU_ID"));
					sbj.setItem_num(getItemNum(sbj.getVs_id()));
					sbj.setOption_num(getOptionNum(sbj.getVs_id()));
					sbj.setChose_num(rs.getInt("CHOSE_NUM"));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				util.close();
			}

			return sbj;
		}
	//主题列表
	public List<Subject> SubjectList(int start,int size) {
		List<Subject> sbjlist = new ArrayList<Subject>();
		JDBCUtil util = new JDBCUtil();
		String sql = "select * from vote_subject limit ?,?";
		
		ResultSet rs;
		try {
			
			rs = util.executeQuery(sql,start,size);
			Subject sbj = null;
			while (rs.next()) {
				sbj = new Subject();
				sbj.setVs_id(rs.getInt("VS_ID"));
				sbj.setVs_title(rs.getString("VS_TITLE"));
				sbj.setVs_type(rs.getInt("VS_TYPE"));
				sbj.setVu_id(rs.getString("VU_ID"));
				sbj.setItem_num(getItemNum(sbj.getVs_id()));
				sbj.setOption_num(getOptionNum(sbj.getVs_id()));
				sbj.setChose_num(rs.getInt("CHOSE_NUM"));
				
				sbjlist.add(sbj);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			util.close();
		}

		return sbjlist;
	}
	//my主题列表
	public List<Subject> MySubjectList( int star,int size ,String id) {
		List<Subject> sbjlist = new ArrayList<Subject>();
		JDBCUtil util = new JDBCUtil();
		String sql = "select * from vote_subject where VU_ID=? limit ?,? ";
		
		ResultSet rs;
		try {
			
			rs = util.executeQuery(sql,id,star,size);
			Subject sbj = null;
			while (rs.next()) {
				sbj = new Subject();
				sbj.setVs_id(rs.getInt("VS_ID"));
				sbj.setVs_title(rs.getString("VS_TITLE"));
				sbj.setVs_type(rs.getInt("VS_TYPE"));
				sbj.setVu_id(rs.getString("VU_ID"));
				sbj.setItem_num(getItemNum(sbj.getVs_id()));
				sbj.setOption_num(getOptionNum(sbj.getVs_id()));
				sbj.setChose_num(rs.getInt("CHOSE_NUM"));
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
			String sql="insert into vote_subject(VS_TITLE,VS_TYPE,VU_ID,CHOSE_NUM)values(?,?,?,?)";
			try {
				num = util.executeUpdate(sql,sbj.getVs_title(),sbj.getVs_type(),sbj.getVu_id(),sbj.getChose_num()); 
				if(num>0){
					System.out.println(sbj.getVs_title()+"插入成功....");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				util.close();
			}
			

		
	}
	//更新主题
		public void updataSbj(Subject sbj) {
			// TODO Auto-generated method stub
			
				int num;
				JDBCUtil util = new JDBCUtil();
				String sql="update vote_subject set VS_TITLE=?,VS_TYPE=?,CHOSE_NUM=? where VS_ID=?";
				try {
					num = util.executeUpdate(sql,sbj.getVs_title(),sbj.getVs_type(),sbj.getChose_num(),sbj.getVs_id()); 
					if(num>0){
						System.out.println(sbj.getVs_title()+"更新成功....");
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
