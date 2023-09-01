<%@page import="kr.Farmstory1.dto.UserDTO"%>
<%@page import="kr.Farmstory1.dao.UserDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid   = request.getParameter("uid");
	String name  = request.getParameter("name");
	String nick  = request.getParameter("nick");
	String zip   = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
 	String regip = request.getRemoteAddr();

 	UserDTO dto = new UserDTO();
 	dto.setUid(uid);
 	dto.setName(name);
 	dto.setNick(nick);
 	dto.setZip(zip);
 	dto.setAddr1(addr1);
 	dto.setAddr2(addr2);
 	dto.setRegip(regip);
 	
	UserDAO.getInstance().insertUser(dto);
	
	response.sendRedirect("/Farmstory1");
%>