<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 인코딩 설정
	request.setCharacterEncoding("UTF-8");
	
	// 전송데이터 수신
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String auto = request.getParameter("auto");
	
	
	// 회원여부 확인
	if(pw.equals("1234")) {
		
		
		// 자동 로그인 처리(체크박스 O)
		if(auto != null){
			Cookie autoCookie = new Cookie("cid", id);
			autoCookie.setMaxAge(60*3);
			response.addCookie(autoCookie);		
		}
		
		// 회원 -> 세션 기록
		session.setAttribute("sessid", id);
		response.sendRedirect("./loginSuccess.jsp");

	}else {
		// 비회원
		response.sendRedirect("./loginForm.jsp");
		
	}
	

%>