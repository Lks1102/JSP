<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="vo.User3VO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	String host = "jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "root";
	String pass = "1234";
	
	List<User3VO> users = new ArrayList<>();
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `user3`");
		
		while(rs.next()){
			User3VO vo3 = new User3VO();
			vo3.setUid(rs.getString(1));
			vo3.setName(rs.getString(2));
			vo3.setHp(rs.getString(3));
			vo3.setAge(rs.getInt(4));
			
			users.add(vo3);
			
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
		<title>User3_list3</title>
	</head>
	<body>
		<h3>User3_회원목록</h3>
		<a href="/Ch06/1_JDBC.jsp">처음으로</a>
		<a href="/Ch06/user3/register3.jsp">User3 등록</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>연락처</th>
				<th>나이</th>
				<th>회원관리</th>
			</tr>
			<% for(User3VO vo3 : users){ %>
			<tr>
				<td><%= vo3.getUid() %></td>
				<td><%= vo3.getName() %></td>
				<td><%= vo3.getHp() %></td>
				<td><%= vo3.getAge() %></td>
				<td>
					<a href="/Ch06/user3/modify3.jsp?uid=<%= vo3.getUid() %>">정보수정</a>
					<a href="/Ch06/user3/delete3.jsp?uid=<%= vo3.getUid() %>">회원탈퇴</a>
				</td>
			</tr>			
			<% } %>
		</table>
		
		
		
	</body>
</html>