<%@page import="kr.Farmstory1.dto.ArticleDTO"%>
<%@page import="kr.Farmstory1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String group	= request.getParameter("group");
	String cate		= request.getParameter("cate");
	String parent	= request.getParameter("parent");
	String content	= request.getParameter("content");
	String writer	= request.getParameter("writer");
	String regip 	= request.getRemoteAddr();
	
	
	ArticleDTO dto = new ArticleDTO();
	dto.setParent(parent);
	dto.setContent(content);
	dto.setWriter(writer);
	dto.setRegip(regip);
	
	ArticleDAO dao = new ArticleDAO();
	// 댓글 입력
	dao.insertComment(dto);
	
	// 댓글 카운트 수정
	dao.updateAticleForCommentPlus(parent);
	
	response.sendRedirect("/Farmstory1/board/view.jsp?group="+group+"&cate="+cate+"&no="+parent);
%>