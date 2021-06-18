<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<style>
div{
	width: 300px;
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
table{
	border-collapse: collapse;
}
td{
	border: 1px solid black;
}
.txt{
	width: 96%;
}
</style>
<body>
<div>
	<h2>회원가입</h2><br>
	<form id=signForm action=sign method=post>
		<table class=container>
			<tr><td style='width:35%'>이름</td><td><input type=text class=txt name=username id=username></td></tr>
			<tr><td>성별</td>
				<td>
					<input type=radio name=gender id=genderMale value="male" checked>남
					<input type=radio name=gender id=genderFemale value="female">여
				</td></tr>
			<tr><td>모바일</td><td><input type=text class=txt id=mobile name=mobile></td></tr>
			<tr><td>비밀번호</td><td><input type=text class=txt id=pwd name=pwd></td></tr>
			<tr><td>닉네임</td><td><input type=text class= txt id=nick name=nick></td></tr>
			<tr><td>생년월일</td><td><input type=date class=txt id=birthday name=birthday></td></tr>
			<tr><td>관심분야</td>
				<td>
					<input type=checkbox name=interest value="정치">정치
					<input type=checkbox name=interest value="경제">경제
					<input type=checkbox name=interest value="연예">연예<br>
					<input type=checkbox name=interest value="여행">여행
					<input type=checkbox name=interest value="드라마">드라마
					<input type=checkbox name=interest value="사진">사진<br>
					<input type=checkbox name=interest value="스포츠">스포츠
					<input type=checkbox name=interest value="게임">게임
					<input type=checkbox name=interest value="독서">독서<br>
					<input type=checkbox name=interest value="영화">영화
					<input type=checkbox name=interest value="음악">음악
					<input type=checkbox name=interest value="재테크">재테크
				</td></tr>
		</table>
		<div>
			<input type=button class=btn id=btnSignup value=회원가입>
		   	<input type=button class=btn id=btnReset value=취소>
		</div>
	</form>
</div>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.ready(function(){
	let sess = "${n}";
	if(sess == "1") alert("이미 있는 정보입니다.");
})
.on('click', '#btnSignup', function(){
	let choice = [];
	$("input:checkbox[name=interest]:checked").each(function(){
		let ch = $(this).val();
		choice.push(ch);
	})
	if($('#username').val() == ""){
		alert('이름을 입력하세요!');
	}else if($('#mobile').val() == ""){
		alert('모바일번호를 입력하세요!');
	}else if($('#pwd').val() == ""){
		alert('비밀번호를 입력하세요!');
	}else if($('#nick').val() == ""){
		alert('닉네임을 입력하세요!');
	}else if($('#birthday').val() == ""){
		alert('생년월일을 입력하세요!');
	}else if(choice.length == 0){
		alert('관심분야를 선택하세요!');
	}else{
		$('#signForm').submit();
	}
	
	return false;
})
.on('click', '#btnReset', function(){
	document.location="http://localhost:8181/edu/";
	
	return false;
})
</script>
</html>