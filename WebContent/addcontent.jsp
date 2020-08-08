<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<%@page import="dao.contentDao"%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LAB12-3</title>
</head>
<body>

<jsp:useBean id="u" class="com.content"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
  
<%  
int i= contentDao.save(u);  
if(i>0){  
response.sendRedirect("addcontent-success.jsp");  
}else{  
response.sendRedirect("addcontent-error.jsp");  
}  
%>  

</body>
</html>