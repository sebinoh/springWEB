package com.myworld.spring.DTO;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class UserDTO {
	private int id;
	private String email;
	private String password;
	private String name;
	private Date birth;
	public String getEmail() {
		return email;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	
	

}
