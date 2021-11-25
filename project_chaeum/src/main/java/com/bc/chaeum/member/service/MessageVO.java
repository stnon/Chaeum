package com.bc.chaeum.member.service;

import java.sql.Date;

public class MessageVO {
	private String no;
	private int room;
	private String send_nick;
	private String recv_nick;
	private Date send_time;
	private Date read_time;
	private String content;
	private String read_chk;
	
	private String other_email;
	private String nickname;
	private String email;
	private int unread;
	
	
	public MessageVO() {}
	public MessageVO(String no, int room, String send_nick, String recv_nick, Date send_time, Date read_time,
			String content, String read_chk, String other_email, String nickname, String email, int unread) {
		super();
		this.no = no;
		this.room = room;
		this.send_nick = send_nick;
		this.recv_nick = recv_nick;
		this.send_time = send_time;
		this.read_time = read_time;
		this.content = content;
		this.read_chk = read_chk;
		this.other_email = other_email;
		this.nickname = nickname;
		this.email = email;
		this.unread = unread;
	}
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public String getSend_nick() {
		return send_nick;
	}
	public void setSend_nick(String send_nick) {
		this.send_nick = send_nick;
	}
	public String getRecv_nick() {
		return recv_nick;
	}
	public void setRecv_nick(String recv_nick) {
		this.recv_nick = recv_nick;
	}
	public Date getSend_time() {
		return send_time;
	}
	public void setSend_time(Date send_time) {
		this.send_time = send_time;
	}
	public Date getRead_time() {
		return read_time;
	}
	public void setRead_time(Date read_time) {
		this.read_time = read_time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRead_chk() {
		return read_chk;
	}
	public void setRead_chk(String read_chk) {
		this.read_chk = read_chk;
	}
	public String getOther_email() {
		return other_email;
	}
	public void setOther_email(String other_email) {
		this.other_email = other_email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getUnread() {
		return unread;
	}
	public void setUnread(int unread) {
		this.unread = unread;
	}
	
	@Override
	public String toString() {
		return "MessageVO [no=" + no + ", room=" + room + ", send_nick=" + send_nick + ", recv_nick=" + recv_nick
				+ ", send_time=" + send_time + ", read_time=" + read_time + ", content=" + content + ", read_chk="
				+ read_chk + ", other_email=" + other_email + ", nickname=" + nickname + ", email=" + email
				+ ", unread=" + unread + "]";
	}
	
	
}
