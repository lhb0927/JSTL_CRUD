<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LAB12-3</title>
</head>
<body>

<%@page import="dao.contentDao"%>  
<jsp:useBean id="u" class="com.content"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%  
contentDao.delete(u);  
response.sendRedirect("index.jsp");  
%>  

</body>
</html>