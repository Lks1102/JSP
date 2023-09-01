<%@page import="kr.Farmstory1.dto.ArticleDTO"%>
<%@page import="kr.Farmstory1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String group	= request.getParameter("group");
	String cate		= request.getParameter("cate");
	String title	= request.getParameter("title");
	String content	= request.getParameter("content");
	String file		= request.getParameter("file");
	String no		= request.getParameter("no");
	
	ArticleDTO dto = new ArticleDTO();
	dto.setNo(no);
	dto.setTitle(title);
	dto.setContent(content);
	
	ArticleDAO dao = new ArticleDAO();
	dao.updateArticle(dto);
	
	
	response.sendRedirect("/Farmstory1/board/list.jsp?group="+group+"&cate="+cate);
%>