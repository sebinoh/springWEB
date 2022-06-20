package com.myworld.spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myworld.spring.DAO.BoardDAO;
import com.myworld.spring.DTO.UserDTO;
import com.myworld.spring.DTO.paperDTO;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO dao;
	
	//모든 게시글 데이터 호출
	public List<Map<String, Object>> showAllArticle(){
		List<Map<String, Object>> list = this.dao.select_list();
		System.out.println("Service 클래스 - "+list);

		return list;
	}
	
	public String insert_paper(paperDTO paper, UserDTO user) {
		paper.setWriter(user.getId());
		int result = dao.insert_paper(paper);
		if(result ==1) {
			return Integer.toString(paper.getWriter());	//작성자 고유 번호를 넘김
		}
		else {
			return null;
		}
		
	}
	
	public paperDTO showDetail(int board_id) {
		return this.dao.select_detail(board_id);
	}
	
	//게시글 삭제
	public boolean delete_paper(int board_id) {
		int result = this.dao.delete_paper(board_id);
		if(result >0) {
			return true;
		}
		else {
			return false;
		}
	}
	
	//게시글 수정
	public boolean update_paper(paperDTO paper) {
		System.out.println("service 단 update_paper() 들어옴...");
		//줄바꿈 문자 변환
		String convertContent = paper.getContent().replaceAll("\r\n", "<br>");
		paper.setContent(convertContent);
		int result = this.dao.update_paper(paper);
		System.out.println("result 값은   =========================="+result);
		if(result ==1) {
			return true;
		}
		else {
			return false;
		}
	}
	

}
