package com.hm.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.hm.VO.groupVO;
import com.hm.VO.studentVO;



public class studentDAO {
	Connection conn=null;
	ResultSet rs=null;
	// 싱글톤은 객체는 하나, 필요하다면 주소만 공유>> 불필요한 객체를 생성하지 않아서 성능이나 안정성면에 좋음(GC 동작할 필요가 없음)
	//싱글톤에서 객체는 본인이 만들고 공용변수 하나를 선언하여 공용변수로 필요한 객체에게 알려줍니다.
	
	public static studentDAO sdao;
	public static studentDAO getInstanse() {
		if(sdao==null) {
			sdao= new studentDAO();
		}
		return sdao;
	}
	
	//외부에서는 getInstance 메서드로 접근해서 객체의 주소를 요청합니다.
	// 변수와 메서드는 클래스 외부에서 접근가능해야 하기에 static 지정합니다.
	
	private studentDAO(){
		//1. 드라이버 로드(한번만) 2. 커넥션 3.쿼리전송 4.리턴값 처리
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("로드성공");
		} catch(Exception e) {
			System.out.println("로드실패");
		}
		
	}
	
	public boolean connect() { // 
		try {
			// 커넥션을 시도하고 그 결과를 얻어 오는 코드... 
			conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "11111111");
			return true;
		} catch (Exception e) {
			
		}
		return false;
	}

	public int getNo() {
		int no=-1;
		if(connect()) {
			String sql="select hm_seq.nextval as no from dual";
			try {
				Statement st=conn.createStatement();
				rs=st.executeQuery(sql);
				if(rs.next()) {
					no=rs.getInt("no");
					return no;
				}
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		return no;
	}

	public void insert(studentVO svo) {
		if(connect()) {
			String sql="insert into member_hm values(?,?,?,?,default,?)";
			try {
				PreparedStatement pm=conn.prepareStatement(sql);
				pm.setInt(1, svo.getNo());
				pm.setString(2, svo.getName());
				pm.setString(3, svo.getTel());
				pm.setString(4, svo.getAddress());
				pm.setString(5, svo.getGrade());
				int r=pm.executeUpdate();
				System.out.println(r+"건 입력완료");
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}

	public ArrayList<studentVO> allPrt() {
		if(connect()) {
			ArrayList<studentVO> allS=new ArrayList<>();
			String sql="select * from member_hm";
			try {
				Statement st=conn.createStatement();
				rs=st.executeQuery(sql);
				while(rs.next()) {
					studentVO svo=new studentVO();
					svo.setNo(rs.getInt("no"));
					svo.setName(rs.getString("name"));
					svo.setTel(rs.getString("tel"));
					svo.setAddress(rs.getString("address"));
					svo.setJoindate(rs.getString("joindate"));
					svo.setGrade(rs.getString("grade"));
					allS.add(svo);
				}
				conn.close();
				return allS;
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} 
		return null;
	}

	public ArrayList<groupVO> groupS() {
		if(connect()) {
			ArrayList<groupVO> gs=new ArrayList<>();
			String sql="select a2.name as sn, a3.class_name as cn, a3.class_pro as pn, a1.indate as id";  
					sql+=" from class_select a1" ;
					sql+=" left outer join" ; 
					sql+=" member_hm a2" ; 
					sql+=" on a1.no=a2.no" ; 
					sql+=" left outer join " ; 
					sql+=" class_hm a3" ; 
					sql+=" on a1.class_no=a3.class_no" ; 
					sql+=" group by (a2.name, a3.class_name, a3.class_pro, a1.indate)" ; 
					sql+=" order by a2.name asc";
			try {
				Statement st=conn.createStatement();
				rs=st.executeQuery(sql);
				while(rs.next()) {
					groupVO gvo=new groupVO();
					gvo.setSn(rs.getString("SN"));
					gvo.setCn(rs.getString("CN"));
					gvo.setPn(rs.getString("PN"));
					gvo.setId(rs.getString("ID"));
					gs.add(gvo);
				}
				conn.close();
				return gs;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return null;
	}
	
	
	
	
	
}
