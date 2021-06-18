<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write</title>
</head>
<style>
table, tr, td{
	border:1px solid black;
}
table{
	border-collapse:collapse;
	width:400px;
	text-align:center;
	margin:auto;
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
	margin:10px 10px;
	padding:5px;
}
</style>
<body>
<form action="write" method="post">
<table>
	<tr><td>작성자명</td><td><input type=text name=bName></td></tr>
	<tr><td>제목</td><td><input type=text name=bTitle></td></tr>
	<tr><td>내용</td><td><textarea cols=40 rows=10 name=bContent></textarea></td></tr>
	<tr><td colspan=2>
		<input type=submit class=btn value="등록">&nbsp;
		<input type=button class=btn value="취소" onclick="document.location='http://localhost:8181/edu/'">
	</td></tr>
</table>
</form>
</body>
</html>