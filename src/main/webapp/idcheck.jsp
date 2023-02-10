<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//싱글턴은 어디서나 접근 가능하니까 싱글턴으로 만들어놓은 MemberDao 에서 갖다쓰면된다.
	String id = request.getParameter("id");
	System.out.println("id:" + id); 

	//싱글턴인 MemberDao 불러오기
	MemberDao dao = MemberDao.getInstance();
	boolean b = dao.getId(id); // dao의 getid에 id가 있는지 없는지
	
	if(b == true){	// id 있음
		out.println("NO");
	}else{		// id가 없음
		out.println("YES");
	}
%>


