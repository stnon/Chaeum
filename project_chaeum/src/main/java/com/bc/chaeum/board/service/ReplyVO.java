package com.bc.chaeum.board.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReplyVO {
	private int r_id;
	private String r_content;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd HH:mm", timezone = "Asia/Seoul" )
	private Date r_regdate;
	private String r_writer;
	private int board_id;
	private String nickname;
	
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	
	public Date getR_regdate() {
		return r_regdate;
	}
	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}
	
//	public Timestamp getR_regdate() {
//	return r_regdate;
//	}
//	public void setR_regdate(Timestamp r_regdate) {
//	this.r_regdate = r_regdate;
//	}		
	
//	public String getR_regdate() {
//		return r_regdate;
//	}
//	public void setR_regdate(String r_regdate) {
//		this.r_regdate = r_regdate;
//	}
	
	public String getR_writer() {
		return r_writer;
	}
	
	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	@Override
	public String toString() {
		return "ReplyVO [r_id=" + r_id + ", r_content=" + r_content + ", r_regdate=" + r_regdate + ", r_writer="
				+ r_writer + ", board_id=" + board_id + ", nickname=" + nickname + "]";
	}
	
	
}