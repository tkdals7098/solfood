package com.solfood.dto;

import java.util.Date;

public class CommentVO {

	private int reply_num; //댓글 번호
    private int board_num;	//댓글이 달릴 게시글 번호
    private String reply_content;	//댓글내용
    private String reply_writer;	//댓글 작성자
    private Date reply_date;		//댓글 작성시간
    
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getAccount_user() {
		return reply_writer;
	}
	public void setAccount_user(String account_user) {
		this.reply_writer = account_user;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	@Override
	public String toString() {
		return "CommentVO [reply_num=" + reply_num + ", board_num=" + board_num + ", reply_content=" + reply_content
				+ ", reply_writer=" + reply_writer + ", reply_date=" + reply_date + "]";
	}



}
