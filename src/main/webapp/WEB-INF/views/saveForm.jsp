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
<h1>글 작성 페이지 </h1>
<form action="save" method="post">
	<input type="text" name="content" placeholder="내용"> <br>
	<input type="text" name="writer" placeholder="작성자"> <br>
	<input id="btn" type="submit" value="등록하기">
</form>

</body>
</html>