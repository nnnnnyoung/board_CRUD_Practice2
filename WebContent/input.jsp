<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<style>
	section{
		background-color: beige;
		width: 1024px;
		height: 400px;
		
	}
	table{
		text-align: center;
	} 
</style>
<body>
	<%@ include file="header.jsp"%>
	<%@ include file="nav.jsp"%>

	<section>
		<table border="1">
			<form id="inputF" action="join" method="post">
			<tr>
				<td>번호 </td>
				<td><input type="text" value="${no}" name="no" readonly></td>
			</tr>
			<tr>
				<td>이름</td> 
				<td><input type="text" id="name" name="name">
				</td>
			</tr>
			<tr>
				<td>전화번호</td> 
				<td><input type="text" id="tel" name="tel">
				</td>
			</tr>
			<tr>
				<td>주소 </td>
				<td><input type="text" id="address" name="address">
				</td>
			</tr>
			<tr>
				<td> 학년 </td>
				<td>
				1학년 <input type=radio name="grade" value="1" checked="checked">
				2학년 <input type=radio name="grade" value="2">
				3학년 <input type=radio name="grade" value="3">
				4학년 <input type=radio name="grade" value="4">
				</td>
			</tr>
			<tr>
				<td colspan="3">
				<input type="button" value="등록" onclick="chk()">
				</td>
			</tr>
			</form>
		</table>
	</section>

	<%@ include file="footer.jsp"%>
	
	<script type="text/javascript">
	
	chk=()=>{
		
		var name=document.getElementById("name").value;
		var tel=document.getElementById("tel").value;	
		var ad=document.getElementById("address").value;
		console.log(name);
		if(name==""){
			alert("이름을 입력해주세요")
			return;
		}else if(tel==""){
			alert("전화번호를 입력해주세요")
			return;
		}else if(ad==""){
			alert("주소를 입력해주세요")
			return;
		}else {
			alert("등록완료")
			inputF.submit();
		}		
	}
	
	</script>
</body>
</html>