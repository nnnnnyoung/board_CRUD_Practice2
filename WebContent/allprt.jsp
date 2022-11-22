<%@page import="java.util.ArrayList"%>
<%@page import="com.hm.VO.*"%>
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
		text-align: center;
	}

</style>
<body>
	<%@ include file="header.jsp"%>
	<%@ include file="nav.jsp"%>
	<section>
		<table>
			<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>등록일자</th>
			<th>학년</th>
			</tr>	
		<%  ArrayList <studentVO> allS=(ArrayList)request.getAttribute("allS"); %>
		
		<% 
			for(int i=0; i<allS.size(); i++){
				studentVO svo=allS.get(i);
				out.print("<tr>");
				out.print("<td><a href='"+request.getContextPath()+"/modi?mno="+svo.getNo()+"'>"+svo.getNo()+"</td>");
				out.print("<td>"+svo.getName() +"</td>");
				out.print("<td>"+ svo.getTel()+"</td>");
				out.print("<td>"+svo.getAddress() +"</td>");
				out.print("<td>"+svo.getJoindate().substring(0,10) +"</td>");
				out.print("<td>");
				if(svo.getGrade().equals("1")){
					out.print("A");
				}else if(svo.getGrade().equals("2")){
					out.print("B");
				}else if(svo.getGrade().equals("3")){
					out.print("C");
				}else if(svo.getGrade().equals("4")){
					out.print("D");
				}
				out.print("</td>");		 		
				out.print("</tr>");
			}
		%>
		
		</table>
	</section>
	
	<%@ include file="footer.jsp"%>
</body>
</html>