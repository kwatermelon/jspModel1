package dto;

import java.io.Serializable;
								// 직렬화
public class MemberDto implements Serializable{
//회원은 몇명일지 알 수 없다. 그 데이터를 일렬로 세우는 것이 Serializable
	
//	이 문장 안 넣어도 상관 없다
//	private static final long serialVersionUID = 1L;
	

	private String id;
	private String pwd;
	private String name;
	private String email;
	private int auth;		// 사용자는 3번 줄 거고 관리자는 1번 줄 거임
	
	//생성자
	public MemberDto() {
	}
	//매개변수 생성자
	public MemberDto(String id, String pwd, String name, String email, int auth) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.auth = auth;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", auth=" + auth + "]";
	}
}
