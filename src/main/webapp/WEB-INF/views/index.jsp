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
}
a:hover{
	background-color:lightgrey;
	color:black;
}
</style>

</head>
<body>

<h1>simpleBbs homepage</h1>
<a href="saveForm"> 게시글 등록하기</a>
<a href="list">게시글 리스트보기</a>
<script>
var xhr = new XMLHttpRequest();
var url = 'https://apis.data.go.kr/1051000/recruitment/list?serviceKey=9Sk7aRt2n18P6Tr%252Firp6uxzUoMkoRQdIexIyj79sWmo96dCdmfD47VvqlhdXcegKBsziGdsmIoI5%252BiUm%252FAZUJQ%253D%253D'
xhr.open('GET', url);
xhr.onreadystatechange = function () {
	if (this.readyState == xhr.DONE) {  // <== 정상적으로 준비되었을때
	if(xhr.status == 200||xhr.status == 201){ // <== 호출 상태가 정상적일때
//			alert('Status: '+this.status+
//				'\nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+
//				'\nBody: '+this.responseText);
//			}
	console.log('Status: '+this.status+
			'\nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+
			'\nBody: '+this.responseText);
		}
	}
};
xhr.send('');
</script>
</body>
</html>