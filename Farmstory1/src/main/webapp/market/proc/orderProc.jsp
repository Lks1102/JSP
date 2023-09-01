<%@page import="kr.Farmstory1.dao.OrderDAO"%>
<%@page import="kr.Farmstory1.dto.UserDTO"%>
<%@page import="kr.Farmstory1.dto.OrderDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");
	request.setCharacterEncoding("UTF-8");
	
	String buyer	  = request.getParameter("buyer");
	String hp		  = request.getParameter("hp");
	String zip		  = request.getParameter("zip");
	String addr1	  = request.getParameter("addr1");
	String addr2	  = request.getParameter("addr2");
	String etc		  = request.getParameter("etc");
	String pNo		  = request.getParameter("pNo");
	String delivery	  = request.getParameter("delivery");
	String count	  = request.getParameter("count");
	String price 	  = request.getParameter("price");
	String finalPrice = request.getParameter("finalPrice");
	
	OrderDTO dto = new OrderDTO();
	dto.setOrderProduct(pNo);
	dto.setOrderCount(count);
	dto.setOrderDelivery(delivery);
	dto.setOrderPrice(price);
	dto.setOrderTotal(finalPrice);
	dto.setReceiver(buyer);
	dto.setHp(hp);
	dto.setZip(zip);
	dto.setAddr1(addr1);
	dto.setAddr2(addr2);
	dto.setOrderEtc(etc);
	dto.setOrderUser(sessUser.getUid());
	
	OrderDAO dao = new OrderDAO();
	dao.insertOrder(dto);
	
	response.sendRedirect("/Farmstory1/");
	
	
	
	
	
	
	
	
%>