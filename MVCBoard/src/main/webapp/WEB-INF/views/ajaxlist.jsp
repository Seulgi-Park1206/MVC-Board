<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax list</title>
</head>
<body>
<table id=tbl>
</table><br>
<input type=button id=btnAjax value='ajax receive'>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click', '#btnAjax', function(){
	$.ajax({
        url:'ajaxtest'
        , method : 'POST'
        , data: {}
        , contentType : 'application/json; charset=UTF-8'
        , dataType : 'json'
        , success :
        	function output(resp){
	        	var result = '';
		        result +='<table border="1">'
		        result +='<tr><th>게시물번호</th><th>작성자</th><th>제목</th></tr>'
		        $.each(resp,function(index,item){
		            result +='<tr><td>'+item["bId"]+'</td>'
		            result +='<td>'+item["bName"]+'</td>'
		            result +='<td>'+item["bTitle"]+'</td></tr>'
		        })
		        result +='</table>'
		        $('#tbl').append(result)
        	}
	});

})
</script>
</html>