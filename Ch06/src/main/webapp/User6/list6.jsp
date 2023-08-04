<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="vo.User3VO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User6_list6</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
		<script>
		
		
			$(function() {
				
				// 문서 로딩이 끝나고 바로 AJAX 요청
				$.ajax({
					url:'./listProc6.jsp',
					type:'GET',
					dataType:'json',
					success: function(data) {
						
						for(let user of data){
							let tr = `<tr>
										<td>\${user.uid}</td>
										<td>\${user.name}</td>
										<td>\${user.hp}</td>
										<td>\${user.age}</td>
										<td>
											<a href='./modify6.jsp?uid=\${user.uid}'>수정</a>
											<a href='./delete6.jsp?uid=\${user.uid}'>삭제</a>
										</td>
									</tr>`;
							$('table').append(tr);
						}
						
					}
					
				});	
			
				
			});
			
			
			
		</script>
		
	</head>
	<body>
	
		<h3>User6_회원목록</h3>
		<a href="/Ch06/1_JDBC.jsp">처음으로</a>
		<a href="/Ch06/User6/register6.jsp">User6 등록</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>연락처</th>
				<th>나이</th>
				<th>회원관리</th>
			</tr>
		</table>
		
	</body>
</html>