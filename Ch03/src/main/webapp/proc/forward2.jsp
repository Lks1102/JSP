<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>forward1</title>
	</head>
	<body>
		<h3>forward1 page</h3>
		
		<%
			// forward는 서버 자원내에서 제어권 이동이기 때문에 타 서버 자원으로 이동 안됨.
			pageContext.forward("https://naver.com");
			//pageContext.forward("./redirect2.jsp"); 
		%>
		
	</body>
</html>