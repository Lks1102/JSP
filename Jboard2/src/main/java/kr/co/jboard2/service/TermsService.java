package kr.co.jboard2.service;

import kr.co.jboard2.dao.TermsDAO;
import kr.co.jboard2.dto.TermsDTO;

public enum TermsService {
	INSTANCE;
	
	private TermsDAO dao = TermsDAO.getInstance();
	
	public TermsDTO selectTerms() {
		return dao.selectTerms();
	}
}
