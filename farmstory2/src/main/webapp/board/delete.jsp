<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	
	
	response.sendRedirect("./list.jsp?group="+group+"&cate="+cate);
	
%>