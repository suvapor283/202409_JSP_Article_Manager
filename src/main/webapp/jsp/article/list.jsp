<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	List<Map<String, Object>> articleListMap = (List<Map<String, Object>>) request.getAttribute("articleListMap"); 
	int totalPageCnt = (int) request.getAttribute("totalPageCnt");
	int cPage = (int) request.getAttribute("cPage");
	int from = (int) request.getAttribute("from");
	int end = (int) request.getAttribute("end");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article List</title>
</head>
<body>
	<h2>Article List</h2>
	
	<div><a href="../home/main">메인</a></div>
 
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성일</th>
				<th>제목</th>
			</tr>
		</thead>
		
		<tbody>
			<% for(Map<String, Object> articleMap : articleListMap) { %>
			<tr>
				<td><%=articleMap.get("id")%></td>
				<td><%=articleMap.get("regDate")%></td>
				<td><a href="detail?id=<%=articleMap.get("id")%>"><%=articleMap.get("title")%></a></td>
			</tr>
			<% } %>
		</tbody>
	</table>
	
	<div>
		<% for(int i = from; i <= end; i++) { %>
		<a href="?cPage=<%= i %>"><%= i %></a>
		<% } %>
	</div>
</body>
</html>