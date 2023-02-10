<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	//   로그인할 때 넘어오는건 id, pwd
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//싱글턴 사용하기
	MemberDao dao = MemberDao.getInstance();
		
	//dao에서 로그인 하고 리턴해주니까 리턴값 받기
	MemberDto mem = dao.login(id, pwd);
	
	if(mem !=null){
		//로그인 회원정보
		//session 얻어와야함. 방법 2가지 있음
	// 방법1. request.getSession()
	
	// 방법2. jsp : Attribute로 저장해놓기 -언제든지 꺼내볼 수 있다.
		session.setAttribute("login", mem);
	//	session.setMaxInactiveInterval(60*60*2); //세션 유효기간:2시간
		
		
		%>
		<script type="text/javascript">
		alert("환영합니다. <%=mem.getId() %>님");
	//	location.href = "";
		
		</script>
		<%
	}else{	// 안 맞았을때
		%>
		<script type="text/javascript">
		alert("아이디나 패스워드를 확인하십시오");
		location.href = "login.jsp";
		</script>
		<%
		
	}

	%>

