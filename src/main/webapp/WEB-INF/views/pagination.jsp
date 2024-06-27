<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
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
<h1>list page</h1>
<h3>총 게시글 수 :<span id="count"> ${count } </span></h3>
<a href="deleteAll" onclick="return confirmed()"> 글 전체삭제 </a>
<div id="info"></div>
<table id="table">
	<tr>
		<th>번호</th>
		<th>내용</th>
		<th>작성자</th>
	</tr>
	
	<c:forEach var="list" items="${pageList }" varStatus="status">
		<tr>
			<td><a id="bno" href="detail?bno=${list.bno}">${ (curPage-1)*10 +status.count}</a></td>
			<td>${list.content }</td>
			<td>${list.writer }</td>
		</tr>
	</c:forEach>

<%-- <c:if test="${start ne 1 }"> --%>
<%-- 	<span><a href="pagination?pageNum=${start -5 }"> 이전 </a></span> --%>
<%-- </c:if> --%>

<%-- <c:forEach var="i" begin="${start }" end="${(end < realEnd) ? end : realEnd }" > --%>
<%-- 	<a href="pagination?pageNum=${i} ">${i }</a> --%>
<%-- </c:forEach> --%>


<%-- <c:if test="${end < realEnd }"> --%>
<%-- 	<span><a href="pagination?pageNum=${end +1 }"> 다음 </a></span> --%>
<%-- </c:if> --%>

</table>
<div id="pagination"></div>



<script>
	const blockLength = 5;
	let length;
	let totalPageBlock;
	let curPageBlock=1;
	
	function confirmed(){
		if(!confirm("정말로 모든 글을 다 지우시겠습니까?")){
			location.href="list";
		};
	}
	
	if(${list.size() == 0}){
		document.querySelector("#count").innerHTML = "  0";
		document.querySelector("#table").style.display="none";
		document.querySelector("#info").innerHTML = "현재 등록된 게시물이 없습니다. 밑의 글쓰기 버튼을 눌러 글을 등록해보세요. <br>🔻🔻🔻🔻🔻🔻 <br> <a href='saveForm'>글쓰기</a>"
	}

	
	
	function calcPage(){
		const blockLength = 5;
		let length;
		let totalPageBlock;
		let curPageBlock = Number("${pageBlock}");
		
		
		
		//총 page수 계산
		length = Math.trunc(${count}/10);
		if(${count}%10 != 0){
			length = Math.trunc(${count}/10) + 1;
		}
		//pageBlock계산
		totalPageBlock = Math.trunc(length/blockLength);
		if(length%blockLength != 0 ){
			totalPageBlock = Math.trunc(length/blockLength) + 1;	
		}
		
		//pageBlock만큼 밑에 a태그 넣어주기
		//totalPageBlock == curPageBlock 인 경우 (totalPageblock이 1이고 다음 페이지가 없는 경우)
		//a link 만들어주기

		if(curPageBlock == 1){
			for(i = 1; i<blockLength+1; i++){
				document.querySelector("#pagination").innerHTML += "<a href='pagination?page="+i+"&&pageBlock="+curPageBlock+"'"+">"+i+"</a>";
			}
		}else if(curPageBlock >1 ){
			console.log(length);
			console.log((curPageBlock-1)*5 +1);
			let startIdx = (curPageBlock-1)*5 +1;
			let endIdx = curPageBlock*5+1;
			if(length == (curPageBlock-1)*5 +1 ){
				endIdx = startIdx+1;
			}
			for(i = startIdx ; i<endIdx; i++){
				document.querySelector("#pagination").innerHTML += "<a href='pagination?page="+i+"&&pageBlock="+curPageBlock+"'"+">"+i+"</a>";
			}
			
		}
			
				
		if(totalPageBlock > 1){
			const temp = document.createElement("span")
			temp.innerHTML="<a id='next' href='pagination?page="+(curPageBlock*5+1)+"&&pageBlock="+(curPageBlock+1)+"'"+">다음</a>"
			document.querySelector("#pagination").append(temp);

			if(curPageBlock > 1 ){
				const temp1 = document.createElement("span")
				temp1.innerHTML="<a href='pagination?page="+((curPageBlock-1)*5)+"&&pageBlock="+(curPageBlock-1)+"'"+">이전</a>"
				document.querySelector("#pagination").prepend(temp1);
			
			
			}
			if(totalPageBlock == curPageBlock){
				console.log("xx")
				document.querySelector("#next").style.display="none";
			}
			
			
		}
		
		
		//a태그는 5개씩 하나의 페이지 블록으로 넣어주기
		
	}

	calcPage();
</script>

</body>
</html>