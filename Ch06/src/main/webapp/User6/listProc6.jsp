<%@page import="com.google.gson.Gson"%>
<%@page import="vo.User2VO"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	List<User2VO> users = new ArrayList<>();
	
	try{
		Context initCtx = new InitialContext();		
		Context ctx = (Context) initCtx.lookup("java:comp/env");		

		DataSource ds = (DataSource)ctx.lookup("jdbc/userdb");
		Connection conn = ds.getConnection();
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `user6`");
		
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

	Gson gson = new Gson();
	String jsonData = gson.toJson(users);
	
	out.print(jsonData);
	
%>