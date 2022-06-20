package com.myworld.spring.DTO;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class paperDTO {
	private int board_id;	//글 번호
	private String title; //제목
	private String content; //내용
	private Date write_date; //작성 일시
	private int writer;	//작성자 고유번호
	private String writer_name; //작성자 이름
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public String getWriter_name() {
		return writer_name;
	}
	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}
	
	

}
