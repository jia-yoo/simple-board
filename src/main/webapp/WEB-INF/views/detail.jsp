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
a{
	background-color:orange;
	width:100%;
	padding:10px;
	text-decoration:none;
	color:white;
	font-weight:bold;
	margin: 0 20px;
}
a:hover{
	background-color:lightgrey;
	color:black;
}

table{
	margin:50px auto;
	width:800px;
}
table tr, td{
	border-top: 1px solid lightgrey;
	border-bottom: 1px solid lightgrey;
	padding:15px;
}
</style>
</head>
<body>
<table>
	<tr>
		<th>번호</th>
		<td>${simpleBbs.bno}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${simpleBbs.content }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${simpleBbs.writer }</td>
	</tr>
</table>
<a href="updateForm?bno=${simpleBbs.bno}"> 글 수정 </a>
<a href="delete?bno=${simpleBbs.bno}"> 글 삭제 </a>
<a href="list"> 리스트로 돌아가기 </a>

<script>

if(${result ne null}){
	if(${result eq true}){
		alert("성공적으로 글을 삭제했습니다. 리스트 페이지로 돌아갑니다.");
		location.href="list";
	}
}
</script>
</body>
</html>