package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBClose;
import db.DBConnection;
import dto.MemberDto;

//dao는 어디서나 접근되도록 singleton으로 만드는게 좋다!
public class MemberDao {

	private static MemberDao dao = null;
	
	//private으로 생성자 만들어서 다시는 생성되지 못하도록 만든다.
	private MemberDao() {
		
	// DBConnection.java의 initConnection 호출하기
		DBConnection.initConnection();
	}
	//return값을 MemberDao로 설정
	//getInstance 메소드를 통해 한번만 생성된 객체를 가져온다.
	public static MemberDao getInstance() {
		if(dao == null) { // 이미 생성 한번 돼서 null이 아님
			dao = new MemberDao();
		}
		return dao;	// 그 전에 생성됐던 인스턴스만 계속 return
	}
	
	public boolean getId(String id) {
		
		String sql = " select id "
				+ "    from member "
				+ "    where id=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		boolean findid = false; //id가 있다면 true로 바꿔주면됨
	
	//DBConnection 파일로부터 커넥션 정보 얻어오기	
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 getId success"); //개발자가 알아보기 편하게 출력하는법
	// sql 문장을 prepareStatement에 집어넣는다.		
			psmt = conn.prepareStatement(sql);
			
	// ? 에 집어넣기 위해 set 만든다. :setString(count, sql);
			psmt.setString(1, id); //1개라는 id값이 들어감
			System.out.println("2/3 getId success"); //개발자가 알아보기 편하게 출력하는법
			
	// executeQuery : Statement 객체의 결과를 rs에 받기			
			rs = psmt.executeQuery();
			System.out.println("3/3 getId success"); //개발자가 알아보기 편하게 출력하는법
			
	//데이터 하나 : 조건문 -> id가 있을 수도 있고 없을 수도 있으므로 조건문 쓴다.		
			if(rs.next()) {
				findid = true; // id가 있으면 true로 바꿔준다.
			}			
			
		} catch (SQLException e) {	
			System.out.println("getId fail"); //오류시 출력:개발자가 알아보기 편하게 출력하는법
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return findid;		
	}
	
	// regiAf 
	//객체를 통해서 데이타가 들어옴
	public boolean addMember(MemberDto dto) {
		
		String sql = " insert into member(id, pwd, name, email, auth) "
				+ "    values(?, ?, ?, ?, 3) "; // 유저는 3번 관리자는 1번
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0; //잘 들어갔는지 확인하기 위한 count
				
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 addMember success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			System.out.println("2/3 addMember success");
			
	// executeUpdate: 해당 SQL 문 실행에 영향을 받는 행 수를 반환 , 리턴값: integer
			count = psmt.executeUpdate();		
			System.out.println("3/3 addMember success");
			
		} catch (SQLException e) {
			System.out.println("addMember fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return count>0?true:false;
	}
	
	//login 
	// id와 pwd만 필요함. 로그인 안됐으면 null값 들어옴.
	// 데이타 하나짜리 : if문 사용
	public MemberDto name(String id, String pwd) {
		
		String sql = " select id, name, email, auth " // pwd 꺼낼 필요 없다.
		//		pwd빼고 네개를 넘겨받음 ( pwd는 개인정보라 session에 저장)
				+	" from member "
				+ 	" where id=? and pwd=? "; //둘다 맞아야 함.(id,pwd가 틀리지 않아야함)
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null; // 결과값 데이터 가져오기
		
		MemberDto mem = null;
		
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 getId success");
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			System.out.println("2/3 getId success");
			
			rs = psmt.executeQuery();
			System.out.println("3/3 getId success");
			//데이터 하나니까 if문 사용
			
			if(rs.next()) { // 조건문 참이면 데이터 있는것
//				pwd빼고 네개를 넘겨받음 ( pwd는 개인정보라 session에 저장)
				String _id = rs.getString("id");
				String _name = rs.getString("name");
				String _email = rs.getString("email");
				int _auth = rs.getInt("auth");
				
				mem = new MemberDto( _id, null, _name, _email, _auth);

			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn,  psmt,  rs);
		}
		
		return mem;
		
		
	}
	
}
















