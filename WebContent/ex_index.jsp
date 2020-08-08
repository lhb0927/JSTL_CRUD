<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="dao.contentDao,com.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LAB12-3</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<%
		List<content> list = contentDao.getAllRecords();
		request.setAttribute("list", list);
	%>
	
	<div class="container">

		<h1>List of Contents</h1>


		<div class="table-responsive-sm">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>No</th>
						<th>Title</th>
						<th>Author</th>
						<th>Comment</th>
						<th class="d-print-none"><a class="btn btn-sm btn-success"
							href="create.jsp">Add</a></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="u">
						<tr>
							<td>${u.getId()}</td>
							<td>${u.getTitle()}</td>
							<td>${u.getAuthor()}</td>
							<td>${u.getComments()}</td>
							<td class="d-print-none"><a class="btn btn-sm btn-warning"
								href="edit.jsp?id=${u.getId()}">Edit</a></td>
							<td><a class="btn btn-sm btn-danger"
								href="delete.jsp?id=${u.getId()}">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>