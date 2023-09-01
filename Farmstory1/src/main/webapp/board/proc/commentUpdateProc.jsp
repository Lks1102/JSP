<%@page import="kr.Farmstory1.dto.ArticleDTO"%>
<%@page import="kr.Farmstory1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String parent = request.getParameter("parent");
	String comment = request.getParameter("comment");
	
	ArticleDAO dao = new ArticleDAO();
	dao.updateComment(no, comment);
	
	response.sendRedirect("/Farmstory1/view.jsp?no="+parent);	
%>