package kr.co.jboard2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jboard2.dto.ArticleDTO;
import kr.co.jboard2.dto.UserDTO;
import kr.co.jboard2.service.ArticleService;

@WebServlet("/list.do")
public class ListController extends HttpServlet{

	private static final long serialVersionUID = 3242342341L;
	private ArticleService aService = ArticleService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 현재 세션 가져오기
		HttpSession session = req.getSession();
		UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");

		// Data 수신
		String pg = req.getParameter("pg");
		String search = req.getParameter("search");

		// 현재 페이지 번호
		int currentPage = aService.getCurrentPage(pg);

		// 전체 게시물 갯수 or 제목 검색
		int total = aService.selectCountTotal(search);

		// 마지막 페이지 번호
		int lastPageNum = aService.getLastPageNum(total);

		// 페이지 그룹 start, end 번호
		int[] result = aService.getPageGroupNum(currentPage, lastPageNum);
		
		// 페이지 시작번호
		int pageStartNum = aService.getPageStartNum(total, currentPage);
		
		// 시작 인덱스
		int start = aService.getStartNum(currentPage);
		
		// 글 조회
		List<ArticleDTO> articles = aService.selectArticles(start, search);
		
		if(sessUser != null) {
			
			// VIEW 공유 참조
			req.setAttribute("articles", articles);
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("lastPageNum", lastPageNum);
			req.setAttribute("pageGroupStart", result[0]);
			req.setAttribute("pageGroupEnd", result[1]);
			req.setAttribute("pageStartNum", pageStartNum+1);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("list.jsp");
			dispatcher.forward(req, resp);			
		}else {
			resp.sendRedirect("/Jboard2/user/login.do?success=101");
		}
	}

}
