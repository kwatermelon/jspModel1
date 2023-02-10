<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<style type="text/css">
.center{
	margin: auto;
	width: 60%;
	border: 3px solid #ff0000;
	padding: 10px;
}
</style>

</head>
<body>

<h2>회원가입</h2>
<p>환영합니다</p>

<div class="center">

<!--  회원가입 후에 이동할 화면 -->
<form action="regiAf.jsp" method="post">

<table border="1">
<tr>
	<td>아이디</td>
	<td>
		<input type="text" name="id" id="id" size="20"><br>
		<p id="idcheck" style="font-size: 8px"></p> 
		<input type="button" id="idChkBtn" value="id확인">
		<!--  id확인 누르면 화면 전환 없이 db에서 비교하는 거니까 submit이 아님 -->
	</td>
</tr>
<tr>
	<td>패스워드</td>
	<td>
		<input type="text" name="pwd" id="pwd" size="20">
	</td>
</tr>
<tr>
	<td>이름</td>
	<td>
		<input type="text" name="name" size="20">
	</td>
</tr>
<tr>
	<td>이메일</td>
	<td> 			<!--  type 중 email도 있다! email형식을 맞춰줌-->
		<input type="email" name="email" size="20">
	</td>
</tr>
<tr>	<!--  colspan 가로로 합치기 (열 합치기) -->
	<td colspan="2" align="center">
		<input type="submit" value="회원가입"> 
		<!--  회원가입 누르면 다른 화면으로 가져가야 하니까 submit  -->
	</td>
</tr>
</table>
</form>

</div>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#idChkBtn").click(function() { //id확인 버튼 눌렀을때
		
		// id의 빈칸을 조사! (생략)
		
		$.ajax({
			type:"post",
			url:"idcheck.jsp", // 여기로 가라
			data:{ "id":$("#id").val() }, //id칸에 입력받은 값
			success:function(msg){ // msg : 메시지라는 뜻...
				// alert('success');
				// alert(msg.trim());
			//
				if(msg.trim() == "YES"){
					$("#idcheck").css("color", "#0000ff");
					$("#idcheck").text("사용할 수 있는 아이디입니다");
				}else{
					$("#idcheck").css("color", "#ff0000");
					$("#idcheck").text("사용중인 아이디입니다");
					$("#id").val(""); // id창 지워주기
				}
			},
			error:function(){
				alert('error');
			}
		});
	});
});
</script>

</body>
</html>





