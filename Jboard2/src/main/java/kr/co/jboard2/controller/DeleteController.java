package kr.co.jboard2.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dto.ArticleDTO;
import kr.co.jboard2.service.ArticleService;
import kr.co.jboard2.service.FileService;

@WebServlet("/delete.do")
public class DeleteController extends HttpServlet{

	private static final long serialVersionUID = 234811L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService aService = ArticleService.INSTANCE;
	private FileService fService = FileService.INSTANCE;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 데이터 수신
		String no = req.getParameter("no");
		logger.debug("no : " + no);
		
		// File Delete (DB)
		int result = fService.deleteFile(no);
		
		// Article + Comment Delete
		aService.deleteArticle(no);

		// File Delete (Directory)
		if(result > 0) {
			
			String path = aService.getFilePath(req);
			
			File file = new File(path+"/"+"");
			
			if(file.exists()) {
				file.delete();	
			}
			
		}
		resp.sendRedirect("/Jboard2/list.do");
	}
	
}
