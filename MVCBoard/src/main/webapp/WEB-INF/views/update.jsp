<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
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
	width:100%;
	text-align:center;
}
textarea{
	width:98%;
	height:100%;
	resize:none;
}
#bId, #bName, #bTitle{
	width:97%;
}
.btn{
	margin:10px 0px 10px 10px;
	padding:5px;
}
#divBtn{
	width:27%;
	float:right;
}
</style>
<body>
<div>
	<form action="/edu/update" method="post">
		<table>
			<tr><td>번호</td><td><input type=text name=bId id=bId readonly></td></tr>
			<tr><td>작성자</td><td><input type=text name=bName id=bName readonly></td></tr>
			<tr><td>제목</td><td><input type=text name=bTitle id=bTitle></td></tr>
			<tr><td>내용</td><td><textarea cols=40 rows=10 name=bContent>${rec.bContent}</textarea></td></tr>
		</table>
		<div id=divBtn>
			<input type=submit class=btn value='확인'>
			<input type=button class=btn value="취소" onclick="document.location='http://localhost:8181/edu/list'">
		</div>
	</form>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.ready(function(){
	$('#bId').val('${rec.bId}');
	$('#bName').val('${rec.bName}');
	$('#bTitle').val('${rec.bTitle}');
})
</script>
</html>