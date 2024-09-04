<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	List<Map<String, Object>> articleListMap = (List<Map<String, Object>>) request.getAttribute("articleListMap"); 
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
</head>
<body>
	<div>게시물 리스트</div>
	<ul>
	<% for(Map<String, Object> articleMap : articleListMap) { %>
		<li><%=articleMap.get("id")%> | <%=articleMap.get("regDate")%> | <%=articleMap.get("title")%> </li>
	<% } %>
	</ul>
</body>
</html>