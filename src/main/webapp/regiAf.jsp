<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 회원가입창!

	//DB에 넣을때는 항상 한글 깨짐 설정 해준다.
	request.setCharacterEncoding("utf-8");

	//getParameter 넘어옴
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	//싱글턴인 MemberDao 불러오기
	MemberDao dao = MemberDao.getInstance();
	
	//어차피 db에 들어가지 않으니까 0이라고 해도됨
	//dao에 ? ? ? ?  퀘스천 네개니까! 
	MemberDto dto = new MemberDto(id, pwd, name, email, 0);
	boolean isS = dao.addMember(dto);
	if(isS){
		%>    <!--  자바스크립트 영역 -->
			<script type="text/javascript">
			alert("성공적으로 가입되었습니다");
			location.href = "login.jsp";
			</script>
		<%
	}else{		
		%>	  <!--  자바스크립트 영역 -->
			<script type="text/javascript">
			alert("다시 가입해 주십시오");
			location.href = "regi.jsp";
			</script>
		<%
	}
%>





