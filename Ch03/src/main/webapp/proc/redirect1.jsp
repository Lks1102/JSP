<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>redirect1</title>
	</head>
	<body>
		
		<h3>redirect1 Page</h3>
		
		<%
			response.sendRedirect("../1_request.jsp");	
			
		%>
		
	</body>
</html>