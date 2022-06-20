package com.myworld.spring.DAO;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myworld.spring.DTO.UserDTO;
import com.myworld.spring.DTO.paperDTO;


@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	//모든 게시글 불러오기
	public List<Map<String, Object>> select_list() {
		
		List<Map<String, Object>> list = this.sql.selectList("select_list");
		System.out.println("DAO 클래스 - "+list);
		return list;
	}
	
	public int insert_paper(paperDTO paper) {
		return this.sql.insert("insert_paper", paper);

	}
	
	public paperDTO select_detail(int board_id) {
		return this.sql.selectOne("select_detail", board_id);
	}
	
	//게시글 삭제
	public int delete_paper(int board_id) {
		return this.sql.delete("delete_paper", board_id);
	}
	
	//게시글 수정
	public int update_paper(paperDTO paper) {
		return this.sql.update("update_paper", paper);
	}
	

}
