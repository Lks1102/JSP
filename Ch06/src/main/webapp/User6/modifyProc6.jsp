<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid	= request.getParameter("uid");
	String name = request.getParameter("name");
	String hp 	= request.getParameter("hp");
	String age	= request.getParameter("age");
	int result = 0;
	
	try{

		// JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		// JNDI 기본 환경이름
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		//커넥션 풀에서 커넥션 가져오기
		DataSource ds = (DataSource)ctx.lookup("jdbc/userdb");
		Connection conn = ds.getConnection();

		PreparedStatement psmt = conn.prepareStatement("update `user6` set `name`=?, `hp`=?, `age`=? where `uid`=?");
		psmt.setString(1, name);
		psmt.setString(2, hp);
		psmt.setString(3, age);
		psmt.setString(4, uid);
		
		result = psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

	
	String jsonData = "{\"result\":"+result+"}";
	
	out.print(jsonData);
	
%>