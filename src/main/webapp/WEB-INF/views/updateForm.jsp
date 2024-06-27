<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
	text-align:center;
}
h1{
	background-color:orange;
	padding:10px;
	color:white;
}


form{
	margin:50px auto;
	width:800px;
}
input {
	border-top: 1px solid lightgrey;
	border-bottom: 1px solid lightgrey;
	margin:10px;
	padding:15px;
	width:300px;
	
}

#btn{
	border:none;
	background-color:orange;
	text-decoration:none;
	color:white;
	font-weight:bold;
}
#btn:hover{
	background-color:lightgrey;
	color:black;
}
</style>
</head>
<body>
<h1>수정 페이지</h1>
<form action="update" method="post">
	<input type="text" name="bno" value="${simpleBbs.bno }" style="display:none">
	<input type="text" name="content" value="${simpleBbs.content }"> <br>
	<input type="text" name="writer" value="${simpleBbs.writer }"> <br>
	<input id="btn" type="submit" value="수정하기">
</form>
<script>

if(${result ne null}){
	if(${result eq true}){
		alert("성공적으로 글을 수정했습니다. 리스트 페이지로 돌아갑니다.");
		location.href="list";
	}
}
</script>
</body>
</html>