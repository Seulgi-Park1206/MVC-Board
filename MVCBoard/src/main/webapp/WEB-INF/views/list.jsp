<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
</head>
<style>
div{
	width:400px;
	margin:auto;
}
table, tr, td, th{
	border:1px solid black;
}
table{
	border-collapse:collapse;
	width:100%;
	text-align:center;
}
.btn{
	margin-top:10px;
	padding:5px;
}
#btnWrite{
	float:right;
}
#member{
	width:200px;
	float:right;
}
.mem{
	margin-left:5px;
	margin-right:10px;
}

</style>
<body>
<div id=member>
	<a class=mem id=sessId></a>
	<a href="login" class=mem id=aLogin>로그인</a>
	<a href="logout" class=mem id=aLogout>로그아웃</a>
	<a href="signup" class=mem id=aSignup>회원가입</a>
</div>
<div>
	<table id=tblData>
		<tr>
			<th>번호</th><th>작성자</th><th>제목</th><th>작성시각</th><th>조회수</th>
		</tr>
		<c:forEach items="${alData}" var="rec">
		<tr>
			<td>${rec.bId}</td><td>${rec.bName}</td><td>${rec.bTitle}</td><td>${rec.bDate}</td>
			<td>${rec.bHit}</td>
		</tr>
		</c:forEach>
	</table>
	<input type=button class=btn id=btnWrite value="글쓰기" />
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.ready(function(){
	$('#sessId').text("${mobile}");
	if($('#sessId').text() != ""){
		$('#aLogin,#aSignup').css('display','none');
	}else{
		$('#aLogout,#btnWrite').css('display','none');
	}
})
.on('click', '#btnWrite', function(){
	document.location="http://localhost:8181/edu/newpost";
	return false;
})
.on('click', '#tblData tr', function(){
	let bId = $(this).find('td:eq(0)').text();
	document.location="http://localhost:8181/edu/view/"+bId;
	
	return false;
})
</script>
</html>