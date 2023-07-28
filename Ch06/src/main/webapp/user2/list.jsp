<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.User2VO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	// 데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "root";
	String pass = "1234";

	List<User2VO> users = new ArrayList<>();
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `user2`");
		
		while(rs.next()){
			User2VO vo2 = new User2VO();
			vo2.setUid(rs.getString(1));
			vo2.setName(rs.getString(2));
			vo2.setHp(rs.getString(3));
			vo2.setAge(rs.getInt(4));
			
			users.add(vo2);
			
		}
		rs.close();
		stmt.close();
		conn.close();

	}catch(Exception e){
		e.printStackTrace();
	}

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User2 회원 목록</title>
	</head>
	<body>
		<h3>User2 회원 목록</h3>
		
		<a href="/Ch06/1_JDBC.jsp">처음으로</a>
		<a href="/Ch06/user2/register.jsp">User2 등록</a>
		
		<table border="1">
		
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>연락처</th>
				<th>나이</th>
				<th>수정</th>
			</tr>
			<% for(User2VO vo2 : users){ %>
				<tr>
					<td align="center"><%= vo2.getUid() %></td>
					<td align="center"><%= vo2.getName() %></td>
					<td align="center"><%= vo2.getHp() %></td>
					<td align="center"><%= vo2.getAge() %></td>
					<td align="center">
						<a href="/Ch06/user2/modify.jsp?uid=<%= vo2.getUid() %>">정보수정</a>
						<a href="/Ch06/user2/delete.jsp?uid=<%= vo2.getUid() %>">회원삭제</a>
					</td>
				</tr>
			<% } %>
		</table>
		
	</body>
</html>