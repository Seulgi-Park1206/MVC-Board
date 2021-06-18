<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Login</title>
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
#btnWrite{
	float:right;
	margin-top:10px;
	padding:5px;
}
</style>
<body>
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
<input type=button id=btnWrite value="글쓰기" />
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click', '#btnWrite', function(){
	document.location="http://localhost:8181/edu/newpost";
	return false;
})
.on('click', '#tblData tr', function(){
	/* let bId = $(this).children().eq(0).text(); */
	let bId = $(this).find('td:eq(0)').text();
	document.location="http://localhost:8181/edu/view/"+bId;
	
	return false;
})
</script>
</html>
