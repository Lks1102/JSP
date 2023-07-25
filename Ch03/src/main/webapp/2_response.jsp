<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2_response</title>
		<!-- 
			날짜 : 2023/07/25
			이름 : 이규석
			내용 : JSP response 내장객체 실습
			
			response 내장객체
			 - 클라이언트 -> 서버로 요청한 결과를 응답해주는 객체
			 - 서버 -> 클라이언트로 전송 객체
			 
			redirect
			 - 서버 -> 클라이언트로 다시 요청을 명령하는 response 기능
			 - 최종 요청주소가 반영 cf) forward는 최초 요청주소가 반영
			
		-->		
				
	</head>
	<body>
		<h3>response</h3>
		
		<a href="./proc/redirect1.jsp">리다이렉트 페이지 요청1</a>
		<a href="./proc/redirect2.jsp">리다이렉트 페이지 요청2</a>
		<a href="./proc/requestFile.jsp">파일요청</a>
				
	</body>
</html>