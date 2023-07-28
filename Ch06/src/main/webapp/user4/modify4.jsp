<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="vo.User4VO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String seq = request.getParameter("seq");
	
	String host = "jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "root";
	String pass = "1234";
	
	User4VO vo4 = new User4VO();
	
	try{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		PreparedStatement psmt = conn.prepareStatement("select * from `user4` where `seq`=?");
		psmt.setString(1, seq);
		
		ResultSet rs = psmt.executeQuery();

		
		if(rs.next()){

			vo4.setName(rs.getString(2));
			vo4.setGender(rs.getInt(3));
			vo4.setAge(rs.getInt(4));
			vo4.setAddr(rs.getString(5));
			vo4.setSeq(rs.getInt(1));
			
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user4::modify</title>
	</head>
	<body>
		<h3>user4::정보수정</h3>
		<a href="/Ch06/1_JDBC.jsp">처음으로</a>
		<a href="/Ch06/user4/list4.jsp">User4 목록</a>
		
		<form action="/Ch06/user4/modify4Proc.jsp" method="post">
			<table border="1">
				<tr>
					<td style="display: none">
						<input type="number" name="seq" value="<%= vo4.getSeq() %>">
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%= vo4.getName() %>"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="number" name="gender" value="<%= vo4.getGender() %>"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" value="<%= vo4.getAge() %>"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr" value="<%= vo4.getAddr() %>"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="정보수정"></td>
				</tr>
			</table>
		</form>		
	</body>
</html>