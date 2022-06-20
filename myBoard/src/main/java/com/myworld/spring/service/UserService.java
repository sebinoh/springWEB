package com.myworld.spring.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myworld.spring.DAO.userDAO;
import com.myworld.spring.DTO.UserDTO;

@Service
public class UserService {
	
	@Autowired
	private userDAO dao;
	
	//회원가입
	public String createUser(Map<String, Object> map) {
		
		 int affectRowCount = this.dao.isertUser(map);	//삽입한 데이터(row)의 개수 반환
		    if (affectRowCount ==  1) {
		        return map.get("id").toString();
		    }
		    return null;
	}
	
	//로그인 검사
	public UserDTO checkUser(UserDTO user) {
		System.out.println("checkUser() Service들어옴...");
		return dao.select_user_by_email_and_password(user);
	}
	

}
