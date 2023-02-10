<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--  jquery 링크 카피  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- cookie 링크 카피 -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

<!--  css -->
<style type="text/css">
.center{						<!--  class는 . 로 불러온다  -->
	margin: auto;  			
	width: 60%;
	border: 3px solid #ff0000;
	padding: 10px;
}
</style>

</head>
<body>

<h2>login page</h2>

<div class="center"> 

<form action="loginAf.jsp" method="post"> <!--  login은 보안이 중요하니까 post방식(get x) -->

<table border="1">
<tr>
	<th>아이디</th>
	<td>
		<input type="text" id="id" name="id" size="20"><br>
		<input type="checkbox"  id="chk_save_id">id 저장
	</td>
</tr>
<tr>
	<th>패스워드</th>
	<td>
		<input type="password" name="pwd" size="20"> <!--  type을 password로 설정 가능 -->
	</td>
</tr>
<tr>
	<td colspan="2"> 		<!-- colspan: 컬럼 합치기 -->
		<input type="submit" value="log-in">
		<a href="regi.jsp">회원가입</a> <!--  회원가입 화면으로 이동 -->
	</td>
</tr>
</table>

</form>  
</div>

<script type="text/javascript">
/*
	cookie : id저장, pw저장 == String  	client
 	session : login한 정보 == Object		server
*/

//cookie 안에 user_id를 꺼내온다
let user_id = $.cookie("user_id");

  
if(user_id != null){	// user_id가 있다면 (저장한 id가 있음)
	$("#id").val(user_id);  //값을 id=id에 넣어준다.
	$("#chk_save_id").prop("checked", true); //id저장버튼 체크되게 한다
}

$("#chk_save_id").click(function () { //id저장버튼 클릭했을 때
	
	if( $("#chk_save_id").is(":checked") == true ){ //체크됐다면
		
		if( $("#id").val().trim() == "" ){		// id값이 공백없이 "" 빈칸이면
			alert('id를 입력해 주십시오');
			$("#chk_save_id").prop("checked", false); // 빈칸이면 체크 강제 해제
		}else{				// id값이 입력됐다면 (공백이 아니라면)
			
			// cookie에 id를 저장한다.
/*
expires : 만료일을 의미한다. expires:7은 7일동안 해당 쿠키를 유지한다는 이야기다.
path : 경로설정이다. 이 사이트의 모든 페이지가 해당된다면 / 이렇게 슬러시만 둔다.
*/
			$.cookie("user_id", $("#id").val().trim(), { expires:7, path:'./' });
		}						
		
	}else{  // 체크가 안됐다면 쿠키에서 id를 삭제해버림!!
		$.removeCookie("user_id", { path:'./' });
	}					// 경로설정 : { path:'./' } 이 사이트의 모든 페이지
});

</script>

</body>
</html>





