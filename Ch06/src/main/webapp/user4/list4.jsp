<%@page import="vo.User4VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String host = "jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "root";
	String pass = "1234";
	
	List<User4VO> users = new ArrayList<>();
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `user4`");
		
		while(rs.next()){
			User4VO vo4 = new User4VO();
			vo4.setSeq(rs.getInt(1));
			vo4.setName(rs.getString(2));
			vo4.setGender(rs.getInt(3));
			vo4.setAge(rs.getInt(4));
			vo4.setAddr(rs.getString(5));
			
			users.add(vo4);
			
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
		<title>user4::list</title>
	</head>
	<body>
		<h3>user4::list</h3>
		<a href="/Ch06/1_JDBC.jsp">처음으로</a>
		<a href="/Ch06/user4/register4.jsp">User4 등록</a>
		
		<table border="1">
			<tr>
				<th>이름</th>
				<th>성별</th>
				<th>나이</th>
				<th>주소</th>
				<th>회원관리</th>
			</tr>
			<% for(User4VO vo4 : users){ %>
			<tr>
				<td style="display: none"><%= vo4.getSeq() %></td>	
				<td><%= vo4.getName() %></td>
				<td><%= vo4.getGender() %></td>
				<td><%= vo4.getAge() %></td>
				<td><%= vo4.getAddr() %></td>
				<td>
					<a href="/Ch06/user4/modify4.jsp?seq=<%= vo4.getSeq() %>">정보수정</a>
					<a href="/Ch06/user4/delete4.jsp?seq=<%= vo4.getSeq() %>">회원탈퇴</a>
				</td>
			</tr>
			<% } %>
		</table>
	</body>
</html>
