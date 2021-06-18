<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<style>
div{
	width: 250px;
	margin: auto;
	text-align: center;
}
.btn{
	margin-top: 10px;
	margin-right: 15px;
	padding: 5px;
}
h2{
	margin: auto;
}
.container{
	width: 100%;
}
</style>
<body>
<div>
	<h2>로그인</h2><br><input type=hidden id=hiddenSession><br>
	<form id=loginForm action=/edu/logincheck method=post>
		<table class=container>
			<tr><td>모바일</td><td><input type=text name=mobile id=mobile placeholder=Mobile></td></tr>
			<tr><td>비밀번호</td><td><input type=password name=pwd id=pwd placeholder=PassWord></td></tr>
			<tr><td align=center colspan=2>
		   		<input type=button class=btn id=btnLogin value=로그인>
		        <input type=button class=btn id=btnSignup value=회원가입></td></tr>
		</table>	
	</form>
</div>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.ready(function(){
	$('#hiddenSession').val("${n}");
	if($('#hiddenSession').val() == "0"){
		alert("아이디 또는 비밀번호가 틀렸습니다.")
	}
})
.on('click', '#btnLogin', function(){
	if($('#mobile').val() == ""){
		alert('모바일번호를 입력하세요!');
		$('#mobile').focus();
	} else if($('#pwd').val() == ""){
		alert('비밀번호를 입력하세요!');
		$('#pwd').focus();
	} else{
		$('#loginForm').submit();
	}
	
	return false;
})
.on('click', '#btnSignup', function(){
	document.location="http://localhost:8181/edu/signup";
	
	return false;
})
</script>
</html>