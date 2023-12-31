package kr.co.jboard2.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jboard2.service.UserService;

@WebServlet("/user/findPassChange.do")
public class FindPassChangeController extends HttpServlet {

	private static final long serialVersionUID = 1423589459043L;
	private UserService service = UserService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String uid = (String) session.getAttribute("uid");
		
		if(uid == null) {
			resp.sendRedirect("/Jboard2/user/findPass.do");
		}else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/user/findPassChange.jsp");
			dispatcher.forward(req, resp);
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid  = req.getParameter("uid");
		String pass = req.getParameter("pass1");
		
		service.updateUserPass(uid, pass);
	
		resp.sendRedirect("/Jboard2/user/login.do?success=300");
		
	}
	
}
