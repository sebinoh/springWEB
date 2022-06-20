package com.myworld.spring.DAO;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myworld.spring.DTO.UserDTO;

@Repository
public class userDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	//회원가입
	public int isertUser(Map<String, Object> map) {
		System.out.println(map);
		return this.sql.insert("insertUser", map);
	}
	
	//로그인 검사
	public UserDTO select_user_by_email_and_password(UserDTO user) {
		System.out.println("select_user_by_email_and_password() DAO들어옴...");
		UserDTO d = this.sql.selectOne("select_user_by_email_and_password", user);
		System.out.println("로그인 검사 결과 = "+ d);
		 return d;
	}
}
