    package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
// 이 창은 드라이버를 확인하고 커넥션되는 정보를 얻기 위한 창
	
//이 드라이브가 있는지 한번 확인
	//언제든지 부를 수 있도록 static으로 만들어놓음	
	public static void initConnection() {
		try {
/*1번*/	Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loading Success");
		} catch (ClassNotFoundException e) {			
			System.out.println("DB Driver를 찾지 못했습니다");
			e.printStackTrace();
		}
	}
// db에 대한 커넥션 정보를 수시로 얻어옴
	//언제든지 부를 수 있도록 static으로 만들어놓음	
/*2번*/	public static Connection getConnection() {
		Connection conn = null;		
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "1234");
			System.out.println("Connection Success");			
		} catch (SQLException e) {			
			System.out.println("db을 연결하지 못했습니다");
			e.printStackTrace();
		}	
		return conn;
	}
	// 접속해제는 DBClose파일에 따로 만들기	
	
}// DBConnection end

    
