<%@page import="com.hm.VO.groupVO"%>
<%@page import="com.hm.VO.studentVO"%>
<%@page import="java.util.ArrayList"%>
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
}

</style>

<body>
	<%@ include file="header.jsp"%>
	<%@ include file="nav.jsp"%>
	<section>
	<% ArrayList <groupVO> glist=(ArrayList)request.getAttribute("groupS"); %>
		<table border="1">
			<tr>
			<th>학생이름</th>
			<th>클래스 이름</th>
			<th>교수명</th>
			<th>등록일</th>
			
			</tr>
		

		<%
			for(int i=0; i<glist.size(); i++){
				groupVO gvo=glist.get(i);
				out.print("<tr>");
				out.print("<td>"+gvo.getSn()+"</td>");
				out.print("<td>"+gvo.getCn()+"</td>");
				out.print("<td>"+gvo.getPn()+"</td>");
				out.print("<td>"+gvo.getId().substring(0,10)+"</td>");				
				out.print("</tr>");
			}
		%>
		
		</table>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>