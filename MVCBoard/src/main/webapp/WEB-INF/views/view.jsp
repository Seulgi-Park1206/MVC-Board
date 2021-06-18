<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view</title>
</head>
<style>
div{
	width:400px;
	margin:auto;
}
table, tr, td{
	border:1px solid black;
}
table{
	border-collapse:collapse;
	width:400px;
	text-align:center;
}
.btn{
	margin:10px 10px 10px 0px;
	padding:5px;
}
#divBtn{
	width:60%;
	float:right;
}
</style>
<body>
<div>
	<table id=tblData>
		<tr><td>게시물번호</td><td>${rec.bId }</td></tr>
		<tr><td>작성자</td><td>${rec.bName }</td></tr>
		<tr><td>제목</td><td>${rec.bTitle }</td></tr>
		<tr><td>내용</td><td>${rec.bContent }</td></tr>
		<tr><td>조회수</td><td>${rec.bHit }</td></tr>
		<tr><td>작성일</td><td>${rec.bDate }</td></tr>
	</table>
	<div id=divBtn>
		<input type=button class=btn id=btnUpdate value='수정'>
		<input type=button class=btn id=btnDelete value='삭제'>
		<input type=button class=btn id=btnWrite value='글쓰기'>
		<input type=button class=btn id=btnList value='목록'>
	</div>
</div>
<input type=hidden id=hiddenSession>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.ready(function(){
	$('#hiddenSession').val("${mobile}");
})
.on('click', '#btnUpdate', function(){
	let bId = $('#tblData').find('tr:eq(0) td:eq(1)').text();
	document.location="http://localhost:8181/edu/modify/"+bId;
	return false;
})
.on('click', '#btnDelete', function(){
	if(confirm("삭제하시겠습니까?")){
		let bId = $('#tblData').find('tr:eq(0) td:eq(1)').text();
		document.location="http://localhost:8181/edu/delete/"+bId;		
	}
	return false;
})
.on('click', '#btnWrite', function(){

 	if($('#hiddenSession').val() == ""){
		alert('권한이 없습니다. 로그인 후 이용하세요!');
	}else{
		document.location="http://localhost:8181/edu/newpost";
	}
	return false;
})
.on('click', '#btnList', function(){
	document.location="http://localhost:8181/edu/";
	return false;
})
</script>
</html>