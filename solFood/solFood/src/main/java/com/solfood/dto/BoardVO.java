package com.solfood.dto;

import java.util.Date;

/*VO(Value Object) : DB의 정보를 객체화 시키는 용도*/
public class BoardVO {
	private int board_num;
    private Date board_date;
    private String board_title;
    private String board_category;
    private String board_content;
    private String board_file;
    private int board_readcount;
    private String board_comment;
    private String account_user;
    private int account_grade;
    
    
///////////////////가상번호//////////////////////////////    

///////////////////////////////////////////////////////////	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_file() {
		return board_file;
	}
	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}
	public int getBoard_readcount() {
		return board_readcount;
	}
	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}
	public String getBoard_comment() {
		return board_comment;
	}
	public void setBoard_comment(String board_comment) {
		this.board_comment = board_comment;
	}
	public String getAccount_user() {
		return account_user;
	}
	public void setAccount_user(String account_user) {
		this.account_user = account_user;
	}
	public int getAccount_grade() {
		return account_grade;
	}
	public void setAccount_grade(int account_grade) {
		this.account_grade = account_grade;
	}
	@Override
	public String toString() {
		return "BoardVO [board_num=" + board_num + ", board_date=" + board_date
				+ ", board_title=" + board_title + ", board_category=" + board_category + ", board_content="
				+ board_content + ", board_file=" + board_file + ", board_readcount=" + board_readcount
				+ ", board_comment=" + board_comment + ", account_user=" + account_user + ", account_grade="
				+ account_grade + "]";
	}
    
}
